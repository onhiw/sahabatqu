import 'package:core/core.dart';
import 'package:core/domain/entities/nearme/nearme.dart';
import 'package:dartz/dartz.dart';

abstract class NearmeRepository {
  Future<Either<Failure, List<Nearme>>> getNearme(String location, String type);
}
