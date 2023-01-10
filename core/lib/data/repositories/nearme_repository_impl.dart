import 'dart:io';

import 'package:core/core.dart';
import 'package:core/data/datasources/nearme_remote_data_source.dart';
import 'package:core/domain/entities/nearme/nearme.dart';
import 'package:core/domain/repositories/nearme_repository.dart';
import 'package:dartz/dartz.dart';

class NearmeRepositoryImpl extends NearmeRepository {
  final NearmeRemoteDataSource nearmeRemoteDataSource;

  NearmeRepositoryImpl({required this.nearmeRemoteDataSource});

  @override
  Future<Either<Failure, List<Nearme>>> getNearme(
      String location, String type) async {
    try {
      final result = await nearmeRemoteDataSource.getNearme(location, type);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
