import '../../domain/entities/feature_name_response_entity.dart';

//ToDo Example Model. Replace this class with your own model.
class FeatureNameResponseModel extends FeatureNameResponseEntity {
  FeatureNameResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = new List<TestDataModel>();
      json['data'].forEach((v) {
        data.add(new TestDataModel.fromJson(v));
      });
    }
    ad = json['ad'] != null ? new AdModel.fromJson(json['ad']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      List<TestDataModel> dataList = this.data;
      data['data'] = dataList.map((v) => v.toJson()).toList();
    }
    if (this.ad != null) {
      AdModel ad = this.ad;
      data['ad'] = ad.toJson();
    }
    return data;
  }
}

class TestDataModel extends TestDataEntity {
  TestDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class AdModel extends TestAdEntity {
  AdModel.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
