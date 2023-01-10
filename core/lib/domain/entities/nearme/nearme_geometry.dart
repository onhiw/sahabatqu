import 'package:core/domain/entities/nearme/nearme_location.dart';
import 'package:equatable/equatable.dart';

class NearmeGeometry extends Equatable {
  NearmeGeometry({required this.nearmeLocation});

  NearmeLocation nearmeLocation;

  @override
  List<Object?> get props => [nearmeLocation];
}
