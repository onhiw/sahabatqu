import 'package:dio/dio.dart';
import 'package:sahabatqu/models/jadwal_sholat_model.dart';
import 'package:sahabatqu/models/nearme_halal_model.dart';
import 'package:sahabatqu/models/nearme_mosque_model.dart';
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
    } on DioError catch (error) {
      print("Exception occured: $error");
      return error.error;
    }
  }

  Future<QuranModel> fetchQuranList() async {
    final String _url = 'https://api.banghasan.com/quran/format/json/surat';
    try {
      Response _res = await _dio.get(_url);
      print(_res);
      final QuranModel quranModel = QuranModel.fromJson(_res.data);
      return quranModel;
    } on DioError catch (error) {
      print("Exception occured: $error");
      return error.error;
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
    } on DioError catch (error) {
      print("Exception occured: $error");
      return error.error;
    }
  }

  Future<NearmeMosqueModel> fetchNearmeMosque(
      String lat, String long, String date) async {
    print("long wa");
    print(long);
    print(date);
    final String _url =
        "https://api.foursquare.com/v2/venues/explore?client_id=N3OTUQEA05WTT3K3L2FTJRWGBUERHOXEWU1R3LTC0FTZBZEL&client_secret=TTBPDQ0VBOFWLCAGBJFEYPK0VU1Y0ZXHCD0U5Z1RK4EN3Y5J&v=$date&limit=10&ll=$lat,$long&categoryId=4bf58dd8d48988d138941735";
    try {
      Response _res = await _dio.get(_url);
      print(_res);
      final NearmeMosqueModel nearmeMosqueModel =
          NearmeMosqueModel.fromJson(_res.data);
      return nearmeMosqueModel;
    } on DioError catch (error) {
      print("Exception occured: $error");
      return error.error;
    }
  }

  Future<NearmeHalalModel> fetchNearmeHalal(
      String lat, String long, String date) async {
    final String _url =
        "https://api.foursquare.com/v2/venues/explore?client_id=N3OTUQEA05WTT3K3L2FTJRWGBUERHOXEWU1R3LTC0FTZBZEL&client_secret=TTBPDQ0VBOFWLCAGBJFEYPK0VU1Y0ZXHCD0U5Z1RK4EN3Y5J&v=$date&limit=10&ll=$lat,$long&categoryId=52e81612bcbc57f1066b79ff";
    try {
      Response _res = await _dio.get(_url);
      print(_res);
      final NearmeHalalModel nearmeHalalModel =
          NearmeHalalModel.fromJson(_res.data);
      return nearmeHalalModel;
    } on DioError catch (error) {
      print("Exception occured: $error");
      return error.error;
    }
  }
}
