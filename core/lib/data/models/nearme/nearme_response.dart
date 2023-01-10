import 'package:core/data/models/nearme/nearme_model.dart';
import 'package:equatable/equatable.dart';

class NearmeResponse extends Equatable {
  final List<NearmeModel> nearmeList;

  const NearmeResponse({required this.nearmeList});

  factory NearmeResponse.fromJson(Map<String, dynamic> json) => NearmeResponse(
        nearmeList: List<NearmeModel>.from(
            (json["results"] as List).map((x) => NearmeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(nearmeList.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [nearmeList];
}
