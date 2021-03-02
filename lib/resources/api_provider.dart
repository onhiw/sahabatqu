import 'package:dio/dio.dart';
import 'package:sahabatqu/models/jadwal_sholat_model.dart';
import 'package:sahabatqu/models/quran_model.dart';
import 'package:sahabatqu/models/quran_uthmani_model.dart';

class ApiProvider {
  ApiProvider();

  final Dio _dio = Dio();
  Future<JadwalSholatModel> fetchJadwalSholat(String lat, String long) async {
    final String _url =
        'https://api.pray.zone/v2/times/today.json?longitude=$long&latitude=$lat&elevation=2000';
    try {
      Response _res = await _dio.get(_url);
      print(_res);
      final JadwalSholatModel jadwalSholatModel =
          JadwalSholatModel.fromJson(_res.data);
      return jadwalSholatModel;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<QuranModel> fetchQuranList() async {
    final String _url = 'https://api.banghasan.com/quran/format/json/surat';
    try {
      Response _res = await _dio.get(_url);
      print(_res);
      final QuranModel quranModel = QuranModel.fromJson(_res.data);
      return quranModel;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<QuranUthmaniModel> fetchQuranDetail(String number) async {
    final String _url = 'http://api.alquran.cloud/surah/$number/quran-uthmani';
    try {
      Response _res = await _dio.get(_url);
      print(_res);
      final QuranUthmaniModel quranUthmaniModel =
          QuranUthmaniModel.fromJson(_res.data);
      return quranUthmaniModel;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
