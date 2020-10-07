import 'package:clean_architecture_template/core/clean_utils/usecases/result.dart';

import '../../../domain/entities/feature_name_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FeatureNameState extends Equatable {
  @override
  List<Object> get props => [];
}

class FeatureNameInitialState extends FeatureNameState {}

class FeatureNameResultState extends FeatureNameState {
  final Result result;

  FeatureNameResultState({this.result});
}

class FeatureNameErrorState extends FeatureNameState {
  final String message;

  FeatureNameErrorState({this.message});
}
