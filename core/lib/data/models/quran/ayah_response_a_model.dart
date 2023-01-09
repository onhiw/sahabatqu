import 'package:core/data/models/quran/ayah_response.dart';
import 'package:core/domain/entities/quran/ayah_response_a.dart';
import 'package:equatable/equatable.dart';

class AyahResponseAModel extends Equatable {
  AyahResponseAModel({required this.ayahResponse});

  AyahResponse ayahResponse;

  factory AyahResponseAModel.fromJson(Map<String, dynamic> json) =>
      AyahResponseAModel(
        ayahResponse: AyahResponse.fromJson(json["ayat"]),
      );

  Map<String, dynamic> toJson() => {
        "ayat": ayahResponse.toJson(),
      };

  AyahResponseA toEntity() {
    return AyahResponseA(ayahResponseE: ayahResponse.toEntity());
  }

  @override
  List<Object?> get props => [ayahResponse];
}
