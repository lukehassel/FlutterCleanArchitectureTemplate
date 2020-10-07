import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:clean_architecture_template/core/clean_utils/usecases/usecase.dart';
import 'package:clean_architecture_template/core/error/failures/failure_expo.dart';

import '../repositories/feature_name_repository.dart';
import 'package:dartz/dartz.dart';

class GetFeatureNameUseCase {
  final FeatureNameRepository repository;

  GetFeatureNameUseCase(this.repository);

  //@override
  Stream<Either<Failure, EntityBase>> getStream(dynamic properties) {
    return repository.getFeatureName(properties);
  }
}

/*class GetFeatureNameUseCase {
  final FeatureNameRepository repository;

  GetFeatureNameUseCase(this.repository);

  Stream<int> getStream(dynamic properties) {
    return testStream();
  }
}*/

Stream stream = new Stream.periodic(Duration(seconds: 2));
Stream<int> testStream() async* {
  await for (var value in stream) {
    yield 3;
  }
}
