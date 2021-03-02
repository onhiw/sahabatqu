import 'package:sahabatqu/models/jadwal_sholat_model.dart';
import 'package:sahabatqu/models/quran_model.dart';
import 'package:sahabatqu/models/quran_uthmani_model.dart';
import 'package:sahabatqu/resources/api_provider.dart';

class ApiRespository {
  final _provider = ApiProvider();

  Future<JadwalSholatModel> fetchJadwalSholat(String lat, String long) {
    return _provider.fetchJadwalSholat(lat, long);
  }

  Future<QuranModel> fetchQuranList() {
    return _provider.fetchQuranList();
  }

  Future<QuranUthmaniModel> fetchQuranDetail(String number) {
    return _provider.fetchQuranDetail(number);
  }
}

class NetworkError extends Error {}
