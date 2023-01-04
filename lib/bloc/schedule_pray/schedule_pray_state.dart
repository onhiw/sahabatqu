part of 'schedule_pray_bloc.dart';

@immutable
abstract class SchedulePrayState {
  const SchedulePrayState();
}

class SchedulePrayInitial extends SchedulePrayState {
  const SchedulePrayInitial();

  List<Object> get props => [];
}

class ScheduleLoading extends SchedulePrayState {
  const ScheduleLoading();

  List<Object>? get props => null;
}

class ScheduleLoaded extends SchedulePrayState {
  final JadwalSholatModel jadwalSholatModel;
  const ScheduleLoaded(this.jadwalSholatModel);

  List<Object> get props => [jadwalSholatModel];
}

class ScheduleError extends SchedulePrayState {
  final String message;
  const ScheduleError(this.message);

  List<Object> get props => [message];
}
