import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Stream<Either<Exception, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}