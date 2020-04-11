import 'dart:async';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:rxdart/src/streams/value_stream.dart';

import 'connectivity_info.dart';

class ConnectivityInfoImpl implements ConnectivityInfo {
  @override
  Future<bool> isOnline() async {
    return await Connectivity().checkConnection();
  }

  @override
  ValueStream get connectivityChanged {
    Connectivity connectivity = new Connectivity();
    return connectivity.onConnectivityChanged;
  }

  @override
  bool physicallyConnectedWithStatus(status) {
    if(status == ConnectivityInfo){
      if(status != ConnectivityStatus.none){
        return true;
      }else{
        return false;
      }
    }else{
      throw('The argument status in physicallyConnected(dynamic status) is not a type of ConnectivityInfo.');
    }
  }

  @override
  Future<bool> physicallyConnected() async {
    Connectivity connectivity = new Connectivity();
    ConnectivityStatus status = await connectivity.checkConnectivity();

    if(status != ConnectivityStatus.none){
      return true;
    }else{
      return false;
    }
  }

  @override
  bool statusNotNone(dynamic status) {
    if(status != ConnectivityStatus.none){
      return true;
    }else{
      return false;
    }
  }
  
}
