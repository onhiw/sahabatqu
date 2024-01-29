import 'package:core/data/models/quran/surah_model.dart';
import 'package:equatable/equatable.dart';

class SurahResponse extends Equatable {
  final List<SurahModel> surahList;

  const SurahResponse({required this.surahList});

  factory SurahResponse.fromJson(Map<String, dynamic> json) => SurahResponse(
        surahList: List<SurahModel>.from(
            json["data"].map((x) => SurahModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(surahList.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [surahList];
}
