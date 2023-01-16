import 'package:core/data/models/nearme/nearme_location_model.dart';
import 'package:core/domain/entities/nearme/nearme_geometry.dart';
import 'package:equatable/equatable.dart';

class NearmeGeometryModel extends Equatable {
  final NearmeLocationModel nearmeLocationModel;

  const NearmeGeometryModel({required this.nearmeLocationModel});

  factory NearmeGeometryModel.fromJson(Map<String, dynamic> json) =>
      NearmeGeometryModel(
        nearmeLocationModel: NearmeLocationModel.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "location": nearmeLocationModel.toJson(),
      };

  NearmeGeometry toEntity() {
    return NearmeGeometry(nearmeLocation: nearmeLocationModel.toEntity());
  }

  @override
  List<Object?> get props => [nearmeLocationModel.toEntity()];
}
