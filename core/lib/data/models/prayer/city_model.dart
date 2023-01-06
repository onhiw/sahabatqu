import 'package:core/domain/entities/prayer/city.dart';
import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  const CityModel({
    required this.id,
    required this.lokasi,
  });

  final String id;
  final String lokasi;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        lokasi: json["lokasi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lokasi": lokasi,
      };

  City toEntity() {
    return City(id: id, lokasi: lokasi);
  }

  @override
  List<Object?> get props => [id, lokasi];
}
