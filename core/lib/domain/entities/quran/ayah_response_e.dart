import 'package:core/domain/entities/quran/ayah_data.dart';
import 'package:equatable/equatable.dart';

class AyahResponseE extends Equatable {
  AyahResponseE({required this.ayahData});

  AyahData ayahData;

  @override
  List<Object?> get props => [ayahData];
}
