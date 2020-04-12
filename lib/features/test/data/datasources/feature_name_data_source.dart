import 'package:clean_architecture_template/core/network/basic_request/basic_request.dart';

import '../models/feature_name_model.dart';

abstract class FeatureNameRemoteDataSource {

  Future<FeatureNameModel> getFeatureName({String aid});

}

class FeatureNameRemoteDataSourceImpl implements FeatureNameRemoteDataSource {

  final BasicRequest basicRequest;

  FeatureNameRemoteDataSourceImpl(this.basicRequest);

  @override
  Future<FeatureNameModel> getFeatureName({String aid}) async {
    print('datasource');
    FeatureNameModel model;

    //Add your body parameters here.
    Map<String, dynamic> body = {
      //'page': aid
    };

    try{
      var response = await basicRequest.send(url: 'example.com');
      var d = response.data;
      model = FeatureNameModel.fromJson(d);

      return model;
    } catch (e) {
      throw e;
    }
  }
}