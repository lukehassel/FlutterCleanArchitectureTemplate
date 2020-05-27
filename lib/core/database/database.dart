import 'package:clean_architecture_template/core/database/data_object.dart';

abstract class Database {
  void save(DataObject dataObject);

  dynamic get(String key);

  bool exists(String key);

  void deleteAll();
}
