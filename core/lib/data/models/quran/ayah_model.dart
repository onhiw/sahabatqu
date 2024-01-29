import 'package:core/domain/entities/quran/ayah.dart';
import 'package:equatable/equatable.dart';

class AyahModel extends Equatable {
  const AyahModel({
    required this.arab,
    required this.asbab,
    required this.audio,
    required this.ayah,
    required this.hizb,
    required this.id,
    required this.juz,
    required this.latin,
    required this.notes,
    required this.page,
    required this.surah,
    required this.text,
    required this.theme,
  });

  final String arab;
  final String asbab;
  final String audio;
  final String ayah;
  final String hizb;
  final String id;
  final String juz;
  final String latin;
  final String notes;
  final String page;
  final String surah;
  final String text;
  final String theme;

  factory AyahModel.fromJson(Map<String, dynamic> json) => AyahModel(
        arab: json["arab"],
        asbab: json["asbab"],
        audio: json["audio"],
        ayah: json["ayah"],
        hizb: json["hizb"] ?? "",
        id: json["id"],
        juz: json["juz"],
        latin: json["latin"],
        notes: json["notes"] ?? "",
        page: json["page"],
        surah: json["surah"],
        text: json["text"],
        theme: json["theme"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "asbab": asbab,
        "audio": audio,
        "ayah": ayah,
        "hizb": hizb,
        "id": id,
        "juz": juz,
        "latin": latin,
        "notes": notes,
        "page": page,
        "surah": surah,
        "text": text,
        "theme": theme,
      };

  Ayah toEntity() {
    return Ayah(
        arab: arab,
        asbab: asbab,
        audio: audio,
        ayah: ayah,
        hizb: hizb,
        id: id,
        juz: juz,
        latin: latin,
        notes: notes,
        page: page,
        surah: surah,
        text: text,
        theme: theme);
  }

  @override
  List<Object?> get props => [
        arab,
        asbab,
        audio,
        ayah,
        hizb,
        id,
        juz,
        latin,
        notes,
        page,
        surah,
        text,
        theme
      ];
}
