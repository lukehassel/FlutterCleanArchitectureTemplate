/*
import 'package:clean_architecture_template/core/network/basicRequest/basic_dio_request_impl.dart';
import 'package:clean_architecture_template/core/network/basicRequest/basic_request.dart';
import 'package:clean_architecture_template/core/network/connectivity/connectivity_info.dart';
import 'package:clean_architecture_template/core/network/connectivity/connectivity_info_impl.dart';
import 'package:clean_architecture_template/features/feature_name/data/datasources/ClassNameLoweX_data_source.dart';
import 'package:clean_architecture_template/features/feature_name/data/models/feature_name_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  setUp((){
    GetIt sl = GetIt.I;

    sl.registerLazySingleton<BasicRequest>(() => BasicDioRequestImpl());
    sl.registerLazySingleton<ConnectivityInfo>(() => ConnectivityInfoImpl());
  });

  group('Counter', () {
    test('test dio response', () async {
      GetIt sl = GetIt.I;
      Response response = await sl.get<BasicRequest>().send(url: '');

      //print(response.data.toString()+'  \n'+response.statusCode.toString());


      FeatureNameModel model = await FeatureNameRemoteDataSourceImpl(sl()).getFeatureName(aid: '');

      print(model.ad.text);
    });
  });



  Future<String> testa() async {
    await Future.delayed(const Duration(seconds: 5), ()=> 'asf');

  }
}
*/
