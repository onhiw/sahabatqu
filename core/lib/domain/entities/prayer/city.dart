import 'package:equatable/equatable.dart';

class City extends Equatable {
  const City({required this.id, required this.lokasi});

  final String id;
  final String lokasi;

  @override
  List<Object?> get props => [id, lokasi];
}
