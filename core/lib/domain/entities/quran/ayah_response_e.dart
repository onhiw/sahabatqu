import 'package:core/domain/entities/quran/ayah.dart';
import 'package:core/domain/entities/quran/ayah_Info.dart';
import 'package:core/domain/entities/quran/ayah_request.dart';
import 'package:equatable/equatable.dart';

class AyahResponseE extends Equatable {
  const AyahResponseE(
      {required this.request, required this.infoAyahModel, required this.data});

  final RequestAyah request;
  final InfoAyah infoAyahModel;
  final List<Ayah> data;

  AyahResponseE toEntity() {
    return AyahResponseE(
        request: request, infoAyahModel: infoAyahModel, data: data);
  }

  @override
  List<Object?> get props => [request, infoAyahModel, data];
}
