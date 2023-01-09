import 'package:core/domain/entities/quran/ayah.dart';
import 'package:equatable/equatable.dart';

class AyahModel extends Equatable {
  const AyahModel({
    required this.id,
    required this.surat,
    required this.ayat,
    required this.teks,
  });

  final String id;
  final String surat;
  final String ayat;
  final String teks;

  factory AyahModel.fromJson(Map<String, dynamic> json) => AyahModel(
        id: json["id"],
        surat: json["surat"],
        ayat: json["ayat"],
        teks: json["teks"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surat": surat,
        "ayat": ayat,
        "teks": teks,
      };

  Ayah toEntity() {
    return Ayah(id: id, surat: surat, ayat: ayat, teks: teks);
  }

  @override
  List<Object?> get props => [id, surat, ayat, teks];
}
