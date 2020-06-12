import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Stream<Either<Exception, Type>> call(dynamic properties);
}
