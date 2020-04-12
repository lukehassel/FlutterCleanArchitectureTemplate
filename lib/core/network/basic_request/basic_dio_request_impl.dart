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
  Future<Response> send({@required String url}) async {
    try {
      final response = await dio.get('');

      return response;
    } on DioError catch (e) {
      throw DioException(message: e.message);
    } catch (e){
      throw e;
    }
  }
}
