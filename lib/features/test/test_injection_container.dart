

import 'package:clean_architecture_template/core/network/basicRequest/basic_dio_request_impl.dart';
import 'package:clean_architecture_template/core/network/basicRequest/basic_request.dart';
import 'package:clean_architecture_template/core/service_locator.dart';

import 'data/datasources/test_data_source.dart';
import 'data/repositories/test_repository_impl.dart';
import 'domain/repositories/test_repository.dart';
import 'domain/usecases/test_usecase.dart';
import 'presentation/bloc/test_bloc.dart';

Future<void> initTest() async {
  /// Bloc
  sl.registerFactory(
        () =>
        TestBloc(
          getTestUseCase: sl(),
        ),
  );

  /// Use cases
  sl.registerLazySingleton(() => GetTestUseCase(sl()));

  /// Repository
  sl.registerLazySingleton<TestRepository>(
        () =>
        TestRepositoryImpl(
          connected: sl(),
          remoteDataSource: sl(),
        ),
  );

  /// Data sources
  sl.registerLazySingleton<TestRemoteDataSource>(
        () => TestRemoteDataSourceImpl(sl()),
  );


  /// Core
  sl.registerLazySingleton<BasicRequest>(() => BasicDioRequestImpl());

  //sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //sl.registerLazySingleton(() => DataConnectionChecker());
}
