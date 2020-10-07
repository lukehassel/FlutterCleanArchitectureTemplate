import 'package:clean_architecture_template/core/network/network_injection_container.dart';
import 'package:clean_architecture_template/features/feature_name_get/presentation/pages/feature_name_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'core/database/database_injection_container.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/feature_name_get/feature_name_injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initInjection();
  runApp(MyApp());
}

Future<void> initInjection() async {
  initNetworkInjectionContainer();
  initFeatureName();
  initDatabaseInjectionContainer();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeatureNamePage(),
    );
  }
}
