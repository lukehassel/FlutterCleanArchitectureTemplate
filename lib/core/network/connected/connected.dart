import 'dart:async';

import 'package:clean_architecture_template/core/network/connectivity/connectivity_info.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/foundation.dart';

class Connected {
  final ConnectivityInfo _connectivityInfo;

  ///abstraction of connectivity_info
  Connected(this._connectivityInfo);

  ///error: internet access point has no internet
  Future<bool> accessPointNoInternet() async {
    return (await _connectivityInfo.physicallyConnected()) && !(await _connectivityInfo.isOnline());
  }

  Future<bool> connectedToInternet() async {
    return (await _connectivityInfo.physicallyConnected()) && (await _connectivityInfo.isOnline());
  }

  /// error: enable wlan or mobile network
  Future<bool> notConnectedToAccessPoint() async {
    return !(await _connectivityInfo.physicallyConnected());
  }

  ///Gets called when the user connects to wifi or other access point
  void listenForConnection(
    VoidCallback connectedToAccessPoint(bool online),
  ) {
    StreamSubscription streamSubscription;
    //todo dependency inversion Connectivity library
    streamSubscription =
        Connectivity().onConnectivityChanged.listen((status) async {
      if (_connectivityInfo.physicallyConnectedWithStatus(status)) {
        connectedToAccessPoint(await _connectivityInfo.isOnline());
        streamSubscription.cancel();
      }
    });
  }
  Stream connectivityChangedStream(){
    return _connectivityInfo.connectivityChanged;
  }

  bool statusNotNone(dynamic status){
    return _connectivityInfo.statusNotNone(status);
  }
}
