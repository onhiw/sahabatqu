import 'package:core/core.dart';
import 'package:core/domain/entities/nearme/nearme.dart';
import 'package:core/domain/repositories/nearme_repository.dart';
import 'package:dartz/dartz.dart';

class GetNearme {
  final NearmeRepository nearmeRepository;

  GetNearme(this.nearmeRepository);

  Future<Either<Failure, List<Nearme>>> execute(String location, String type) {
    return nearmeRepository.getNearme(location, type);
  }
}
