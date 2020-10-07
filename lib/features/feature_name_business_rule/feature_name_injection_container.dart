import 'package:clean_architecture_template/core/service_locator.dart';
import 'domain/entities/feature_name_entity.dart';
import 'presentation/bloc/feature_name_bloc/feature_name_bloc.dart';
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

  ///Entity
  sl.registerLazySingleton(() => FeatureNameEntity());
}
