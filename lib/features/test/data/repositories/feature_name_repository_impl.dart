import 'dart:async';
import 'package:clean_architecture_template/core/exceptions/exceptions.dart';
import 'package:clean_architecture_template/core/network/connected/connected.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/feature_name_entity.dart';
import '../../domain/repositories/feature_name_repository.dart';
import '../datasources/feature_name_data_source.dart';

class FeatureNameRepositoryImpl implements FeatureNameRepository {
  final FeatureNameRemoteDataSource remoteDataSource;
  final Connected connected;

  FeatureNameRepositoryImpl({
    @required this.remoteDataSource,
    @required this.connected,
  });

  @override
  Stream<Either<Exception, FeatureNameEntity>> getFeatureName(String aid) {
    return _getFeatureName(aid);
  }

  Stream<Either<Exception, FeatureNameEntity>> _getFeatureName(String aid) async* {
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

  Future<Either<Exception, FeatureNameEntity>> connectToServer(String aid) async {
    try {
      final remoteSource = await remoteDataSource.getFeatureName(aid: aid);

      saveData();

      print(remoteSource.data);

      return Right(remoteSource);
    } catch (e){
      return Left(e);
    }
  }
}
