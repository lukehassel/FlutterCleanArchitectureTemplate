import 'dart:io';

import 'package:clean_architecture_template/core/network/dio/retry_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ConnectionChangeInterceptor extends Interceptor {
  final RetryRequest retryRequest;

  ConnectionChangeInterceptor({
    @required this.retryRequest,
  });

  @override
  Future onError(DioError err) async {
    print(err.message);
    /*if (_shouldRetry(err)) {
      try {
        return retryRequest.scheduleRequestRetry(err.request);
      } catch (e) {
        return e;
      }
    }*/
    return err;
  }

  bool _shouldRetry(DioError err) {
    print('error: '+err.message);
    return
      //err.type == DioErrorType.DEFAULT &&
        err.error != null;
  }
}