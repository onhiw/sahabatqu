import 'package:core/data/models/nearme/nearme_geometry_model.dart';
import 'package:core/domain/entities/nearme/nearme.dart';
import 'package:equatable/equatable.dart';

class NearmeModel extends Equatable {
  const NearmeModel({
    required this.nearmeGeometryModel,
    required this.name,
    required this.vicinity,
  });

  final NearmeGeometryModel nearmeGeometryModel;
  final String name;
  final String vicinity;

  factory NearmeModel.fromJson(Map<String, dynamic> json) => NearmeModel(
        nearmeGeometryModel: NearmeGeometryModel.fromJson(json["geometry"]),
        name: json["name"],
        vicinity: json["vicinity"],
      );

  Map<String, dynamic> toJson() => {
        "geometry": nearmeGeometryModel.toJson(),
        "name": name,
        "vicinity": vicinity,
      };
  Nearme toEntity() {
    return Nearme(
        nearmeGeometry: nearmeGeometryModel.toEntity(),
        name: name,
        vicinity: vicinity);
  }

  @override
  List<Object?> get props => [nearmeGeometryModel, name, vicinity];
}
