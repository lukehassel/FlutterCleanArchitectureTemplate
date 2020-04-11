import 'package:clean_architecture_template/core/error/failures.dart';

import '../entities/test_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TestRepository {
  Stream<Either<Exception, TestEntity>> getTest(String aid);
}
