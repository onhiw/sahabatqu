import 'package:core/domain/entities/prayer/prayer_monthly.dart';
import 'package:equatable/equatable.dart';

class PrayerMonthlyResponseE extends Equatable {
  const PrayerMonthlyResponseE({
    required this.status,
    required this.prayerMonthly,
  });

  final bool status;
  final PrayerMonthly prayerMonthly;

  @override
  List<Object?> get props => [status, prayerMonthly];
}
