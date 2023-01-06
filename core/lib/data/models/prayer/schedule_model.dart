import 'package:core/domain/entities/prayer/schedule.dart';
import 'package:equatable/equatable.dart';

class ScheduleModel extends Equatable {
  ScheduleModel({
    required this.tanggal,
    required this.imsak,
    required this.subuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
    required this.date,
  });

  String tanggal;
  String imsak;
  String subuh;
  String terbit;
  String dhuha;
  String dzuhur;
  String ashar;
  String maghrib;
  String isya;
  String date;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        tanggal: json["tanggal"],
        imsak: json["imsak"],
        subuh: json["subuh"],
        terbit: json["terbit"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        ashar: json["ashar"],
        maghrib: json["maghrib"],
        isya: json["isya"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "imsak": imsak,
        "subuh": subuh,
        "terbit": terbit,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "ashar": ashar,
        "maghrib": maghrib,
        "isya": isya,
        "date": date,
      };

  Schedule toEntity() {
    return Schedule(
        tanggal: tanggal,
        imsak: imsak,
        subuh: subuh,
        terbit: terbit,
        dhuha: dhuha,
        dzuhur: dzuhur,
        ashar: ashar,
        maghrib: maghrib,
        isya: isya,
        date: date);
  }

  @override
  List<Object?> get props => [
        tanggal,
        imsak,
        subuh,
        terbit,
        dhuha,
        dzuhur,
        ashar,
        maghrib,
        isya,
        date
      ];
}
