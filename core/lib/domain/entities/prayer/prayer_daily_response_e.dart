import 'package:core/domain/entities/prayer/prayer_daily.dart';
import 'package:equatable/equatable.dart';

class PrayerDailyResponseE extends Equatable {
  const PrayerDailyResponseE({
    required this.status,
    this.prayerDaily,
  });

  final bool status;
  final PrayerDaily? prayerDaily;

  @override
  List<Object?> get props => [status, prayerDaily];
}
