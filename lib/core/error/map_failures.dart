import 'package:clean_architecture_template/core/error/exceptions.dart';
import 'package:clean_architecture_template/core/i18n/error_i18n.dart';

import 'failures.dart';

class MapException {
  String exceptionToMessage(Exception exception) {
    print('mapping exception'+exception.runtimeType.toString());
    switch (exception.runtimeType) {
      case AccessPointNoInternetException:
        return ErrorI18n().ACCESSPOINT_NOINTERNET_FAILURE;
      case NotConnectedToAccessPointException:
        return ErrorI18n().NOTCONNECTED_TOACCESSPOINT_FAILURE;
      case DioException:
        print('mapped dio exception'+(exception as DioException).message);
        return (exception as DioException).message;
        break;
      default:
        return exception.toString();
    }
  }
}
