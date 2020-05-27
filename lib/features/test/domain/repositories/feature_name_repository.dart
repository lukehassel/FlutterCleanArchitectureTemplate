import '../entities/feature_name_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FeatureNameRepository {
  Stream<Either<Exception, FeatureNameEntity>> getFeatureName(
      dynamic properties);
}
