import 'package:core/data/models/quran/ayah_data_model.dart';
import 'package:core/domain/entities/quran/ayah_response_e.dart';
import 'package:equatable/equatable.dart';

class AyahResponse extends Equatable {
  AyahResponse({required this.ayahDataModel});

  AyahDataModel ayahDataModel;

  factory AyahResponse.fromJson(Map<String, dynamic> json) => AyahResponse(
        ayahDataModel: AyahDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": ayahDataModel.toJson(),
      };

  AyahResponseE toEntity() {
    return AyahResponseE(ayahData: ayahDataModel.toEntity());
  }

  @override
  List<Object?> get props => [ayahDataModel];
}
