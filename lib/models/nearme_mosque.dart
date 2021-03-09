// To parse this JSON data, do
//
//     final nearmeMosqueModel = nearmeMosqueModelFromJson(jsonString);

import 'dart:convert';

NearmeMosqueModel nearmeMosqueModelFromJson(String str) =>
    NearmeMosqueModel.fromJson(json.decode(str));

String nearmeMosqueModelToJson(NearmeMosqueModel data) =>
    json.encode(data.toJson());

class NearmeMosqueModel {
  NearmeMosqueModel({
    this.htmlAttributions,
    this.nextPageToken,
    this.results,
    this.status,
  });

  List<String> htmlAttributions;
  String nextPageToken;
  List<Result> results;
  String status;

  factory NearmeMosqueModel.fromJson(Map<String, dynamic> json) =>
      NearmeMosqueModel(
        htmlAttributions: json["html_attributions"] == null
            ? null
            : List<String>.from(json["html_attributions"].map((x) => x)),
        nextPageToken:
            json["next_page_token"] == null ? null : json["next_page_token"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "html_attributions": htmlAttributions == null
            ? null
            : List<dynamic>.from(htmlAttributions.map((x) => x)),
        "next_page_token": nextPageToken == null ? null : nextPageToken,
        "results": results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status == null ? null : status,
      };
}

class Result {
  Result({
    this.businessStatus,
    this.geometry,
    this.icon,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.scope,
    this.types,
    this.userRatingsTotal,
    this.vicinity,
    this.permanentlyClosed,
  });

  String businessStatus;
  Geometry geometry;
  String icon;
  String name;
  OpeningHours openingHours;
  List<Photo> photos;
  String placeId;
  PlusCode plusCode;
  double rating;
  String reference;
  String scope;
  List<String> types;
  int userRatingsTotal;
  String vicinity;
  bool permanentlyClosed;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        businessStatus:
            json["business_status"] == null ? null : json["business_status"],
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        icon: json["icon"] == null ? null : json["icon"],
        name: json["name"] == null ? null : json["name"],
        openingHours: json["opening_hours"] == null
            ? null
            : OpeningHours.fromJson(json["opening_hours"]),
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        placeId: json["place_id"] == null ? null : json["place_id"],
        plusCode: json["plus_code"] == null
            ? null
            : PlusCode.fromJson(json["plus_code"]),
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        reference: json["reference"] == null ? null : json["reference"],
        scope: json["scope"] == null ? null : json["scope"],
        types: json["types"] == null
            ? null
            : List<String>.from(json["types"].map((x) => x)),
        userRatingsTotal: json["user_ratings_total"] == null
            ? null
            : json["user_ratings_total"],
        vicinity: json["vicinity"] == null ? null : json["vicinity"],
        permanentlyClosed: json["permanently_closed"] == null
            ? null
            : json["permanently_closed"],
      );

  Map<String, dynamic> toJson() => {
        "business_status": businessStatus == null ? null : businessStatus,
        "geometry": geometry == null ? null : geometry.toJson(),
        "icon": icon == null ? null : icon,
        "name": name == null ? null : name,
        "opening_hours": openingHours == null ? null : openingHours.toJson(),
        "photos": photos == null
            ? null
            : List<dynamic>.from(photos.map((x) => x.toJson())),
        "place_id": placeId == null ? null : placeId,
        "plus_code": plusCode == null ? null : plusCode.toJson(),
        "rating": rating == null ? null : rating,
        "reference": reference == null ? null : reference,
        "scope": scope == null ? null : scope,
        "types": types == null ? null : List<String>.from(types.map((x) => x)),
        "user_ratings_total":
            userRatingsTotal == null ? null : userRatingsTotal,
        "vicinity": vicinity == null ? null : vicinity,
        "permanently_closed":
            permanentlyClosed == null ? null : permanentlyClosed,
      };
}

class Geometry {
  Geometry({
    this.location,
    this.viewport,
  });

  Location location;
  Viewport viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        viewport: json["viewport"] == null
            ? null
            : Viewport.fromJson(json["viewport"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location == null ? null : location.toJson(),
        "viewport": viewport == null ? null : viewport.toJson(),
      };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  double lat;
  double lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}

class Viewport {
  Viewport({
    this.northeast,
    this.southwest,
  });

  Location northeast;
  Location southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: json["northeast"] == null
            ? null
            : Location.fromJson(json["northeast"]),
        southwest: json["southwest"] == null
            ? null
            : Location.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast == null ? null : northeast.toJson(),
        "southwest": southwest == null ? null : southwest.toJson(),
      };
}

class OpeningHours {
  OpeningHours({
    this.openNow,
  });

  bool openNow;

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"] == null ? null : json["open_now"],
      );

  Map<String, dynamic> toJson() => {
        "open_now": openNow == null ? null : openNow,
      };
}

class Photo {
  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"] == null ? null : json["height"],
        htmlAttributions: json["html_attributions"] == null
            ? null
            : List<String>.from(json["html_attributions"].map((x) => x)),
        photoReference:
            json["photo_reference"] == null ? null : json["photo_reference"],
        width: json["width"] == null ? null : json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "html_attributions": htmlAttributions == null
            ? null
            : List<dynamic>.from(htmlAttributions.map((x) => x)),
        "photo_reference": photoReference == null ? null : photoReference,
        "width": width == null ? null : width,
      };
}

class PlusCode {
  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  String compoundCode;
  String globalCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode:
            json["compound_code"] == null ? null : json["compound_code"],
        globalCode: json["global_code"] == null ? null : json["global_code"],
      );

  Map<String, dynamic> toJson() => {
        "compound_code": compoundCode == null ? null : compoundCode,
        "global_code": globalCode == null ? null : globalCode,
      };
}
