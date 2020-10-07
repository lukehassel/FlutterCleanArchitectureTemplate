import 'package:dio/dio.dart';

class MapException {
  String exceptionToMessage(Exception exception) {
    print('mapping exception' + exception.runtimeType.toString());
    switch (exception.runtimeType) {
      case DioError:
        //print('mapped dio exception' + (exception as DioException).message);
        return (exception as DioError).message;
        break;
      default:
        return exception.toString();
    }
  }
}
