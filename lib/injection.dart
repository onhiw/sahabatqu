import 'package:core/data/datasources/nearme_remote_data_source.dart';
import 'package:core/data/datasources/prayer_remote_data_source.dart';
import 'package:core/data/datasources/quran_remote_data_source.dart';
import 'package:core/data/repositories/nearme_repository_impl.dart';
import 'package:core/data/repositories/prayer_repository_impl.dart';
import 'package:core/data/repositories/quran_repository_impl.dart';
import 'package:core/domain/repositories/nearme_repository.dart';
import 'package:core/domain/repositories/prayer_repository.dart';
import 'package:core/domain/repositories/quran_repository.dart';
import 'package:core/domain/usecases/nearme/get_nearme.dart';
import 'package:core/domain/usecases/prayer/get_all_city.dart';
import 'package:core/domain/usecases/prayer/get_prayer_schedule_daily.dart';
import 'package:core/domain/usecases/prayer/get_prayer_schedule_monthly.dart';
import 'package:core/domain/usecases/quran/get_all_surah.dart';
import 'package:core/domain/usecases/quran/get_ayah_by_surah_no.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:nearme/presentation/bloc/nearme-bloc/nearme_bloc.dart';
import 'package:nearme/presentation/bloc/nearme-mosque-bloc/nearme_mosque_bloc.dart';
import 'package:quran/presentation/bloc/surah-bloc/surah_bloc.dart';
import 'package:quran/presentation/bloc/surah-detail-bloc/surah_detail_bloc.dart';
import 'package:schedule/presentation/bloc/city-bloc/city_bloc.dart';
import 'package:schedule/presentation/bloc/prayer-daily-bloc/prayer_daily_bloc.dart';
import 'package:schedule/presentation/bloc/prayer-monthly-bloc/prayer_monthly_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => CityBloc(locator()));
  locator.registerFactory(() => PrayerDailyBloc(locator()));
  locator.registerFactory(() => PrayerMonthlyBloc(locator()));

  locator.registerFactory(() => SurahBloc(locator()));
  locator.registerFactory(() => SurahDetailBloc(locator()));

  locator.registerFactory(() => NearmeBloc(locator()));
  locator.registerFactory(() => NearmeMosqueBloc(locator()));

  // use case
  locator.registerLazySingleton(() => GetAllCity(locator()));
  locator.registerLazySingleton(() => GetPrayerScheduleDaily(locator()));
  locator.registerLazySingleton(() => GetPrayerScheduleMonthly(locator()));

  locator.registerLazySingleton(() => GetAllSurah(locator()));
  locator.registerLazySingleton(() => GetAyahBySurahNo(locator()));

  locator.registerLazySingleton(() => GetNearme(locator()));

  // repository
  locator.registerLazySingleton<PrayerRepository>(
      () => PrayerRepositoryImpl(prayerRemoteDataSource: locator()));
  locator.registerLazySingleton<QuranRepository>(
      () => QuranRepositoryImpl(quranRemoteDataSource: locator()));
  locator.registerLazySingleton<NearmeRepository>(
      () => NearmeRepositoryImpl(nearmeRemoteDataSource: locator()));

  // data sources
  locator.registerLazySingleton<PrayerRemoteDataSource>(
      () => PrayerRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<QuranRemoteDataSource>(
      () => QuranRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<NearmeRemoteDataSource>(
      () => NearmeRemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
