part of 'nearme_halal_bloc.dart';

@immutable
abstract class NearmeHalalEvent {
  const NearmeHalalEvent();
}

class GetNearmeHalal extends NearmeHalalEvent {
  final String lat, long, date;

  GetNearmeHalal(this.lat, this.long, this.date);
  @override
  List<Object> get props => null;
}
