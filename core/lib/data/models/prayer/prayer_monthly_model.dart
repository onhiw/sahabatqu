import 'package:core/data/models/prayer/coordinate_model.dart';
import 'package:core/data/models/prayer/schedule_model.dart';
import 'package:core/domain/entities/prayer/prayer_monthly.dart';
import 'package:equatable/equatable.dart';

class PrayerMonthlyModel extends Equatable {
  PrayerMonthlyModel({
    required this.id,
    required this.lokasi,
    required this.daerah,
    required this.coordinateModel,
    required this.scheduleModel,
  });

  String id;
  String lokasi;
  String daerah;
  CoordinateModel coordinateModel;
  List<ScheduleModel> scheduleModel;

  factory PrayerMonthlyModel.fromJson(Map<String, dynamic> json) =>
      PrayerMonthlyModel(
        id: json["id"],
        lokasi: json["lokasi"],
        daerah: json["daerah"],
        coordinateModel: CoordinateModel.fromJson(json["koordinat"]),
        scheduleModel: List<ScheduleModel>.from(
            json["jadwal"].map((x) => ScheduleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lokasi": lokasi,
        "daerah": daerah,
        "koordinat": coordinateModel.toJson(),
        "jadwal": List<dynamic>.from(scheduleModel.map((x) => x.toJson())),
      };

  PrayerMonthly toEntity() {
    return PrayerMonthly(
        id: id,
        lokasi: lokasi,
        daerah: daerah,
        coordinate: coordinateModel.toEntity(),
        schedule:
            scheduleModel.map((schedule) => schedule.toEntity()).toList());
  }

  @override
  List<Object?> get props =>
      [id, lokasi, daerah, coordinateModel, scheduleModel];
}
