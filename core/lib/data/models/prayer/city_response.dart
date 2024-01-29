import 'package:core/data/models/prayer/city_model.dart';
import 'package:equatable/equatable.dart';

class CityResponse extends Equatable {
  final List<CityModel> data;

  const CityResponse({required this.data});

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
      data: List<CityModel>.from(
          json["data"]!.map((x) => CityModel.fromJson(x))));
  @override
  List<Object?> get props => [data];
}
