import 'package:clean_architecture_template/core/network/network_injection_container.dart';
import 'package:clean_architecture_template/features/test/presentation/pages/feature_name_page.dart';
import 'package:clean_architecture_template/features/test/feature_name_injection_container.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initInjection();
  runApp(MyApp());
}

void initInjection(){
  initNetworkInjectionContainer();

  initTest();
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