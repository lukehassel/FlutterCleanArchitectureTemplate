import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'base_options.dart';

abstract class BasicRequest {
  Future<Response> post({@required String url, Map<String, dynamic> body});
  Future<Response> get({@required String url});
}
