import 'package:core/domain/entities/nearme/nearme_geometry.dart';
import 'package:equatable/equatable.dart';

class Nearme extends Equatable {
  const Nearme({
    required this.nearmeGeometry,
    required this.name,
    required this.vicinity,
  });

  final NearmeGeometry nearmeGeometry;
  final String name;
  final String vicinity;

  @override
  List<Object?> get props => [nearmeGeometry, name, vicinity];
}
