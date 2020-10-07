import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_template/core/clean_utils/usecases/result.dart';
import 'package:clean_architecture_template/core/error/failures/failure_expo.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/feature_name_usecase.dart';

import 'bloc.dart';

class FeatureNameBloc extends Bloc<FeatureNameEvent, FeatureNameState> {
  final GetFeatureNameUseCase getFeatureNameUseCase;

  FeatureNameBloc({
    @required this.getFeatureNameUseCase,
  }) : super(FeatureNameInitialState());

  @override
  Stream<FeatureNameState> mapEventToState(FeatureNameEvent event) async* {
    if (event is GetFeatureNameEvent) {
      print('event called');
      final failureOrModel = getFeatureNameUseCase(event.properties);
      yield* _eitherLoadedOrErrorState(failureOrModel);
    }
  }

  Stream<FeatureNameState> _eitherLoadedOrErrorState(
    Either<Failure, Result> exceptionOrEntity,
  ) async* {
    yield exceptionOrEntity.fold(
      (failure) {
        //else all other failures or exceptions
        return FeatureNameErrorState(
            message: MapFailures().failureToMessage(failure));
      },
      (result) => FeatureNameResultState(result: result),
    );
  }
}
