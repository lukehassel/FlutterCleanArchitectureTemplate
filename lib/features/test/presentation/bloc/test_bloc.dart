import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_template/core/error/exceptions.dart';
import 'package:clean_architecture_template/core/error/map_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../domain/entities/test_entity.dart';
import '../../domain/usecases/test_usecase.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final GetTestUseCase getTestUseCase;

  TestBloc({
    @required this.getTestUseCase,
  });

  @override
  TestState get initialState => TestInitialState();

  @override
  Stream<TestState> mapEventToState(TestEvent event) async* {
    if (event is GetTestEvent) {
      print('event called');
      yield TestLoadingState();
      final failureOrModel = getTestUseCase(Params(aid: event.aid));
      await for (var value in failureOrModel){
        print('received value'+value.toString());
        yield* _eitherLoadedOrErrorState(value);
      }
    }
  }

  Stream<TestState> _eitherLoadedOrErrorState(
      Either<Exception, TestEntity> failureOrTrivia,) async* {
    yield failureOrTrivia.fold(
          (exception) {
            if(exception is AccessPointNoInternetException || exception is NotConnectedToAccessPointException){
              return TestOfflineState(message: MapException().exceptionToMessage(exception));
            }else{
              return TestErrorState(message: MapException().exceptionToMessage(exception));
            }
          },
          (model) => TestLoadedState(model: model),
    );
  }
}