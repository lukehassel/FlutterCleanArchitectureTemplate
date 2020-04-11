import 'package:clean_architecture_template/core/error/exceptions.dart';
import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/core/network/basicRequest/basic_request.dart';
import 'package:clean_architecture_template/core/network/connectivity/connectivity_info.dart';
import 'package:clean_architecture_template/core/network/dio/base_options.dart';
import 'package:clean_architecture_template/core/network/dio/interceptors/connection_change_interceptor.dart';
import 'package:clean_architecture_template/core/network/dio/retry_request.dart';
import 'package:clean_architecture_template/core/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BasicDioRequestImpl implements BasicRequest {
  Dio dio;

  BasicDioRequestImpl() {
    dio = Dio();

    /*dio.interceptors.add(
      ConnectionChangeInterceptor(
        retryRequest: RetryRequest(
            dio: Dio(),
            connectivityInfo: sl.get<ConnectivityInfo>()
        ),
      ),
    );*/
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
