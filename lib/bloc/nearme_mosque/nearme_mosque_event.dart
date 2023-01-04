part of 'nearme_mosque_bloc.dart';

@immutable
abstract class NearmeMosqueEvent {
  const NearmeMosqueEvent();
}

class GetNearmeMosqueList extends NearmeMosqueEvent {
  final String lat, long, date;

  GetNearmeMosqueList(this.lat, this.long, this.date);

  List<Object>? get props => null;
}
