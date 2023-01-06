import 'package:core/core.dart';
import 'package:core/domain/entities/prayer/prayer_daily_response_e.dart';
import 'package:core/domain/repositories/prayer_repository.dart';
import 'package:dartz/dartz.dart';

class GetPrayerScheduleDaily {
  final PrayerRepository prayerRepository;

  GetPrayerScheduleDaily(this.prayerRepository);

  Future<Either<Failure, PrayerDailyResponseE>> execute(
      String cityId, String date) {
    return prayerRepository.getPrayerScheduleDaily(cityId, date);
  }
}
