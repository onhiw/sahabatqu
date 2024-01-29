import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/data/models/quran/ayah_response.dart';
import 'package:core/data/models/quran/surah_model.dart';
import 'package:core/data/models/quran/surah_response.dart';
import 'package:http/http.dart' as http;

abstract class QuranRemoteDataSource {
  Future<List<SurahModel>> getAllSurah();
  Future<AyahResponse> getAyahBySurahNo(
      String nomor, int firstCount, int lastCount);
}

class QuranRemoteDataSourceImpl extends QuranRemoteDataSource {
  final http.Client client;

  QuranRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SurahModel>> getAllSurah() async {
    final response = await client
        .get(Uri.parse('https://api.myquran.com/v2/quran/surat/semua'));

    if (response.statusCode == 200) {
      return SurahResponse.fromJson(
              json.decode(utf8.decode(response.bodyBytes)))
          .surahList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AyahResponse> getAyahBySurahNo(
      String nomor, int firstCount, int lastCount) async {
    final response = await client.get(Uri.parse(
        'https://api.myquran.com/v2/quran/ayat/$nomor/$firstCount-$lastCount'));

    if (response.statusCode == 200) {
      return AyahResponse.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw ServerException();
    }
  }
}
