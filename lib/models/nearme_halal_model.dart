// To parse this JSON data, do
//
//     final nearmeHalalModel = nearmeHalalModelFromJson(jsonString);

import 'dart:convert';

NearmeHalalModel nearmeHalalModelFromJson(String str) =>
    NearmeHalalModel.fromJson(json.decode(str));

String nearmeHalalModelToJson(NearmeHalalModel data) =>
    json.encode(data.toJson());

class NearmeHalalModel {
  NearmeHalalModel({
    this.meta,
    this.response,
  });

  Meta meta;
  ResultData response;

  factory NearmeHalalModel.fromJson(Map<String, dynamic> json) =>
      NearmeHalalModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        response: json["response"] == null
            ? null
            : ResultData.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta == null ? null : meta.toJson(),
        "response": response == null ? null : response.toJson(),
      };
}

class Meta {
  Meta({
    this.code,
    this.requestId,
  });

  int code;
  String requestId;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"] == null ? null : json["code"],
        requestId: json["requestId"] == null ? null : json["requestId"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "requestId": requestId == null ? null : requestId,
      };
}

class ResultData {
  ResultData({
    this.suggestedFilters,
    this.suggestedRadius,
    this.headerLocation,
    this.headerFullLocation,
    this.headerLocationGranularity,
    this.query,
    this.totalResults,
    this.suggestedBounds,
    this.groups,
  });

  SuggestedFilters suggestedFilters;
  int suggestedRadius;
  String headerLocation;
  String headerFullLocation;
  String headerLocationGranularity;
  String query;
  int totalResults;
  SuggestedBounds suggestedBounds;
  List<Group> groups;

  factory ResultData.fromJson(Map<String, dynamic> json) => ResultData(
        suggestedFilters: json["suggestedFilters"] == null
            ? null
            : SuggestedFilters.fromJson(json["suggestedFilters"]),
        suggestedRadius:
            json["suggestedRadius"] == null ? null : json["suggestedRadius"],
        headerLocation:
            json["headerLocation"] == null ? null : json["headerLocation"],
        headerFullLocation: json["headerFullLocation"] == null
            ? null
            : json["headerFullLocation"],
        headerLocationGranularity: json["headerLocationGranularity"] == null
            ? null
            : json["headerLocationGranularity"],
        query: json["query"] == null ? null : json["query"],
        totalResults:
            json["totalResults"] == null ? null : json["totalResults"],
        suggestedBounds: json["suggestedBounds"] == null
            ? null
            : SuggestedBounds.fromJson(json["suggestedBounds"]),
        groups: json["groups"] == null
            ? null
            : List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "suggestedFilters":
            suggestedFilters == null ? null : suggestedFilters.toJson(),
        "suggestedRadius": suggestedRadius == null ? null : suggestedRadius,
        "headerLocation": headerLocation == null ? null : headerLocation,
        "headerFullLocation":
            headerFullLocation == null ? null : headerFullLocation,
        "headerLocationGranularity": headerLocationGranularity == null
            ? null
            : headerLocationGranularity,
        "query": query == null ? null : query,
        "totalResults": totalResults == null ? null : totalResults,
        "suggestedBounds":
            suggestedBounds == null ? null : suggestedBounds.toJson(),
        "groups": groups == null
            ? null
            : List<dynamic>.from(groups.map((x) => x.toJson())),
      };
}

class Group {
  Group({
    this.type,
    this.name,
    this.items,
  });

  String type;
  String name;
  List<GroupItem> items;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        type: json["type"] == null ? null : json["type"],
        name: json["name"] == null ? null : json["name"],
        items: json["items"] == null
            ? null
            : List<GroupItem>.from(
                json["items"].map((x) => GroupItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "name": name == null ? null : name,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class GroupItem {
  GroupItem({
    this.reasons,
    this.venue,
    this.referralId,
  });

  Reasons reasons;
  Venue venue;
  String referralId;

  factory GroupItem.fromJson(Map<String, dynamic> json) => GroupItem(
        reasons:
            json["reasons"] == null ? null : Reasons.fromJson(json["reasons"]),
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
        referralId: json["referralId"] == null ? null : json["referralId"],
      );

  Map<String, dynamic> toJson() => {
        "reasons": reasons == null ? null : reasons.toJson(),
        "venue": venue == null ? null : venue.toJson(),
        "referralId": referralId == null ? null : referralId,
      };
}

class Reasons {
  Reasons({
    this.count,
    this.items,
  });

  int count;
  List<ReasonsItem> items;

  factory Reasons.fromJson(Map<String, dynamic> json) => Reasons(
        count: json["count"] == null ? null : json["count"],
        items: json["items"] == null
            ? null
            : List<ReasonsItem>.from(
                json["items"].map((x) => ReasonsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ReasonsItem {
  ReasonsItem({
    this.summary,
    this.type,
    this.reasonName,
  });

  String summary;
  String type;
  String reasonName;

  factory ReasonsItem.fromJson(Map<String, dynamic> json) => ReasonsItem(
        summary: json["summary"] == null ? null : json["summary"],
        type: json["type"] == null ? null : json["type"],
        reasonName: json["reasonName"] == null ? null : json["reasonName"],
      );

  Map<String, dynamic> toJson() => {
        "summary": summary == null ? null : summary,
        "type": type == null ? null : type,
        "reasonName": reasonName == null ? null : reasonName,
      };
}

class Venue {
  Venue({
    this.id,
    this.name,
    this.location,
    this.categories,
    this.photos,
  });

  String id;
  String name;
  Location location;
  List<Category> categories;
  Photos photos;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        photos: json["photos"] == null ? null : Photos.fromJson(json["photos"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "location": location == null ? null : location.toJson(),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
        "photos": photos == null ? null : photos.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.pluralName,
    this.shortName,
    this.icon,
    this.primary,
  });

  String id;
  String name;
  String pluralName;
  String shortName;
  IconResult icon;
  bool primary;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        pluralName: json["pluralName"] == null ? null : json["pluralName"],
        shortName: json["shortName"] == null ? null : json["shortName"],
        icon: json["icon"] == null ? null : IconResult.fromJson(json["icon"]),
        primary: json["primary"] == null ? null : json["primary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "pluralName": pluralName == null ? null : pluralName,
        "shortName": shortName == null ? null : shortName,
        "icon": icon == null ? null : icon.toJson(),
        "primary": primary == null ? null : primary,
      };
}

class IconResult {
  IconResult({
    this.prefix,
    this.suffix,
  });

  String prefix;
  String suffix;

  factory IconResult.fromJson(Map<String, dynamic> json) => IconResult(
        prefix: json["prefix"] == null ? null : json["prefix"],
        suffix: json["suffix"] == null ? null : json["suffix"],
      );

  Map<String, dynamic> toJson() => {
        "prefix": prefix == null ? null : prefix,
        "suffix": suffix == null ? null : suffix,
      };
}

class Location {
  Location({
    this.lat,
    this.lng,
    this.labeledLatLngs,
    this.distance,
    this.postalCode,
    this.cc,
    this.city,
    this.state,
    this.country,
    this.formattedAddress,
    this.address,
    this.crossStreet,
    this.neighborhood,
  });

  double lat;
  double lng;
  List<LabeledLatLng> labeledLatLngs;
  int distance;
  String postalCode;
  String cc;
  String city;
  String state;
  String country;
  List<String> formattedAddress;
  String address;
  String crossStreet;
  String neighborhood;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
        labeledLatLngs: json["labeledLatLngs"] == null
            ? null
            : List<LabeledLatLng>.from(
                json["labeledLatLngs"].map((x) => LabeledLatLng.fromJson(x))),
        distance: json["distance"] == null ? null : json["distance"],
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        cc: json["cc"] == null ? null : json["cc"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        formattedAddress: json["formattedAddress"] == null
            ? null
            : List<String>.from(json["formattedAddress"].map((x) => x)),
        address: json["address"] == null ? null : json["address"],
        crossStreet: json["crossStreet"] == null ? null : json["crossStreet"],
        neighborhood:
            json["neighborhood"] == null ? null : json["neighborhood"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "labeledLatLngs": labeledLatLngs == null
            ? null
            : List<dynamic>.from(labeledLatLngs.map((x) => x.toJson())),
        "distance": distance == null ? null : distance,
        "postalCode": postalCode == null ? null : postalCode,
        "cc": cc == null ? null : cc,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "formattedAddress": formattedAddress == null
            ? null
            : List<dynamic>.from(formattedAddress.map((x) => x)),
        "address": address == null ? null : address,
        "crossStreet": crossStreet == null ? null : crossStreet,
        "neighborhood": neighborhood == null ? null : neighborhood,
      };
}

class LabeledLatLng {
  LabeledLatLng({
    this.label,
    this.lat,
    this.lng,
  });

  String label;
  double lat;
  double lng;

  factory LabeledLatLng.fromJson(Map<String, dynamic> json) => LabeledLatLng(
        label: json["label"] == null ? null : json["label"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "label": label == null ? null : label,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}

class Photos {
  Photos({
    this.count,
    this.groups,
  });

  int count;
  List<dynamic> groups;

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        count: json["count"] == null ? null : json["count"],
        groups: json["groups"] == null
            ? null
            : List<dynamic>.from(json["groups"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "groups":
            groups == null ? null : List<dynamic>.from(groups.map((x) => x)),
      };
}

class SuggestedBounds {
  SuggestedBounds({
    this.ne,
    this.sw,
  });

  Ne ne;
  Ne sw;

  factory SuggestedBounds.fromJson(Map<String, dynamic> json) =>
      SuggestedBounds(
        ne: json["ne"] == null ? null : Ne.fromJson(json["ne"]),
        sw: json["sw"] == null ? null : Ne.fromJson(json["sw"]),
      );

  Map<String, dynamic> toJson() => {
        "ne": ne == null ? null : ne.toJson(),
        "sw": sw == null ? null : sw.toJson(),
      };
}

class Ne {
  Ne({
    this.lat,
    this.lng,
  });

  double lat;
  double lng;

  factory Ne.fromJson(Map<String, dynamic> json) => Ne(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}

class SuggestedFilters {
  SuggestedFilters({
    this.header,
    this.filters,
  });

  String header;
  List<Filter> filters;

  factory SuggestedFilters.fromJson(Map<String, dynamic> json) =>
      SuggestedFilters(
        header: json["header"] == null ? null : json["header"],
        filters: json["filters"] == null
            ? null
            : List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "header": header == null ? null : header,
        "filters": filters == null
            ? null
            : List<dynamic>.from(filters.map((x) => x.toJson())),
      };
}

class Filter {
  Filter({
    this.name,
    this.key,
  });

  String name;
  String key;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        name: json["name"] == null ? null : json["name"],
        key: json["key"] == null ? null : json["key"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "key": key == null ? null : key,
      };
}
