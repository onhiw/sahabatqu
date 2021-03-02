import 'package:dio/dio.dart';
import 'package:sahabatqu/models/jadwal_sholat_model.dart';

class JadwalSholatViewModel {
  JadwalSholatViewModel();

  Future<JadwalSholatModel> getJadwalSholat(String lat, String long) async {
    final Dio _dio = Dio();

    // try {
    Response _res = await _dio.get(
        "https://api.pray.zone/v2/times/today.json?longitude=$long&latitude=$lat&elevation=2000");
    print(_res);
    final JadwalSholatModel jadwalSholatModel =
        JadwalSholatModel.fromJson(_res.data);
    return jadwalSholatModel;
    // } catch (err) {
    //   print(err);
    //   return null;
    // }
  }
}
