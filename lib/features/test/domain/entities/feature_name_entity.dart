
//TODO Example Model. Replace this class with your own entity.
class FeatureNameEntity {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<TestData> data;
  TestAd ad;

  FeatureNameEntity(
      {this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
        this.ad});
}

class TestData {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  TestData({this.id, this.email, this.firstName, this.lastName, this.avatar});
}

class TestAd {
  String company;
  String url;
  String text;

  TestAd({this.company, this.url, this.text});
}