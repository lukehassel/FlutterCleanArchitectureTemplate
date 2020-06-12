import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:dartz/dartz.dart';

abstract class FeatureNameRepository {
  Stream<Either<Exception, EntityBase>> getFeatureName(dynamic properties);
}
