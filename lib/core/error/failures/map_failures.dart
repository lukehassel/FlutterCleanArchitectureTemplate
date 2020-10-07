import 'package:clean_architecture_template/core/error/exceptions/exceptions.dart';
import 'package:clean_architecture_template/core/error/failures/failures.dart';
import 'package:clean_architecture_template/core/i18n/error_i18n.dart';

class MapFailures {
  String failureToMessage(Failure failure) {
    print('mapping exception' + failure.runtimeType.toString());
    switch (failure.runtimeType) {
      case AccessPointNoInternetFailure:
        return ErrorI18n().ACCESSPOINT_NOINTERNET_FAILURE;
      case NotConnectedToAccessPointFailure:
        return ErrorI18n().NOTCONNECTED_TOACCESSPOINT_FAILURE;
      case UnexpectedFailure:
        return (failure as UnexpectedFailure).getExceptionMessage;
      default:
        return 'Unexpected Failure';
    }
  }
}
