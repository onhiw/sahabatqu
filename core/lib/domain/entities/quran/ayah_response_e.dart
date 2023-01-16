import 'package:core/domain/entities/quran/ayah_data.dart';
import 'package:equatable/equatable.dart';

class AyahResponseE extends Equatable {
  final AyahData ayahData;

  const AyahResponseE({required this.ayahData});

  @override
  List<Object?> get props => [ayahData];
}
