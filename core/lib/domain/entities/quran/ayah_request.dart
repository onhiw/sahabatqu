import 'package:equatable/equatable.dart';

class RequestAyah extends Equatable {
  final String path;
  final String surat;
  final AyatRequest ayat;

  const RequestAyah({
    required this.path,
    required this.surat,
    required this.ayat,
  });

  factory RequestAyah.fromJson(Map<String, dynamic> json) => RequestAyah(
        path: json["path"],
        surat: json["surat"],
        ayat: AyatRequest.fromJson(json["ayat"]),
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "surat": surat,
        "ayat": ayat.toJson(),
      };

  @override
  List<Object?> get props => [path, surat, ayat];
}

class AyatRequest {
  final String range;
  final int start;
  final int end;
  final int length;

  AyatRequest({
    required this.range,
    required this.start,
    required this.end,
    required this.length,
  });

  factory AyatRequest.fromJson(Map<String, dynamic> json) => AyatRequest(
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
}
