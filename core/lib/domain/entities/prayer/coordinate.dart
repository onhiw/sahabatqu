import 'package:equatable/equatable.dart';

class Coordinate extends Equatable {
  const Coordinate(
      {required this.lat,
      required this.lon,
      required this.lintang,
      required this.bujur});

  final double lat;
  final double lon;
  final String lintang;
  final String bujur;

  Coordinate toEntity() {
    return Coordinate(lat: lat, lon: lon, lintang: lintang, bujur: bujur);
  }

  @override
  List<Object?> get props => [lat, lon, lintang, bujur];
}
