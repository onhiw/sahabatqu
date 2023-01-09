import 'package:core/domain/entities/quran/ayah_response_e.dart';
import 'package:equatable/equatable.dart';

class AyahResponseA extends Equatable {
  AyahResponseA({required this.ayahResponseE});

  AyahResponseE ayahResponseE;

  @override
  List<Object?> get props => [ayahResponseE];
}
