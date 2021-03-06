import 'package:dio/dio.dart';
import 'package:sahabatqu/models/quran_id_indonesian_model.dart';
import 'package:sahabatqu/models/quran_model.dart';
import 'package:sahabatqu/models/quran_uthmani_model.dart';

class QuranViewModel {
  QuranViewModel();

  Future<QuranModel> getDataQuran() async {
    final Dio _dio = Dio();

    try {
      Response _res =
          await _dio.get("https://api.banghasan.com/quran/format/json/surat");
      print(_res);
      final QuranModel quranModel = QuranModel.fromJson(_res.data);
      return quranModel;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<QuranUthmaniModel> getDataQuranUthmani(String number) async {
    final Dio _dio = Dio();

    try {
      Response _res = await _dio
          .get("http://api.alquran.cloud/surah/$number/quran-uthmani");
      print(_res);
      final QuranUthmaniModel quranUthmaniModel =
          QuranUthmaniModel.fromJson(_res.data);
      return quranUthmaniModel;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<QuranIndonesianModel> getDataQuranIndonesian(String number) async {
    final Dio _dio = Dio();

    try {
      Response _res = await _dio
          .get("http://api.alquran.cloud/surah/$number/id.indonesian");
      print(_res);
      final QuranIndonesianModel quranIndonesianModel =
          QuranIndonesianModel.fromJson(_res.data);
      return quranIndonesianModel;
    } catch (err) {
      print(err);
      return null;
    }
  }
}
