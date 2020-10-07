import 'dart:convert';

import 'package:clean_architecture_template/core/clean_utils/remote_data_source/basic_remote_data_source.dart';
import 'package:clean_architecture_template/core/network/basic_request/basic_request.dart';
import '../../domain/entities/feature_name_request_entity.dart';
import '../models/feature_name_request_model.dart';

import '../models/feature_name_response_model.dart';

abstract class FeatureNameRemoteDataSource implements BasicRemoteDataSource {
  Future<FeatureNameResponseModel> getRemoteSource({dynamic properties});
}

class FeatureNameRemoteDataSourceImpl implements FeatureNameRemoteDataSource {
  final BasicRequest basicRequest;

  FeatureNameRemoteDataSourceImpl(this.basicRequest);

  @override
  Future<FeatureNameResponseModel> getRemoteSource({dynamic properties}) async {
    print('datasource');
    FeatureNameResponseModel model;

    FeatureNameRequestEntity entity = properties;
    FeatureNameRequestModel requestModel =
        new FeatureNameRequestModel.fromEntity(entity);

    //Add your body parameters here.
    Map<String, dynamic> body = {'page': json.encode(requestModel.toJson())};

    try {
      var response = await basicRequest.post(url: '', body: body);
      var d = response.data;
      model = FeatureNameResponseModel.fromJson(d);

      return model;
    } catch (e) {
      throw e;
    }
  }
}
