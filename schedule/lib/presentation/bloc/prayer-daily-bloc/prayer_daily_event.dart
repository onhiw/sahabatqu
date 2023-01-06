part of 'prayer_daily_bloc.dart';

abstract class PrayerDailyEvent extends Equatable {}

class GetPrayerDaily extends PrayerDailyEvent {
  final String cityId;
  final String date;

  GetPrayerDaily(this.cityId, this.date);

  @override
  List<Object?> get props => [cityId, date];
}
