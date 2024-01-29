import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  const Surah({
    required this.audioUrl,
    required this.nameEn,
    required this.nameId,
    required this.nameLong,
    required this.nameShort,
    required this.number,
    required this.numberOfVerses,
    required this.revelation,
    required this.revelationEn,
    required this.revelationId,
    required this.sequence,
    required this.tafsir,
    required this.translationEn,
    required this.translationId,
  });

  final String audioUrl;
  final String nameEn;
  final String nameId;
  final String nameLong;
  final String nameShort;
  final String number;
  final String numberOfVerses;
  final String revelation;
  final String revelationEn;
  final String revelationId;
  final String sequence;
  final String tafsir;
  final String translationEn;
  final String translationId;

  @override
  List<Object?> get props => [
        audioUrl,
        nameEn,
        nameId,
        nameLong,
        nameShort,
        number,
        numberOfVerses,
        revelation,
        revelationEn,
        revelationId,
        sequence,
        tafsir,
        translationEn,
        translationId
      ];
}
