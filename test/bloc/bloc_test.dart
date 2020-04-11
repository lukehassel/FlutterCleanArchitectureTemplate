import 'package:clean_architecture_template/core/network/basicRequest/basic_dio_request_impl.dart';
import 'package:clean_architecture_template/core/network/basicRequest/basic_request.dart';
import 'package:clean_architecture_template/core/network/connectivity/connectivity_info.dart';
import 'package:clean_architecture_template/core/network/connectivity/connectivity_info_impl.dart';
import 'package:clean_architecture_template/core/network/network_injection_container.dart';
import 'package:clean_architecture_template/features/test/presentation/bloc/bloc.dart';
import 'package:clean_architecture_template/features/test/test_injection_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  setUp((){
    GetIt sl = GetIt.I;
    initNetworkInjectionContainer();
    initTest();
  });

  group('Counter', () {
    test('test bloc', () async {
      GetIt sl = GetIt.I;

      sl.get<TestBloc>().add(GetTestEvent(aid: '2'));

      sl.get<TestBloc>().listen((state) {
        print('state: '+state.toString());
        if(state is TestLoadedState){
          print('loaded'+state.model.data.length.toString());
        }

      });

    });
  });

}