import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:clean_architecture_template/core/exceptions/exceptions.dart';
import 'package:clean_architecture_template/core/exceptions/map_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../domain/entities/feature_name_entity.dart';
import '../../domain/usecases/feature_name_usecase.dart';

class FeatureNameBloc extends Bloc<FeatureNameEvent, FeatureNameState> {
  final GetFeatureNameUseCase getFeatureNameUseCase;

  FeatureNameBloc({
    @required this.getFeatureNameUseCase,
  });

  @override
  FeatureNameState get initialState => FeatureNameInitialState();

  @override
  Stream<FeatureNameState> mapEventToState(FeatureNameEvent event) async* {
    if (event is GetFeatureNameEvent) {
      print('event called');
      yield FeatureNameLoadingState();
      final failureOrModel = getFeatureNameUseCase(event.aid);
      await for (var value in failureOrModel) {
        print('received value' + value.toString());
        yield* _eitherLoadedOrErrorState(value);
      }
    }
  }

  Stream<FeatureNameState> _eitherLoadedOrErrorState(
    Either<Exception, EntityBase> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (exception) {
        if (exception is AccessPointNoInternetException ||
            exception is NotConnectedToAccessPointException) {
          return FeatureNameOfflineState(
              message: MapException().exceptionToMessage(exception));
        } else {
          return FeatureNameErrorState(
              message: MapException().exceptionToMessage(exception));
        }
      },
      (model) => FeatureNameLoadedState(model: model),
    );
  }
}
