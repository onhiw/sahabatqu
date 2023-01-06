import 'package:core/domain/entities/prayer/prayer_daily.dart';
import 'package:equatable/equatable.dart';

class PrayerDailyResponseE extends Equatable {
  PrayerDailyResponseE({
    required this.status,
    this.prayerDaily,
  });

  bool status;
  PrayerDaily? prayerDaily;

  @override
  List<Object?> get props => [status, prayerDaily];
}
