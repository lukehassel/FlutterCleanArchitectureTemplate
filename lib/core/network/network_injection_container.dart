

import '../service_locator.dart';
import 'connected/connected.dart';
import 'connectivity/connectivity_info.dart';
import 'connectivity/connectivity_info_impl.dart';

void initNetworkInjectionContainer() {

  sl.registerLazySingleton<ConnectivityInfo>(() => ConnectivityInfoImpl());

  sl.registerLazySingleton(() => Connected(sl()));

  /*if(Platform.isAndroid || Platform.isIOS){
    sl.registerLazySingleton<ConnectivityInfo>(() => ConnectivityStatusMobileImpl());
  } else if(Platform.isMacOS||Platform.isWindows||Platform.isLinux||Platform.isFuchsia){
    //Todo testing for mac windows and linux
    sl.registerLazySingleton<ConnectivityInfo>(() => ConnectivityStatusMobileImpl());
  }else {
    sl.registerLazySingleton<ConnectivityInfo>(() => ConnectivityStatusWebImpl());
  }*/
}
