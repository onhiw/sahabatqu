import 'package:equatable/equatable.dart';

class NearmeLocation extends Equatable {
  const NearmeLocation({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  @override
  List<Object?> get props => [lat, lng];
}
