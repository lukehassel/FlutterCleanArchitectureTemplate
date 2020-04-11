import 'dart:async';

import 'package:clean_architecture_template/core/error/exceptions.dart';
import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/core/network/connected/connected.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/test_entity.dart';
import '../../domain/repositories/test_repository.dart';
import '../datasources/test_data_source.dart';

class TestRepositoryImpl implements TestRepository {
  final TestRemoteDataSource remoteDataSource;
  final Connected connected;

  TestRepositoryImpl({
    @required this.remoteDataSource,
    @required this.connected,
  });

  @override
  Stream<Either<Exception, TestEntity>> getTest(String aid) {
    return _getTest(aid);
  }

  Stream<Either<Exception, TestEntity>> _getTest(String aid) async* {
    if (await connected.connectedToInternet()) {
      yield await connectToServer(aid);
    }
    if (await connected.accessPointNoInternet()) {
      yield Left(AccessPointNoInternetException());
    }
    if (await connected.notConnectedToAccessPoint()) {
      yield Left(NotConnectedToAccessPointException());
      await for (var value in connected.connectivityChangedStream().where((event) => connected.statusNotNone(event)).take(1)){
        print('retry'+value.toString());
        if(await connected.connectedToInternet()){
          print('retry is online');
          yield await connectToServer(aid);
        }
      }
    }
  }

  void saveData() async {}

  Future<Either<Exception, TestEntity>> connectToServer(String aid) async {
    try {
      final remoteSource = await remoteDataSource.getTest(aid: aid);

      saveData();

      print(remoteSource.data);

      return Right(remoteSource);
    } catch (e){
      return Left(e);
    }
  }
}
