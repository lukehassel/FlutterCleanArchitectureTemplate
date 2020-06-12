import 'dart:async';
import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:clean_architecture_template/core/clean_utils/repository/repository_base.dart';
import 'package:clean_architecture_template/core/database/data_object.dart';
import 'package:clean_architecture_template/core/database/database.dart';
import 'package:clean_architecture_template/core/exceptions/exceptions.dart';
import 'package:clean_architecture_template/core/network/connected/connected.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/feature_name_entity.dart';
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
  Stream<Either<Exception, EntityBase>> getFeatureName(dynamic properties) {
    return RepositoryBase(
            dbName: 'FeatureNameCache',
            db: db,
            remoteDataSource: remoteDataSource,
            connected: connected)
        .getDataSource(properties);
  }

  /*Future<Either<Exception, FeatureNameEntity>> connectToServer(String aid) async {
    try {
      final remoteSource = await remoteDataSource.getFeatureName(aid: aid);

      saveData();

      print(remoteSource.data);

      return Right(remoteSource);
    } catch (e){
      return Left(e);
    }
  }*/

}
