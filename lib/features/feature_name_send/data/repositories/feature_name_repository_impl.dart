import 'dart:async';
import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:clean_architecture_template/core/clean_utils/repository/repository_base.dart';
import 'package:clean_architecture_template/core/database/data_object.dart';
import 'package:clean_architecture_template/core/database/database.dart';
import 'package:clean_architecture_template/core/error/exceptions/exceptions.dart';
import 'package:clean_architecture_template/core/error/failures/failure_expo.dart';
import 'package:clean_architecture_template/core/network/connected/connected.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../domain/repositories/feature_name_repository.dart';
import '../datasources/feature_name_data_source.dart';

class FeatureNameRepositoryImpl implements FeatureNameRepository {
  final FeatureNameRemoteDataSource remoteDataSource;
  final Connected connected;
  final Database db;

  FeatureNameRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.connected,
      @required this.db});

  @override
  Stream<Either<Failure, EntityBase>> getFeatureName(dynamic properties) {
    return RepositoryBase(
            dbName: null, //-> caching disabled
            db: db,
            remoteDataSource: remoteDataSource,
            connected: connected)
        .getDataSource(properties);
  }
}
