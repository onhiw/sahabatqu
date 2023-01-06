import 'package:core/data/models/prayer/city_model.dart';
import 'package:equatable/equatable.dart';

class CityResponse extends Equatable {
  final List<CityModel> cityList;

  const CityResponse({required this.cityList});

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
      cityList: List<CityModel>.from(
          (json as List).map((x) => CityModel.fromJson(x))));
  @override
  List<Object?> get props => [cityList];
}
