// To parse this JSON data, do
//
//     final quranUthmaniModel = quranUthmaniModelFromJson(jsonString);

import 'dart:convert';

QuranUthmaniModel quranUthmaniModelFromJson(String str) =>
    QuranUthmaniModel.fromJson(json.decode(str));

String quranUthmaniModelToJson(QuranUthmaniModel data) =>
    json.encode(data.toJson());

class QuranUthmaniModel {
  QuranUthmaniModel({
    this.code,
    this.status,
    this.data,
  });

  int code;
  String status;
  DataQuranUthmani data;

  factory QuranUthmaniModel.fromJson(Map<String, dynamic> json) =>
      QuranUthmaniModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : DataQuranUthmani.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
      };
}

class DataQuranUthmani {
  DataQuranUthmani({
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
  List<AyahQuranUthmani> ayahs;
  EditionQuranUthmani edition;

  factory DataQuranUthmani.fromJson(Map<String, dynamic> json) =>
      DataQuranUthmani(
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
            : List<AyahQuranUthmani>.from(
                json["ayahs"].map((x) => AyahQuranUthmani.fromJson(x))),
        edition: json["edition"] == null
            ? null
            : EditionQuranUthmani.fromJson(json["edition"]),
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

class AyahQuranUthmani {
  AyahQuranUthmani({
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

  factory AyahQuranUthmani.fromJson(Map<String, dynamic> json) =>
      AyahQuranUthmani(
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

class EditionQuranUthmani {
  EditionQuranUthmani({
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

  factory EditionQuranUthmani.fromJson(Map<String, dynamic> json) =>
      EditionQuranUthmani(
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
