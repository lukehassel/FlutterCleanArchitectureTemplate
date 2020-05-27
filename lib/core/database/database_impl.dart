import 'dart:io';

import 'package:clean_architecture_template/core/database/data_object.dart';
import 'package:clean_architecture_template/features/test/data/models/feature_name_model.dart';
import 'package:clean_architecture_template/features/test/domain/entities/feature_name_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart' as p;

import 'database.dart';

class DatabaseImpl implements Database {
  String boxName = 'cache';

  DatabaseImpl() {
    init();
  }

  Future<void> init() async {
    Hive.registerAdapter(FeatureNameEntityAdapter());
    Hive.registerAdapter(TestDataAdapter());
    Hive.registerAdapter(TestAdAdapter());

    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      await Hive.init(p.current);
    } else {
      await Hive.initFlutter();
    }
    await Hive.openBox('cache');
    deleteAll();
  }

  @override
  void save(DataObject data) {
    var box = Hive.box(boxName);

    box.put(data.key, data.data);

    FeatureNameModel model = get(data.key);
    print('Saved:' + model.ad.text);
  }

  @override
  get(String key) {
    var box = Hive.box(boxName);
    if (exists(key)) {
      return box.get(key);
    } else {
      throw Exception('Database: Key does not exist!');
    }
  }

  @override
  bool exists(String key) {
    var box = Hive.box(boxName);
    var exists = box.get(key, defaultValue: 'value_does_not_exist');
    if (exists == 'value_does_not_exist') {
      return false;
    } else {
      return true;
    }
  }

  @override
  void deleteAll() {
    var box = Hive.box(boxName);
    box.clear();
  }
}
