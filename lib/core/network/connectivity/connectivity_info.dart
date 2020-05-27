
import 'dart:async';

import 'package:rxdart/rxdart.dart';

abstract class ConnectivityInfo {

  ///This Connectivity library is implemented with dependency Injection so
  ///that this library can simply be replaced with another Connectivity
  ///library.

  ///Test if the device is connected to a an internet access point.
  ///Does not need to be awaited hence it's not a future.
  bool physicallyConnectedWithStatus(dynamic status);

  ///Test if the device is connected to a an internet access point
  Future<bool> physicallyConnected();

  ///Test if the device can request data from the access point
  Future<bool> isOnline();

  ValueStream<dynamic> get connectivityChanged;

  bool statusNotNone(dynamic status);

}