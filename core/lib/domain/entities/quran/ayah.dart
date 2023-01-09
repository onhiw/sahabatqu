import 'package:equatable/equatable.dart';

class Ayah extends Equatable {
  const Ayah({
    required this.id,
    required this.surat,
    required this.ayat,
    required this.teks,
  });

  final String id;
  final String surat;
  final String ayat;
  final String teks;

  @override
  List<Object?> get props => [id, surat, ayat, teks];
}
