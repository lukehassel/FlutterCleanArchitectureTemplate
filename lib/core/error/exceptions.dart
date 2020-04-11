class DioException implements Exception{
  final String message;

  DioException({this.message});
}

class AccessPointNoInternetException implements Exception {}

class NotConnectedToAccessPointException implements Exception {}
