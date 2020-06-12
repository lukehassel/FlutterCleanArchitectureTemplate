import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:clean_architecture_template/core/clean_utils/usecases/usecase.dart';

import '../repositories/feature_name_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../entities/feature_name_entity.dart';

class GetFeatureNameUseCase implements UseCase<EntityBase, dynamic> {
  final FeatureNameRepository repository;

  GetFeatureNameUseCase(this.repository);

  @override
  Stream<Either<Exception, EntityBase>> call(dynamic properties) {
    return repository.getFeatureName(properties);
  }
}
