// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_name_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeatureNameEntityAdapter extends TypeAdapter<FeatureNameEntity> {
  @override
  final typeId = 0;

  @override
  FeatureNameEntity read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeatureNameEntity(
      page: fields[1] as int,
      perPage: fields[2] as int,
      total: fields[3] as int,
      totalPages: fields[4] as int,
      data: (fields[5] as List)?.cast<TestData>(),
      ad: fields[6] as TestAd,
    );
  }

  @override
  void write(BinaryWriter writer, FeatureNameEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(2)
      ..write(obj.perPage)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.totalPages)
      ..writeByte(5)
      ..write(obj.data)
      ..writeByte(6)
      ..write(obj.ad);
  }
}

class TestDataAdapter extends TypeAdapter<TestData> {
  @override
  final typeId = 1;

  @override
  TestData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TestData(
      id: fields[1] as int,
      email: fields[2] as String,
      firstName: fields[3] as String,
      lastName: fields[4] as String,
      avatar: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TestData obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.avatar);
  }
}

class TestAdAdapter extends TypeAdapter<TestAd> {
  @override
  final typeId = 2;

  @override
  TestAd read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TestAd(
      company: fields[1] as String,
      url: fields[2] as String,
      text: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TestAd obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.company)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.text);
  }
}
