import 'package:core/domain/entities/quran/surah.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class QuranRepository {
  Future<Either<Failure, List<Surah>>> getAllSurah();
}
