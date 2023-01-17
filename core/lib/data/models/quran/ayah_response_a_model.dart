import 'package:core/data/models/quran/ayah_response.dart';
import 'package:core/data/models/quran/surah_model.dart';
import 'package:core/domain/entities/quran/ayah_response_a.dart';
import 'package:equatable/equatable.dart';

class AyahResponseAModel extends Equatable {
  const AyahResponseAModel(
      {required this.ayahResponse, required this.surahModel});

  final AyahResponse ayahResponse;
  final SurahModel surahModel;

  factory AyahResponseAModel.fromJson(Map<String, dynamic> json) =>
      AyahResponseAModel(
        ayahResponse: AyahResponse.fromJson(
          json["ayat"],
        ),
        surahModel: SurahModel.fromJson(
          json["surat"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "ayat": ayahResponse.toJson(),
        "surah": surahModel.toJson(),
      };

  AyahResponseA toEntity() {
    return AyahResponseA(
        ayahResponseE: ayahResponse.toEntity(), surah: surahModel.toEntity());
  }

  @override
  List<Object?> get props => [ayahResponse, surahModel];
}
