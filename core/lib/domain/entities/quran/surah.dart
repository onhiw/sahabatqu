import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  const Surah({
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
