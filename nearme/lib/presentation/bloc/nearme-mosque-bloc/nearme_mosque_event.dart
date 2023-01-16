part of 'nearme_mosque_bloc.dart';

abstract class NearmeMosqueEvent extends Equatable {}

class FetchNearmeMosque extends NearmeMosqueEvent {
  final String location;
  final String type;

  FetchNearmeMosque(this.location, this.type);

  @override
  List<Object?> get props => [location, type];
}
