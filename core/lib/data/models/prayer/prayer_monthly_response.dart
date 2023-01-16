import 'package:core/data/models/prayer/prayer_monthly_model.dart';
import 'package:core/domain/entities/prayer/prayer_monthly_response_e.dart';
import 'package:equatable/equatable.dart';

class PrayerMonthlyResponse extends Equatable {
  const PrayerMonthlyResponse({
    required this.status,
    required this.data,
  });

  final bool status;
  final PrayerMonthlyModel data;

  factory PrayerMonthlyResponse.fromJson(Map<String, dynamic> json) =>
      PrayerMonthlyResponse(
        status: json["status"],
        data: PrayerMonthlyModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };

  PrayerMonthlyResponseE toEntity() {
    return PrayerMonthlyResponseE(
        status: status, prayerMonthly: data.toEntity());
  }

  @override
  List<Object?> get props => [status, data];
}
