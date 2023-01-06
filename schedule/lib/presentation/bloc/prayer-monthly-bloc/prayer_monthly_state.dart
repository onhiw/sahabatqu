part of 'prayer_monthly_bloc.dart';

abstract class PrayerMonthlyState extends Equatable {
  const PrayerMonthlyState();

  @override
  List<Object?> get props => [];
}

class PrayerMonthlyEmpty extends PrayerMonthlyState {
  const PrayerMonthlyEmpty();

  @override
  List<Object?> get props => [];
}

class PrayerMonthlyLoading extends PrayerMonthlyState {}

class PrayerMonthlyLoaded extends PrayerMonthlyState {
  final PrayerMonthlyResponseE prayerMonthlyResponseE;
  const PrayerMonthlyLoaded(this.prayerMonthlyResponseE);

  @override
  List<Object?> get props => [prayerMonthlyResponseE];
}

class PrayerMonthlyError extends PrayerMonthlyState {
  final String message;

  const PrayerMonthlyError(this.message);

  @override
  List<Object?> get props => [message];
}
