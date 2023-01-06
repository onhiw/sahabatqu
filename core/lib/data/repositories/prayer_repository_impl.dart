import 'dart:io';

import 'package:core/data/datasources/prayer_remote_data_source.dart';
import 'package:core/domain/entities/prayer/prayer_daily_response_e.dart';
import 'package:core/domain/entities/prayer/city.dart';
import 'package:core/domain/entities/prayer/prayer_monthly_response_e.dart';
import 'package:core/domain/repositories/prayer_repository.dart';
import 'package:core/utils/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';

class PrayerRepositoryImpl implements PrayerRepository {
  final PrayerRemoteDataSource prayerRemoteDataSource;

  PrayerRepositoryImpl({required this.prayerRemoteDataSource});

  @override
  Future<Either<Failure, List<City>>> getAllCity() async {
    try {
      final result = await prayerRemoteDataSource.getAllCity();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, PrayerDailyResponseE>> getPrayerScheduleDaily(
      String cityId, String date) async {
    try {
      final result = await prayerRemoteDataSource.getPrayerDaily(cityId, date);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, PrayerMonthlyResponseE>> getPrayerScheduleMonthly(
      String cityId, int year, int month) async {
    try {
      final result =
          await prayerRemoteDataSource.getPrayerMonthly(cityId, year, month);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
