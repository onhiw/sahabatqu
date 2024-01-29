import 'package:core/domain/entities/quran/ayah_request.dart';
import 'package:equatable/equatable.dart';

class ResponseRequestAyah extends Equatable {
  final String path;
  final String surat;
  final AyatResponseRequest ayat;

  const ResponseRequestAyah({
    required this.path,
    required this.surat,
    required this.ayat,
  });

  factory ResponseRequestAyah.fromJson(Map<String, dynamic> json) =>
      ResponseRequestAyah(
        path: json["path"],
        surat: json["surat"],
        ayat: AyatResponseRequest.fromJson(json["ayat"]),
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "surat": surat,
        "ayat": ayat.toJson(),
      };

  RequestAyah toEntity() {
    return RequestAyah(path: path, surat: surat, ayat: ayat.toEntity());
  }

  @override
  List<Object?> get props => [path, surat, ayat];
}

class AyatResponseRequest {
  final String range;
  final int start;
  final int end;
  final int length;

  AyatResponseRequest({
    required this.range,
    required this.start,
    required this.end,
    required this.length,
  });

  factory AyatResponseRequest.fromJson(Map<String, dynamic> json) =>
      AyatResponseRequest(
        range: json["range"],
        start: json["start"],
        end: json["end"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "range": range,
        "start": start,
        "end": end,
        "length": length,
      };

  AyatRequest toEntity() {
    return AyatRequest(range: range, start: start, end: end, length: length);
  }
}
