import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:clean_architecture_template/core/clean_utils/usecases/usecase.dart';
import 'package:clean_architecture_template/core/error/failures/failure_expo.dart';

import '../repositories/feature_name_repository.dart';
import 'package:dartz/dartz.dart';

class GetFeatureNameUseCase implements UseCase<EntityBase, dynamic> {
  final FeatureNameRepository repository;

  GetFeatureNameUseCase(this.repository);

  @override
  Stream<Either<Failure, EntityBase>> getStream(dynamic properties) {
    final stream = repository.getFeatureName(properties);

    return nextStream(stream);
  }
}

Stream<Either<Failure, EntityBase>> nextStream(Stream s) async* {
  await for (var value in s) {
    value.fold((l) {
      return l;
    }, (entity) {});
    yield value;
  }
}
