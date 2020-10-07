//TODO Example Model. Replace this class with your own entity.

import 'package:hive/hive.dart';
import 'package:clean_architecture_template/core/clean_utils/entity/entity_base.dart';

part 'feature_name_entity.g.dart';

@HiveType(typeId: 0)
class FeatureNameEntity extends EntityBase {
  @HiveField(1)
  int page;

  @HiveField(2)
  int perPage;

  @HiveField(3)
  int total;

  @HiveField(4)
  int totalPages;

  @HiveField(5)
  List<TestData> data;

  @HiveField(6)
  TestAd ad;

  FeatureNameEntity(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.ad});
}

@HiveType(typeId: 1)
class TestData extends EntityBase {
  @HiveField(1)
  int id;
  @HiveField(2)
  String email;
  @HiveField(3)
  String firstName;
  @HiveField(4)
  String lastName;
  @HiveField(5)
  String avatar;

  TestData({this.id, this.email, this.firstName, this.lastName, this.avatar});
}

@HiveType(typeId: 2)
class TestAd extends EntityBase {
  @HiveField(1)
  String company;
  @HiveField(2)
  String url;
  @HiveField(3)
  String text;

  TestAd({this.company, this.url, this.text});
}
