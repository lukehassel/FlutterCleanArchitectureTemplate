import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {});

  group('Counter', () {
    test('test dio response', () async {
      print(1 + 1);
      //print(response.data.toString()+'  \n'+response.statusCode.toString());
    });
  });

  Future<String> testa() async {
    await Future.delayed(const Duration(seconds: 5), () => 'asf');
  }
}
