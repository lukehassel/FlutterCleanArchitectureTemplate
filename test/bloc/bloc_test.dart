/*
import 'package:clean_architecture_template/core/network/connectivity/connectivity_info.dart';
import 'package:clean_architecture_template/core/network/connectivity/connectivity_info_impl.dart';
import 'package:clean_architecture_template/core/network/network_injection_container.dart';
import 'package:clean_architecture_template/features/test/presentation/bloc/bloc.dart';
import 'package:clean_architecture_template/features/test/feature_name_injection_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  setUp((){
    GetIt sl = GetIt.I;
    initNetworkInjectionContainer();
    initFeatureName();
  });

  group('Counter', () {
    test('test bloc', () async {
      GetIt sl = GetIt.I;

      sl.get<TestBloc>().add(GetFeatureNameEvent(aid: '2'));

      sl.get<FeatureNameBloc>().listen((state) {
        print('state: '+state.toString());
        if(state is FeatureNameLoadedState){
          print('loaded'+state.model.data.length.toString());
        }

      });

    });
  });

}*/
