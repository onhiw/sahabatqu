part of 'schedule_pray_bloc.dart';

@immutable
abstract class SchedulePrayEvent {
  const SchedulePrayEvent();
}

class GetScheduleList extends SchedulePrayEvent {
  final String lat, long;

  GetScheduleList(this.lat, this.long);

  @override
  List<Object> get props => null;
}
