import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/core/usecases/usecase.dart';
import '../repositories/test_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../entities/test_entity.dart';

class GetTestUseCase implements UseCase<TestEntity, Params> {
  final TestRepository repository;

  GetTestUseCase(this.repository);

  @override
  Stream<Either<Exception, TestEntity>> call(Params params) {
    return repository.getTest(params.aid);
  }
}

class Params extends Equatable {
  final String aid;

  Params({@required this.aid});

  @override
  List<Object> get props => [aid];
}

