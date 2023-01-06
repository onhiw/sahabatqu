import 'package:core/data/datasources/prayer_remote_data_source.dart';
import 'package:core/data/repositories/prayer_repository_impl.dart';
import 'package:core/domain/repositories/prayer_repository.dart';
import 'package:core/domain/usecases/prayer/get_all_city.dart';
import 'package:core/domain/usecases/prayer/get_prayer_schedule_daily.dart';
import 'package:core/domain/usecases/prayer/get_prayer_schedule_monthly.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:schedule/presentation/bloc/city-bloc/city_bloc.dart';
import 'package:schedule/presentation/bloc/prayer-daily-bloc/prayer_daily_bloc.dart';
import 'package:schedule/presentation/bloc/prayer-monthly-bloc/prayer_monthly_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => CityBloc(locator()));
  locator.registerFactory(() => PrayerDailyBloc(locator()));
  locator.registerFactory(() => PrayerMonthlyBloc(locator()));

  // use case
  locator.registerLazySingleton(() => GetAllCity(locator()));
  locator.registerLazySingleton(() => GetPrayerScheduleDaily(locator()));
  locator.registerLazySingleton(() => GetPrayerScheduleMonthly(locator()));

  // repository
  locator.registerLazySingleton<PrayerRepository>(
    () => PrayerRepositoryImpl(prayerRemoteDataSource: locator()),
  );

  // data sources
  locator.registerLazySingleton<PrayerRemoteDataSource>(
      () => PrayerRemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
