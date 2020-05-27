import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Stream<Either<Exception, Type>> call(dynamic properties);
}
