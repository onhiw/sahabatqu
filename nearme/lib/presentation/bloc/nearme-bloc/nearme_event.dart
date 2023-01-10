part of 'nearme_bloc.dart';

abstract class NearmeEvent extends Equatable {}

class FetchNearme extends NearmeEvent {
  final String location;
  final String type;

  FetchNearme(this.location, this.type);

  @override
  List<Object?> get props => [location, type];
}
