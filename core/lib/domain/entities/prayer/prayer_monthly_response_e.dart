import 'package:core/domain/entities/prayer/prayer_monthly.dart';
import 'package:equatable/equatable.dart';

class PrayerMonthlyResponseE extends Equatable {
  PrayerMonthlyResponseE({
    required this.status,
    required this.prayerMonthly,
  });

  bool status;
  PrayerMonthly prayerMonthly;

  @override
  List<Object?> get props => [status, prayerMonthly];
}
