import 'package:core/domain/entities/quran/surah.dart';
import 'package:equatable/equatable.dart';

class SurahModel extends Equatable {
  const SurahModel({
    required this.audioUrl,
    required this.nameEn,
    required this.nameId,
    required this.nameLong,
    required this.nameShort,
    required this.number,
    required this.numberOfVerses,
    required this.revelation,
    required this.revelationEn,
    required this.revelationId,
    required this.sequence,
    required this.tafsir,
    required this.translationEn,
    required this.translationId,
  });

  final String audioUrl;
  final String nameEn;
  final String nameId;
  final String nameLong;
  final String nameShort;
  final String number;
  final String numberOfVerses;
  final String revelation;
  final String revelationEn;
  final String revelationId;
  final String sequence;
  final String tafsir;
  final String translationEn;
  final String translationId;

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        audioUrl: json["audio_url"],
        nameEn: json["name_en"],
        nameId: json["name_id"],
        nameLong: json["name_long"],
        nameShort: json["name_short"],
        number: json["number"],
        numberOfVerses: json["number_of_verses"],
        revelation: json["revelation"],
        revelationEn: json["revelation_en"],
        revelationId: json["revelation_id"],
        sequence: json["sequence"],
        tafsir: json["tafsir"],
        translationEn: json["translation_en"],
        translationId: json["translation_id"],
      );

  Map<String, dynamic> toJson() => {
        "audio_url": audioUrl,
        "name_en": nameEn,
        "name_id": nameId,
        "name_long": nameLong,
        "name_short": nameShort,
        "number": number,
        "number_of_verses": numberOfVerses,
        "revelation": revelation,
        "revelation_en": revelationEn,
        "revelation_id": revelationId,
        "sequence": sequence,
        "tafsir": tafsir,
        "translation_en": translationEn,
        "translation_id": translationId,
      };

  Surah toEntity() {
    return Surah(
        audioUrl: audioUrl,
        nameEn: nameEn,
        nameId: nameId,
        nameLong: nameLong,
        nameShort: nameShort,
        number: number,
        numberOfVerses: numberOfVerses,
        revelation: revelation,
        revelationEn: revelationEn,
        revelationId: revelationId,
        sequence: sequence,
        tafsir: tafsir,
        translationEn: translationEn,
        translationId: translationId);
  }

  @override
  List<Object?> get props => [
        audioUrl,
        nameEn,
        nameId,
        nameLong,
        nameShort,
        number,
        numberOfVerses,
        revelation,
        revelationEn,
        revelationId,
        sequence,
        tafsir,
        translationEn,
        translationId
      ];
}
