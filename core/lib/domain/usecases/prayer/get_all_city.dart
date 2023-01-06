import 'package:core/core.dart';
import 'package:core/domain/entities/prayer/city.dart';
import 'package:core/domain/repositories/prayer_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCity {
  final PrayerRepository prayerRepository;

  GetAllCity(this.prayerRepository);

  Future<Either<Failure, List<City>>> execute() {
    return prayerRepository.getAllCity();
  }
}
