import 'package:dio/dio.dart';

//todo add singleton
BaseOptions dioBaseOptions = new BaseOptions(
  baseUrl: "https://mnmnmbm.free.beeceptor.com",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
