import 'package:core/data/models/quran/ayah_model.dart';
import 'package:core/domain/entities/quran/ayah_data.dart';
import 'package:equatable/equatable.dart';

class AyahDataModel extends Equatable {
  const AyahDataModel({
    required this.ar,
    required this.idt,
    required this.id,
  });

  final List<AyahModel> ar;
  final List<AyahModel> idt;
  final List<AyahModel> id;

  factory AyahDataModel.fromJson(Map<String, dynamic> json) => AyahDataModel(
        ar: List<AyahModel>.from(json["ar"]!.map((x) => AyahModel.fromJson(x))),
        idt: List<AyahModel>.from(
            json["idt"]!.map((x) => AyahModel.fromJson(x))),
        id: List<AyahModel>.from(json["id"]!.map((x) => AyahModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ar": List<dynamic>.from(ar.map((x) => x.toJson())),
        "idt": List<dynamic>.from(idt.map((x) => x.toJson())),
        "id": List<dynamic>.from(id.map((x) => x.toJson())),
      };

  AyahData toEntity() {
    return AyahData(
        ar: ar.map((ar) => ar.toEntity()).toList(),
        idt: idt.map((idt) => idt.toEntity()).toList(),
        id: id.map((id) => id.toEntity()).toList());
  }

  @override
  List<Object?> get props => [ar, idt, id];
}
