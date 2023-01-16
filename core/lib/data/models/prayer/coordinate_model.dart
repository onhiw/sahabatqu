import 'package:core/domain/entities/prayer/coordinate.dart';
import 'package:equatable/equatable.dart';

class CoordinateModel extends Equatable {
  const CoordinateModel({
    required this.lat,
    required this.lon,
    required this.lintang,
    required this.bujur,
  });

  final double lat;
  final double lon;
  final String lintang;
  final String bujur;

  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      CoordinateModel(
        lat: json["lat"],
        lon: json["lon"],
        lintang: json["lintang"],
        bujur: json["bujur"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "lintang": lintang,
        "bujur": bujur,
      };

  Coordinate toEntity() {
    return Coordinate(lat: lat, lon: lon, lintang: lintang, bujur: bujur);
  }

  @override
  List<Object?> get props => [lat, lon, lintang, bujur];
}
