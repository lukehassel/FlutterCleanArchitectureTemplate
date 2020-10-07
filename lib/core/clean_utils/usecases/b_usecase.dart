import 'package:clean_architecture_template/core/error/failures/failure_expo.dart';
import 'package:dartz/dartz.dart';

abstract class BUseCase<Type, Params> {
  Either<Failure, Type> call(dynamic properties);
}
