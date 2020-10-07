import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:clean_architecture_template/core/clean_utils/usecases/b_usecase.dart';
import 'package:clean_architecture_template/core/clean_utils/usecases/result.dart';
import 'package:clean_architecture_template/core/clean_utils/usecases/usecase.dart';
import 'package:clean_architecture_template/core/error/failures/failure_expo.dart';

import '../entities/feature_name_entity.dart';
import 'package:dartz/dartz.dart';

class GetFeatureNameUseCase implements BUseCase<Result, dynamic> {
  final FeatureNameEntity entity;

  GetFeatureNameUseCase(this.entity);

  @override
  Either<Failure, Result> call(dynamic properties) {
    String result = entity.runFeatureNameEntity(properties);

    return Right(Result(value: result));
  }
}
