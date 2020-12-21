import 'package:clean_architecture_template/core/error/failures/failure_expo.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Stream<Either<Failure, Type>> getStream(dynamic properties);
}
