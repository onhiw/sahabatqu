import 'package:core/domain/entities/quran/ayah.dart';
import 'package:equatable/equatable.dart';

class AyahData extends Equatable {
  const AyahData({
    required this.ar,
    required this.idt,
    required this.id,
  });

  final List<Ayah> ar;
  final List<Ayah> idt;
  final List<Ayah> id;

  @override
  List<Object?> get props => [ar, idt, id];
}
