import 'package:clean_architecture_template/core/usecases/usecase.dart';
import '../repositories/feature_name_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../entities/feature_name_entity.dart';

class GetFeatureNameUseCase implements UseCase<FeatureNameEntity, Params> {
  final FeatureNameRepository repository;

  GetFeatureNameUseCase(this.repository);

  @override
  Stream<Either<Exception, FeatureNameEntity>> call(Params params) {
    return repository.getFeatureName(params.aid);
  }
}

class Params extends Equatable {
  final String aid;

  Params({@required this.aid});

  @override
  List<Object> get props => [aid];
}

