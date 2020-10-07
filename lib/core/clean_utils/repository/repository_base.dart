import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';
import 'package:clean_architecture_template/core/clean_utils/remote_data_source/basic_remote_data_source.dart';
import 'package:clean_architecture_template/core/database/data_object.dart';
import 'package:clean_architecture_template/core/database/database.dart';
import 'package:clean_architecture_template/core/error/failures/failure_expo.dart';
import 'package:clean_architecture_template/core/network/connected/connected.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class RepositoryBase {
  final Database db;
  final Connected connected;
  final BasicRemoteDataSource remoteDataSource;
  final String dbName;

  RepositoryBase({
    @required this.db,
    @required this.connected,
    @required this.remoteDataSource,
    @required this.dbName,
  });

  Stream<Either<Failure, EntityBase>> getDataSource(dynamic properties) async* {
    print('asdf2');
    if (dbName != null && db.exists(dbName)) {
      print('read from database:' + db.get(dbName).toString());
      yield Right(db.get(dbName));
    } else {
      if (await connected.connectedToInternet()) {
        yield await _getRemoteDatasource(properties);
      }
      if (await connected.accessPointNoInternet()) {
        yield Left(AccessPointNoInternetFailure());
      }
      if (await connected.notConnectedToAccessPoint()) {
        yield Left(NotConnectedToAccessPointFailure());
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

  Future<Either<Failure, EntityBase>> _getRemoteDatasource(
      dynamic properties) async {
    try {
      final remoteSource =
          await remoteDataSource.getRemoteSource(properties: properties);

      if (dbName != null) db.save(DataObject(key: dbName, data: remoteSource));

      return Right(remoteSource);
    } catch (e) {
      print(e);
      return Left(UnexpectedFailure(e, e.toString()));
    }
  }
}
