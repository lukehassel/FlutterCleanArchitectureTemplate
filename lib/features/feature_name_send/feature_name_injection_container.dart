import 'package:clean_architecture_template/core/network/basic_request/basic_dio_request_impl.dart';
import 'package:clean_architecture_template/core/network/basic_request/basic_request.dart';
import 'package:clean_architecture_template/core/service_locator.dart';
import 'package:clean_architecture_template/features/feature_name_send/presentation/bloc/feature_name_bloc.dart';

import 'data/datasources/feature_name_data_source.dart';
import 'data/repositories/feature_name_repository_impl.dart';
import 'domain/repositories/feature_name_repository.dart';
import 'domain/usecases/feature_name_usecase.dart';

Future<void> initFeatureName() async {
  /// Bloc
  sl.registerFactory(
    () => FeatureNameBloc(
      getFeatureNameUseCase: sl(),
    ),
  );

  /// Use cases
  sl.registerLazySingleton(() => GetFeatureNameUseCase(sl()));

  /// Repository
  sl.registerLazySingleton<FeatureNameRepository>(
    () => FeatureNameRepositoryImpl(
        connected: sl(), remoteDataSource: sl(), db: sl()),
  );

  /// Data sources
  sl.registerLazySingleton<FeatureNameRemoteDataSource>(
    () => FeatureNameRemoteDataSourceImpl(sl()),
  );

  /// Core
  sl.registerLazySingleton<BasicRequest>(() => BasicDioRequestImpl());

  //sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //sl.registerLazySingleton(() => DataConnectionChecker());
}
