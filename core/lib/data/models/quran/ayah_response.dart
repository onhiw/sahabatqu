import 'package:core/data/models/quran/ayah_info.dart';
import 'package:core/data/models/quran/ayah_model.dart';
import 'package:core/data/models/quran/ayah_request_response.dart';
import 'package:core/domain/entities/quran/ayah_response_e.dart';
import 'package:equatable/equatable.dart';

class AyahResponse extends Equatable {
  const AyahResponse(
      {required this.request, required this.infoAyahModel, required this.data});

  final ResponseRequestAyah request;
  final InfoAyahModel infoAyahModel;
  final List<AyahModel> data;

  factory AyahResponse.fromJson(Map<String, dynamic> json) => AyahResponse(
        request: ResponseRequestAyah.fromJson(json["request"]),
        infoAyahModel: InfoAyahModel.fromJson(json["info"]),
        data: List<AyahModel>.from(
            json["data"].map((x) => AyahModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "request": request.toJson(),
        "info": infoAyahModel.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  AyahResponseE toEntity() {
    return AyahResponseE(
        request: request.toEntity(),
        infoAyahModel: infoAyahModel.toEntity(),
        data: data.map((ayah) => ayah.toEntity()).toList());
  }

  @override
  List<Object?> get props => [request, infoAyahModel, data];
}
