import 'package:core/domain/entities/nearme/nearme_location.dart';
import 'package:equatable/equatable.dart';

class NearmeGeometry extends Equatable {
  const NearmeGeometry({required this.nearmeLocation});

  final NearmeLocation nearmeLocation;

  @override
  List<Object?> get props => [nearmeLocation];
}
