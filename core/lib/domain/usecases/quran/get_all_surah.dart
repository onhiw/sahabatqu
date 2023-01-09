import 'package:core/domain/entities/quran/surah.dart';
import 'package:core/domain/repositories/quran_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetAllSurah {
  final QuranRepository quranRepositiry;

  GetAllSurah(this.quranRepositiry);

  Future<Either<Failure, List<Surah>>> execute() {
    return quranRepositiry.getAllSurah();
  }
}
