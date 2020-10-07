import 'package:clean_architecture_template/core/clean_utils/remote_data_source/basic_remote_data_source.dart';
import 'package:clean_architecture_template/core/network/basic_request/basic_request.dart';

import '../models/feature_name_model.dart';

abstract class FeatureNameRemoteDataSource implements BasicRemoteDataSource {
  Future<FeatureNameModel> getRemoteSource({dynamic properties});
}

class FeatureNameRemoteDataSourceImpl implements FeatureNameRemoteDataSource {
  final BasicRequest basicRequest;

  FeatureNameRemoteDataSourceImpl(this.basicRequest);

  @override
  Future<FeatureNameModel> getRemoteSource({dynamic properties}) async {
    print('datasource');
    FeatureNameModel model;

    //Add your body parameters here.
    Map<String, dynamic> body = {
      //'page': aid
    };

    try {
      var response = await basicRequest.get(url: '');
      var d = response.data;
      model = FeatureNameModel.fromJson(d);

      return model;
    } catch (e) {
      throw e;
    }
  }
}
