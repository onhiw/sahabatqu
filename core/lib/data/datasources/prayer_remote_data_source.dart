import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/data/models/prayer/city_model.dart';
import 'package:core/data/models/prayer/city_response.dart';
import 'package:core/data/models/prayer/prayer_daily_response.dart';
import 'package:core/data/models/prayer/prayer_monthly_response.dart';
import 'package:http/http.dart' as http;

abstract class PrayerRemoteDataSource {
  Future<List<CityModel>> getAllCity();
  Future<PrayerDailyResponse> getPrayerDaily(String cityId, String date);
  Future<PrayerMonthlyResponse> getPrayerMonthly(
      String cityId, int year, int month);
}

class PrayerRemoteDataSourceImpl extends PrayerRemoteDataSource {
  final http.Client client;

  PrayerRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CityModel>> getAllCity() async {
    final response = await client
        .get(Uri.parse('https://api.myquran.com/v2/sholat/kota/semua'));

    if (response.statusCode == 200) {
      CityResponse cityResponse =
          CityResponse.fromJson(json.decode(response.body));
      return cityResponse.data;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PrayerDailyResponse> getPrayerDaily(String cityId, String date) async {
    final response = await client.get(
        Uri.parse('https://api.myquran.com/v2/sholat/jadwal/$cityId/$date'));

    if (response.statusCode == 200) {
      return PrayerDailyResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PrayerMonthlyResponse> getPrayerMonthly(
      String cityId, int year, int month) async {
    final response = await client.get(Uri.parse(
        'https://api.myquran.com/v2/sholat/jadwal/$cityId/$year/$month'));

    if (response.statusCode == 200) {
      return PrayerMonthlyResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
