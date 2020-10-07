import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:clean_architecture_template/core/error/failures/failure_expo.dart';
import 'package:dartz/dartz.dart';

abstract class FeatureNameRepository {
  Stream<Either<Failure, EntityBase>> getFeatureName(dynamic properties);
}
