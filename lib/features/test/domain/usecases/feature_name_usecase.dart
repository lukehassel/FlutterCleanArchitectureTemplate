import 'package:clean_architecture_template/core/usecases/usecase.dart';
import '../repositories/feature_name_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../entities/feature_name_entity.dart';

class GetFeatureNameUseCase implements UseCase<FeatureNameEntity, dynamic> {
  final FeatureNameRepository repository;

  GetFeatureNameUseCase(this.repository);

  @override
  Stream<Either<Exception, FeatureNameEntity>> call(dynamic properties) {
    return repository.getFeatureName(properties);
  }
}

class Params extends Equatable {
  final String aid;

  Params({@required this.aid});

  @override
  List<Object> get props => [aid];
}
