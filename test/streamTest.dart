import 'dart:async';

import 'package:clean_architecture_template/core/network/basicRequest/basic_dio_request_impl.dart';
import 'package:clean_architecture_template/core/network/basicRequest/basic_request.dart';
import 'package:clean_architecture_template/core/network/connectivity/connectivity_info.dart';
import 'package:clean_architecture_template/core/network/connectivity/connectivity_info_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {

  setUp((){

  });


  Stream<int> intStream() async*{
    for(int i = 0;i<9;i++){
      yield i;
    }
  }

  Future<int> foo() async {
    print('testa start');

    StreamSubscription streamSubscription;
    /*return intStream().map((value) => (){
      String data = value.toString();
      print('value '+value.toString());
      return value;
    },).where((value) => value!=null);*/

    return intStream().where((event) => event!=null).first;

  }

  group('Counter', () {
    test('stream test', () async {


      /*await for (var value in testasdf()){
        print('stream end'+value.toString());
      }*/
      var i = await foo();
      print(i);

    });
  });
}