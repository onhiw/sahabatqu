import 'package:core/domain/entities/quran/ayah_response_e.dart';
import 'package:core/domain/entities/quran/surah.dart';
import 'package:equatable/equatable.dart';

class AyahResponseA extends Equatable {
  AyahResponseA({required this.ayahResponseE, required this.surah});

  AyahResponseE ayahResponseE;
  Surah surah;

  @override
  List<Object?> get props => [ayahResponseE, surah];
}
