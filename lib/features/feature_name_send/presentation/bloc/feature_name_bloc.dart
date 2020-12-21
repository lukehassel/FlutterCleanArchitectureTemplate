import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:clean_architecture_template/core/error/exceptions/map_exceptions.dart';
import 'package:clean_architecture_template/core/error/failures/failure_expo.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../domain/usecases/feature_name_usecase.dart';

class FeatureNameBloc extends Bloc<FeatureNameEvent, FeatureNameState> {
  final GetFeatureNameUseCase getFeatureNameUseCase;

  FeatureNameBloc({
    @required this.getFeatureNameUseCase,
  }) : super(FeatureNameInitialState());

  @override
  Stream<FeatureNameState> mapEventToState(FeatureNameEvent event) async* {
    if (event is GetFeatureNameEvent) {
      print('event called');
      yield FeatureNameLoadingState();
      final failureOrModel =
          getFeatureNameUseCase.getStream(event.requestEntity);
      print(failureOrModel.toString());
      //if (failureOrModel != null) {
      await for (var value in failureOrModel) {
        print('received value' + value.toString());
        //yield* _eitherLoadedOrErrorState(value);
      }
    }
  }

  Stream<FeatureNameState> _eitherLoadedOrErrorState(
    Either<Failure, EntityBase> exceptionOrEntity,
  ) async* {
    yield exceptionOrEntity.fold(
      (failure) {
        //failure to specific state
        if (failure is AccessPointNoInternetFailure ||
            failure is NotConnectedToAccessPointFailure) {
          return FeatureNameOfflineState(
              message: MapFailures().failureToMessage(failure));
        } else if (failure is UnexpectedFailure) {
          return FeatureNameErrorState(message: failure.getExceptionMessage);
        } else {
          return FeatureNameErrorState(
              message: MapFailures().failureToMessage(failure));
        }
        //else all other failure
      },
      (model) => FeatureNameLoadedState(model: model),
    );
  }
}
