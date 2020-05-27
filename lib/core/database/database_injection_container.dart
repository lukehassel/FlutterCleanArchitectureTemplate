import '../service_locator.dart';
import 'database.dart';
import 'database_impl.dart';

void initDatabaseInjectionContainer() {
  sl.registerLazySingleton<Database>(() => DatabaseImpl());
}
