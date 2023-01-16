import 'package:core/data/models/prayer/coordinate_model.dart';
import 'package:core/data/models/prayer/schedule_model.dart';
import 'package:core/domain/entities/prayer/prayer_daily.dart';
import 'package:equatable/equatable.dart';

class PrayerDailyModel extends Equatable {
  const PrayerDailyModel({
    required this.id,
    required this.lokasi,
    required this.daerah,
    required this.coordinateModel,
    required this.scheduleModel,
  });

  final String id;
  final String lokasi;
  final String daerah;
  final CoordinateModel coordinateModel;
  final ScheduleModel scheduleModel;

  factory PrayerDailyModel.fromJson(Map<String, dynamic> json) =>
      PrayerDailyModel(
        id: json["id"],
        lokasi: json["lokasi"],
        daerah: json["daerah"],
        coordinateModel: CoordinateModel.fromJson(json["koordinat"]),
        scheduleModel: ScheduleModel.fromJson(json["jadwal"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lokasi": lokasi,
        "daerah": daerah,
        "koordinat": coordinateModel.toJson(),
        "jadwal": scheduleModel.toJson(),
      };

  PrayerDaily toEntity() {
    return PrayerDaily(
        id: id,
        lokasi: lokasi,
        daerah: daerah,
        coordinate: coordinateModel.toEntity(),
        schedule: scheduleModel.toEntity());
  }

  @override
  List<Object?> get props =>
      [id, lokasi, daerah, coordinateModel, scheduleModel];
}
