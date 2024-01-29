import 'package:equatable/equatable.dart';

class Ayah extends Equatable {
  const Ayah({
    required this.arab,
    required this.asbab,
    required this.audio,
    required this.ayah,
    required this.hizb,
    required this.id,
    required this.juz,
    required this.latin,
    required this.notes,
    required this.page,
    required this.surah,
    required this.text,
    required this.theme,
  });

  final String arab;
  final String asbab;
  final String audio;
  final String ayah;
  final String hizb;
  final String id;
  final String juz;
  final String latin;
  final String notes;
  final String page;
  final String surah;
  final String text;
  final String theme;

  @override
  List<Object?> get props => [
        arab,
        asbab,
        audio,
        ayah,
        hizb,
        id,
        juz,
        latin,
        notes,
        page,
        surah,
        text,
        theme
      ];
}
