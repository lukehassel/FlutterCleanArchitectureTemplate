//TODO Example Model. Replace this class with your own entity.

import 'package:hive/hive.dart';
import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';

class FeatureNameRequestEntity extends EntityBase {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<TestDataEntity> data;
  TestAdEntity ad;

  FeatureNameRequestEntity(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.ad});
}

class TestDataEntity extends EntityBase {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  TestDataEntity(
      {this.id, this.email, this.firstName, this.lastName, this.avatar});
}

class TestAdEntity extends EntityBase {
  String company;
  String url;
  String text;

  TestAdEntity({this.company, this.url, this.text});
}
