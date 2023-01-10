import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/data/models/nearme/nearme_model.dart';
import 'package:core/data/models/nearme/nearme_response.dart';
import 'package:http/http.dart' as http;

abstract class NearmeRemoteDataSource {
  Future<List<NearmeModel>> getNearme(String location, String type);
}

class NearmeRemoteDataSourceImpl extends NearmeRemoteDataSource {
  final http.Client client;

  NearmeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<NearmeModel>> getNearme(String location, String type) async {
    final response = await client.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$location&radius=1000&type=$type&key=$apiKey'));

    if (response.statusCode == 200) {
      return NearmeResponse.fromJson(json.decode(response.body)).nearmeList;
    } else {
      throw ServerException();
    }
  }
}
