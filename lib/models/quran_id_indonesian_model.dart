// To parse this JSON data, do
//
//     final quranIndonesianModel = quranIndonesianModelFromJson(jsonString);

import 'dart:convert';

QuranIndonesianModel quranIndonesianModelFromJson(String str) =>
    QuranIndonesianModel.fromJson(json.decode(str));

String quranIndonesianModelToJson(QuranIndonesianModel data) =>
    json.encode(data.toJson());

class QuranIndonesianModel {
  QuranIndonesianModel({
    this.code,
    this.status,
    this.data,
  });

  int code;
  String status;
  Data data;

  factory QuranIndonesianModel.fromJson(Map<String, dynamic> json) =>
      QuranIndonesianModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
    this.edition,
  });

  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  int numberOfAyahs;
  List<Ayah> ayahs;
  Edition edition;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        number: json["number"] == null ? null : json["number"],
        name: json["name"] == null ? null : json["name"],
        englishName: json["englishName"] == null ? null : json["englishName"],
        englishNameTranslation: json["englishNameTranslation"] == null
            ? null
            : json["englishNameTranslation"],
        revelationType:
            json["revelationType"] == null ? null : json["revelationType"],
        numberOfAyahs:
            json["numberOfAyahs"] == null ? null : json["numberOfAyahs"],
        ayahs: json["ayahs"] == null
            ? null
            : List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
        edition:
            json["edition"] == null ? null : Edition.fromJson(json["edition"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "name": name == null ? null : name,
        "englishName": englishName == null ? null : englishName,
        "englishNameTranslation":
            englishNameTranslation == null ? null : englishNameTranslation,
        "revelationType": revelationType == null ? null : revelationType,
        "numberOfAyahs": numberOfAyahs == null ? null : numberOfAyahs,
        "ayahs": ayahs == null
            ? null
            : List<dynamic>.from(ayahs.map((x) => x.toJson())),
        "edition": edition == null ? null : edition.toJson(),
      };
}

class Ayah {
  Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    // this.sajda,
  });

  int number;
  String text;
  int numberInSurah;
  int juz;
  int manzil;
  int page;
  int ruku;
  int hizbQuarter;
  // bool sajda;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"] == null ? null : json["number"],
        text: json["text"] == null ? null : json["text"],
        numberInSurah:
            json["numberInSurah"] == null ? null : json["numberInSurah"],
        juz: json["juz"] == null ? null : json["juz"],
        manzil: json["manzil"] == null ? null : json["manzil"],
        page: json["page"] == null ? null : json["page"],
        ruku: json["ruku"] == null ? null : json["ruku"],
        hizbQuarter: json["hizbQuarter"] == null ? null : json["hizbQuarter"],
        // sajda: json["sajda"] == null ? null : json["sajda"],
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "text": text == null ? null : text,
        "numberInSurah": numberInSurah == null ? null : numberInSurah,
        "juz": juz == null ? null : juz,
        "manzil": manzil == null ? null : manzil,
        "page": page == null ? null : page,
        "ruku": ruku == null ? null : ruku,
        "hizbQuarter": hizbQuarter == null ? null : hizbQuarter,
        // "sajda": sajda == null ? null : sajda,
      };
}

class Edition {
  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  String identifier;
  String language;
  String name;
  String englishName;
  String format;
  String type;
  String direction;

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json["identifier"] == null ? null : json["identifier"],
        language: json["language"] == null ? null : json["language"],
        name: json["name"] == null ? null : json["name"],
        englishName: json["englishName"] == null ? null : json["englishName"],
        format: json["format"] == null ? null : json["format"],
        type: json["type"] == null ? null : json["type"],
        direction: json["direction"] == null ? null : json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier == null ? null : identifier,
        "language": language == null ? null : language,
        "name": name == null ? null : name,
        "englishName": englishName == null ? null : englishName,
        "format": format == null ? null : format,
        "type": type == null ? null : type,
        "direction": direction == null ? null : direction,
      };
}
