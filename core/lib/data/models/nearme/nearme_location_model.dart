import 'package:core/domain/entities/nearme/nearme_location.dart';
import 'package:equatable/equatable.dart';

class NearmeLocationModel extends Equatable {
  const NearmeLocationModel({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  factory NearmeLocationModel.fromJson(Map<String, dynamic> json) =>
      NearmeLocationModel(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };

  NearmeLocation toEntity() {
    return NearmeLocation(lat: lat, lng: lng);
  }

  @override
  List<Object?> get props => [lat, lng];
}
