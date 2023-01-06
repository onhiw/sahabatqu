part of 'prayer_daily_bloc.dart';

abstract class PrayerDailyState extends Equatable {
  const PrayerDailyState();

  @override
  List<Object?> get props => [];
}

class PrayerDailyEmpty extends PrayerDailyState {
  const PrayerDailyEmpty();

  @override
  List<Object?> get props => [];
}

class PrayerDailyLoading extends PrayerDailyState {}

class PrayerDailyLoaded extends PrayerDailyState {
  final PrayerDailyResponseE prayerDailyResponseE;

  const PrayerDailyLoaded(this.prayerDailyResponseE);

  @override
  List<Object?> get props => [prayerDailyResponseE];
}

class PrayerDailyError extends PrayerDailyState {
  final String message;
  const PrayerDailyError(this.message);

  @override
  List<Object?> get props => [message];
}
