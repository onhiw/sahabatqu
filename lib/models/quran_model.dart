// To parse this JSON data, do
//
//     final quranModel = quranModelFromJson(jsonString);

import 'dart:convert';

QuranModel quranModelFromJson(String str) =>
    QuranModel.fromJson(json.decode(str));

String quranModelToJson(QuranModel data) => json.encode(data.toJson());

class QuranModel {
  QuranModel({
    this.status,
    this.query,
    this.hasil,
  });

  String? status;
  Query? query;
  List<Hasil>? hasil;

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        status: json["status"] == null ? null : json["status"],
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
        hasil: json["hasil"] == null
            ? null
            : List<Hasil>.from(json["hasil"].map((x) => Hasil.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "query": query == null ? null : query!.toJson(),
        "hasil": hasil == null
            ? null
            : List<dynamic>.from(hasil!.map((x) => x.toJson())),
      };
}

class Hasil {
  Hasil({
    this.nomor,
    this.nama,
    this.asma,
    this.name,
    this.start,
    this.ayat,
    this.type,
    this.urut,
    this.rukuk,
    this.arti,
    this.keterangan,
  });

  String? nomor;
  String? nama;
  String? asma;
  String? name;
  String? start;
  String? ayat;
  String? type;
  String? urut;
  String? rukuk;
  String? arti;
  String? keterangan;

  factory Hasil.fromJson(Map<String, dynamic> json) => Hasil(
        nomor: json["nomor"] == null ? null : json["nomor"],
        nama: json["nama"] == null ? null : json["nama"],
        asma: json["asma"] == null ? null : json["asma"],
        name: json["name"] == null ? null : json["name"],
        start: json["start"] == null ? null : json["start"],
        ayat: json["ayat"] == null ? null : json["ayat"],
        type: json["type"] == null ? null : json["type"],
        urut: json["urut"] == null ? null : json["urut"],
        rukuk: json["rukuk"] == null ? null : json["rukuk"],
        arti: json["arti"] == null ? null : json["arti"],
        keterangan: json["keterangan"] == null ? null : json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor == null ? null : nomor,
        "nama": nama == null ? null : nama,
        "asma": asma == null ? null : asma,
        "name": name == null ? null : name,
        "start": start == null ? null : start,
        "ayat": ayat == null ? null : ayat,
        "type": type == null ? null : type,
        "urut": urut == null ? null : urut,
        "rukuk": rukuk == null ? null : rukuk,
        "arti": arti == null ? null : arti,
        "keterangan": keterangan == null ? null : keterangan,
      };
}

class Query {
  Query({
    this.format,
    this.surat,
  });

  String? format;
  String? surat;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        format: json["format"] == null ? null : json["format"],
        surat: json["surat"] == null ? null : json["surat"],
      );

  Map<String, dynamic> toJson() => {
        "format": format == null ? null : format,
        "surat": surat == null ? null : surat,
      };
}
