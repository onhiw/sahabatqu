part of 'nearme_mosque_bloc.dart';

@immutable
abstract class NearmeMosqueEvent {
  const NearmeMosqueEvent();
}

class GetNearmeMosqueList extends NearmeMosqueEvent {
  final String lat, long;

  GetNearmeMosqueList(this.lat, this.long);
  @override
  List<Object> get props => null;
}
