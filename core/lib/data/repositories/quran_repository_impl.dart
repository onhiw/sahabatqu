import 'dart:io';

import 'package:core/core.dart';
import 'package:core/data/datasources/quran_remote_data_source.dart';
import 'package:core/domain/entities/quran/ayah_response_a.dart';
import 'package:core/domain/entities/quran/surah.dart';
import 'package:core/domain/repositories/quran_repository.dart';
import 'package:dartz/dartz.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource quranRemoteDataSource;

  QuranRepositoryImpl({required this.quranRemoteDataSource});

  @override
  Future<Either<Failure, List<Surah>>> getAllSurah() async {
    try {
      final result = await quranRemoteDataSource.getAllSurah();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, AyahResponseA>> getAyahBySurahNo(
      String nomor, int firstCount, int lastCount) async {
    try {
      final result = await quranRemoteDataSource.getAyahBySurahNo(
          nomor, firstCount, lastCount);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
