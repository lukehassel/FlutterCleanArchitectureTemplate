import '../../domain/entities/feature_name_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FeatureNameState extends Equatable {
  @override
  List<Object> get props => [];
}

class FeatureNameInitialState extends FeatureNameState {}

class FeatureNameLoadingState extends FeatureNameState {}

class FeatureNameLoadedState extends FeatureNameState {
  final FeatureNameEntity model;

  FeatureNameLoadedState({this.model});
}

class FeatureNameErrorState extends FeatureNameState {
  final String message;

  FeatureNameErrorState({this.message});

}

class FeatureNameOfflineState extends FeatureNameState {
  final String message;

  FeatureNameOfflineState({this.message});

}
