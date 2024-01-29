import 'package:equatable/equatable.dart';

class InfoAyah extends Equatable {
  final Surat surat;

  const InfoAyah({
    required this.surat,
  });

  @override
  List<Object?> get props => [surat];
}

class Surat extends Equatable {
  final int id;
  final Nama nama;
  final String relevasi;
  final int ayatMax;

  const Surat({
    required this.id,
    required this.nama,
    required this.relevasi,
    required this.ayatMax,
  });

  @override
  List<Object?> get props => [id, nama, relevasi, ayatMax];
}

class Nama extends Equatable {
  final String ar;
  final String id;

  const Nama({
    required this.ar,
    required this.id,
  });

  @override
  List<Object?> get props => [ar, id];
}
