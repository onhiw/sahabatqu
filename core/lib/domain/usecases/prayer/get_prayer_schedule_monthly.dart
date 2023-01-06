import 'package:core/core.dart';
import 'package:core/domain/entities/prayer/prayer_monthly_response_e.dart';
import 'package:core/domain/repositories/prayer_repository.dart';
import 'package:dartz/dartz.dart';

class GetPrayerScheduleMonthly {
  final PrayerRepository prayerRepository;

  GetPrayerScheduleMonthly(this.prayerRepository);

  Future<Either<Failure, PrayerMonthlyResponseE>> execute(
      String cityId, int year, int month) {
    return prayerRepository.getPrayerScheduleMonthly(cityId, year, month);
  }
}
