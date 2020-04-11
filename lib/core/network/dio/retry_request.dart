import 'dart:async';

import 'package:clean_architecture_template/core/network/connectivity/connectivity_info.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RetryRequest {
  final Dio dio;

  ConnectivityInfo connectivityInfo;

  RetryRequest({@required this.dio, @required this.connectivityInfo});

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    print('retry');


    //print((await connectivityInfo.physicallyConnected()).toString()+'  '+(await connectivityInfo.isOnline()).toString());
    /*streamSubscription = Connectivity().onConnectivityChanged.listen((status) async {
      if (connectivityInfo.physicallyConnectedWithStatus(status) &&
          await connectivityInfo.isOnline()) {
        //streamSubscription.cancel();
        responseCompleter.complete(
          dio.request(
            requestOptions.path,
            cancelToken: requestOptions.cancelToken,
            data: requestOptions.data,
            onReceiveProgress: requestOptions.onReceiveProgress,
            onSendProgress: requestOptions.onSendProgress,
            queryParameters: requestOptions.queryParameters,
            options: requestOptions,
          ),
        );
      }
    });*/

    return responseCompleter.future;
  }
}
