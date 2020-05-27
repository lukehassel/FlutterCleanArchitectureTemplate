import 'package:clean_architecture_template/core/exceptions/exceptions.dart';
import 'package:clean_architecture_template/core/network/basic_request/basic_request.dart';
import 'package:clean_architecture_template/core/network/basic_request/base_options.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BasicDioRequestImpl implements BasicRequest {
  Dio dio;

  BasicDioRequestImpl() {
    dio = Dio();
    dio.options = dioBaseOptions;
  }

  @override
  Future<Response> post({String url, Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> jsonMap = {
        'test': 'data',
      };
      if (body != null) {
        body.forEach((k, v) {
          jsonMap.putIfAbsent(k, () => v);
        });
      }

      FormData formData = new FormData.fromMap(jsonMap);

      final response = await dio.post(url,
          data: formData, onReceiveProgress: (int count, int total) {});

      return response;
    } on DioError catch (e) {
      throw DioException(message: e.message);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Response> get({String url}) async {
    try {
      final response = await dio.get(
        url,
        onReceiveProgress: (int count, int total) {
          print('count:' + count.toString());
          print('total:' + total.toString());
        },
      );

      return response;
    } on DioError catch (e) {
      throw DioException(message: e.message);
    } catch (e) {
      throw e;
    }
  }
}
