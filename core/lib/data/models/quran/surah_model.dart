import 'package:core/domain/entities/quran/surah.dart';
import 'package:equatable/equatable.dart';

class SurahModel extends Equatable {
  const SurahModel({
    required this.nomor,
    required this.nama,
    required this.asma,
    required this.name,
    required this.start,
    required this.ayat,
    required this.type,
    required this.urut,
    required this.rukuk,
    required this.arti,
    required this.keterangan,
  });

  final String nomor;
  final String nama;
  final String asma;
  final String name;
  final String start;
  final String ayat;
  final String type;
  final String urut;
  final String rukuk;
  final String arti;
  final String keterangan;

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        nomor: json["nomor"],
        nama: json["nama"],
        asma: json["asma"],
        name: json["name"],
        start: json["start"],
        ayat: json["ayat"],
        type: json["type"],
        urut: json["urut"],
        rukuk: json["rukuk"],
        arti: json["arti"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "asma": asma,
        "name": name,
        "start": start,
        "ayat": ayat,
        "type": type,
        "urut": urut,
        "rukuk": rukuk,
        "arti": arti,
        "keterangan": keterangan,
      };

  Surah toEntity() {
    return Surah(
        nomor: nomor,
        nama: nama,
        asma: asma,
        name: name,
        start: start,
        ayat: ayat,
        type: type,
        urut: urut,
        rukuk: rukuk,
        arti: arti,
        keterangan: keterangan);
  }

  @override
  List<Object?> get props => [
        nomor,
        nama,
        asma,
        name,
        start,
        ayat,
        type,
        urut,
        rukuk,
        arti,
        keterangan
      ];
}
