import 'package:core/core.dart';
import 'package:core/domain/entities/quran/ayah_response_a.dart';
import 'package:core/domain/repositories/quran_repository.dart';
import 'package:dartz/dartz.dart';

class GetAyahBySurahNo {
  final QuranRepository quranRepositiry;

  GetAyahBySurahNo(this.quranRepositiry);

  Future<Either<Failure, AyahResponseA>> execute(
      String nomor, int firstCount, int lastCount) {
    return quranRepositiry.getAyahBySurahNo(nomor, firstCount, lastCount);
  }
}
