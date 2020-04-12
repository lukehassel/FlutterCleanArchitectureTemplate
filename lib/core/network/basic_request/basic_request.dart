import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'base_options.dart';

abstract class BasicRequest{

  Future<Response> send({@required String url});

}