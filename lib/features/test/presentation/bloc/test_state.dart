import '../../domain/entities/test_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TestState extends Equatable {
  @override
  List<Object> get props => [];
}

class TestInitialState extends TestState {}

class TestLoadingState extends TestState {}

class TestLoadedState extends TestState {
  final TestEntity model;

  TestLoadedState({this.model});
}

class TestErrorState extends TestState {
  final String message;

  TestErrorState({this.message});

}

class TestOfflineState extends TestState {
  final String message;

  TestOfflineState({this.message});

}
