import 'package:core/core.dart';
import 'package:core/domain/entities/prayer/city.dart';
import 'package:core/domain/entities/prayer/prayer_daily_response_e.dart';
import 'package:core/domain/entities/prayer/prayer_monthly_response_e.dart';
import 'package:dartz/dartz.dart';

abstract class PrayerRepository {
  Future<Either<Failure, PrayerDailyResponseE>> getPrayerScheduleDaily(
      String cityId, String date);
  Future<Either<Failure, PrayerMonthlyResponseE>> getPrayerScheduleMonthly(
      String cityId, int year, int month);
  Future<Either<Failure, List<City>>> getAllCity();
}
