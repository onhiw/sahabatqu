import 'package:core/domain/entities/prayer/coordinate.dart';
import 'package:core/domain/entities/prayer/schedule.dart';
import 'package:equatable/equatable.dart';

class PrayerDaily extends Equatable {
  const PrayerDaily(
      {required this.id,
      required this.lokasi,
      required this.daerah,
      required this.coordinate,
      required this.schedule});

  final String id;
  final String lokasi;
  final String daerah;
  final Coordinate coordinate;
  final Schedule schedule;

  PrayerDaily toEntity() {
    return PrayerDaily(
        id: id,
        lokasi: lokasi,
        daerah: daerah,
        coordinate: coordinate,
        schedule: schedule);
  }

  @override
  List<Object?> get props => [id, lokasi, daerah, coordinate, schedule];
}
