import 'package:clean_architecture_template/core/error/exceptions/map_exceptions.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class AccessPointNoInternetFailure extends Failure {}

class NotConnectedToAccessPointFailure extends Failure {}

class UnexpectedFailure extends Failure {
  Exception _exception;
  String errorMessage;

  UnexpectedFailure(dynamic error, String message) {
    if (error is Exception) {
      this._exception = error;
    } else {
      this.errorMessage = message;
    }
  }

  Exception get getException => _exception;

  String get getExceptionMessage {
    if (_exception != null) {
      return MapException().exceptionToMessage(_exception);
    } else {
      return errorMessage;
    }
  }
}
