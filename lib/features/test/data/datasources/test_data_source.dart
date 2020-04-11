import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/core/network/basicRequest/basic_request.dart';

import '../models/test_model.dart';

abstract class TestRemoteDataSource {

  Future<TestModel> getTest({String aid});

}

class TestRemoteDataSourceImpl implements TestRemoteDataSource {

  final BasicRequest basicRequest;

  TestRemoteDataSourceImpl(this.basicRequest);

  @override
  Future<TestModel> getTest({String aid}) async {
    print('datasource');
    TestModel model;

    //Add your body parameters here.
    Map<String, dynamic> body = {
      //'page': aid
    };

    try{

      var response = await basicRequest.send(url: 'example.com');

      var d = response.data;
      model = TestModel.fromJson(d);

      return model;
    } catch (e) {
      throw e;
    }
  }
}