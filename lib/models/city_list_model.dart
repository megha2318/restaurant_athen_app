// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CityListModel cityListModelFromJson(String str) =>
    CityListModel.fromJson(json.decode(str));

String cityListModelToJson(CityListModel data) => json.encode(data.toJson());

class CityListModel {
  String? message;
  List<Object>? object;

  CityListModel({
    this.message,
    this.object,
  });

  factory CityListModel.fromJson(Map<String, dynamic> json) => CityListModel(
        message: json["message"],
        object: json["object"] == null
            ? []
            : List<Object>.from(json["object"]!.map((x) => Object.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "object": object == null
            ? []
            : List<dynamic>.from(object!.map((x) => x.toJson())),
      };
}

class Object {
  int? id;
  String? name;
  String? countryId;
  String? status;
  dynamic createdAt;
  dynamic updatedAt;

  Object({
    this.id,
    this.name,
    this.countryId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
