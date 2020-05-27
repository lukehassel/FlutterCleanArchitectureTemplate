import 'package:clean_architecture_template/core/database/data_object.dart';
import 'package:clean_architecture_template/core/database/database.dart';
import 'package:clean_architecture_template/core/exceptions/exceptions.dart';
import 'package:clean_architecture_template/core/network/connected/connected.dart';
import 'package:clean_architecture_template/core/remote_data_source/basic_remote_data_source.dart';
import 'package:clean_architecture_template/features/test/domain/entities/feature_name_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class RepositoryBase {
  final Database db;
  final Connected connected;
  final BasicRemoteDataSource remoteDataSource;

  RepositoryBase(
      {@required this.db,
      @required this.connected,
      @required this.remoteDataSource});

  Stream<Either<Exception, FeatureNameEntity>> getDataSource(
      dynamic properties) async* {
    if (db.exists((FeatureNameEntity).toString())) {
      print('read from database:' +
          db.get((FeatureNameEntity).toString()).toString());
      yield Right(db.get((FeatureNameEntity).toString()));
    } else {
      if (await connected.connectedToInternet()) {
        yield await _getRemoteDatasource(properties);
      }
      if (await connected.accessPointNoInternet()) {
        yield Left(AccessPointNoInternetException());
      }
      if (await connected.notConnectedToAccessPoint()) {
        yield Left(NotConnectedToAccessPointException());
        await for (var value in connected
            .connectivityChangedStream()
            .where((event) => connected.statusNotNone(event))
            .take(1)) {
          print('retry' + value.toString());
          if (await connected.connectedToInternet()) {
            print('retry is online');
            yield await _getRemoteDatasource(properties);
          }
        }
      }
    }
  }

  Future<Either<Exception, FeatureNameEntity>> _getRemoteDatasource(
      dynamic properties) async {
    try {
      final remoteSource =
          await remoteDataSource.getRemoteSource(properties: properties);

      db.save(
          DataObject(key: (FeatureNameEntity).toString(), data: remoteSource));

      return Right(remoteSource);
    } catch (e) {
      print(e);
      return Left(e);
    }
  }
}
