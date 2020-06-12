import 'package:clean_architecture_template/core/exceptions//exceptions.dart';
import 'package:clean_architecture_template/core/i18n/error_i18n.dart';
import 'package:dio/dio.dart';

class MapException {
  String exceptionToMessage(Exception exception) {
    print('mapping exception' + exception.runtimeType.toString());
    switch (exception.runtimeType) {
      case AccessPointNoInternetException:
        return ErrorI18n().ACCESSPOINT_NOINTERNET_FAILURE;
      case NotConnectedToAccessPointException:
        return ErrorI18n().NOTCONNECTED_TOACCESSPOINT_FAILURE;
      case DioError:
        //print('mapped dio exception' + (exception as DioException).message);
        return (exception as DioError).message;
        break;
      default:
        return exception.toString();
    }
  }
}
