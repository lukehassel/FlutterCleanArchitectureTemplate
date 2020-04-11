import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TestEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTestEvent extends TestEvent {
  final String aid;

  GetTestEvent({this.aid});
}
