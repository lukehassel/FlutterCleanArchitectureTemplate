import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FeatureNameEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetFeatureNameEvent extends FeatureNameEvent {
  final dynamic properties;

  GetFeatureNameEvent({this.properties});
}
