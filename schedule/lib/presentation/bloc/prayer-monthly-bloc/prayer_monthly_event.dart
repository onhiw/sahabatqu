part of 'prayer_monthly_bloc.dart';

abstract class PrayerMonthlyEvent extends Equatable {}

class GetPrayerMonthly extends PrayerMonthlyEvent {
  final String cityId;
  final int year;
  final int month;

  GetPrayerMonthly(this.cityId, this.year, this.month);

  @override
  List<Object?> get props => [];
}
