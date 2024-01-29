import 'package:core/domain/entities/quran/ayah_Info.dart';
import 'package:equatable/equatable.dart';

class InfoAyahModel extends Equatable {
  final SuratModel surat;

  const InfoAyahModel({
    required this.surat,
  });

  factory InfoAyahModel.fromJson(Map<String, dynamic> json) => InfoAyahModel(
        surat: SuratModel.fromJson(json["surat"]),
      );

  Map<String, dynamic> toJson() => {
        "surat": surat.toJson(),
      };

  InfoAyah toEntity() {
    return InfoAyah(surat: surat.toEntity());
  }

  @override
  List<Object?> get props => [surat];
}

class SuratModel extends Equatable {
  final int id;
  final NamaModel nama;
  final String relevasi;
  final int ayatMax;

  const SuratModel({
    required this.id,
    required this.nama,
    required this.relevasi,
    required this.ayatMax,
  });

  factory SuratModel.fromJson(Map<String, dynamic> json) => SuratModel(
        id: json["id"],
        nama: NamaModel.fromJson(json["nama"]),
        relevasi: json["relevasi"],
        ayatMax: json["ayat_max"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama.toJson(),
        "relevasi": relevasi,
        "ayat_max": ayatMax,
      };

  Surat toEntity() {
    return Surat(
        id: id, nama: nama.toEntity(), relevasi: relevasi, ayatMax: ayatMax);
  }

  @override
  List<Object?> get props => [id, nama, relevasi, ayatMax];
}

class NamaModel extends Equatable {
  final String ar;
  final String id;

  const NamaModel({
    required this.ar,
    required this.id,
  });

  factory NamaModel.fromJson(Map<String, dynamic> json) => NamaModel(
        ar: json["ar"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "id": id,
      };

  Nama toEntity() {
    return Nama(ar: ar, id: id);
  }

  @override
  List<Object?> get props => [ar, id];
}
