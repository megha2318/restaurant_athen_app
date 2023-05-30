// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UnAssignObjModel unAssignObjModelFromJson(String str) =>
    UnAssignObjModel.fromJson(json.decode(str));

String unAssignObjModelToJson(UnAssignObjModel data) =>
    json.encode(data.toJson());

class UnAssignObjModel {
  String? message;
  List<Object>? object;

  UnAssignObjModel({
    this.message,
    this.object,
  });

  factory UnAssignObjModel.fromJson(Map<String, dynamic> json) =>
      UnAssignObjModel(
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
  String? userId;
  String? clientName;
  String? clientNumber;
  String? address;
  String? postcode;
  String? cityName;
  String? keyNumber;
  DateTime? startDate;
  String? phoneNumber;
  String? googleMapUrl;
  String? implementationTime;
  String? fromTime;
  String? rotationType;
  String? days;
  String? contactPersonName;
  String? contactPersonPhoneNumber;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Object({
    this.id,
    this.userId,
    this.clientName,
    this.clientNumber,
    this.address,
    this.postcode,
    this.cityName,
    this.keyNumber,
    this.startDate,
    this.phoneNumber,
    this.googleMapUrl,
    this.implementationTime,
    this.fromTime,
    this.rotationType,
    this.days,
    this.contactPersonName,
    this.contactPersonPhoneNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        id: json["id"],
        userId: json["user_id"],
        clientName: json["client_name"],
        clientNumber: json["client_number"],
        address: json["address"],
        postcode: json["postcode"],
        cityName: json["city_name"],
        keyNumber: json["key_number"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        phoneNumber: json["phone_number"],
        googleMapUrl: json["google_map_url"],
        implementationTime: json["implementation_time"],
        fromTime: json["from_time"],
        rotationType: json["rotation_type"],
        days: json["days"],
        contactPersonName: json["contact_person_name"],
        contactPersonPhoneNumber: json["contact_person_phone_number"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "client_name": clientName,
        "client_number": clientNumber,
        "address": address,
        "postcode": postcode,
        "city_name": cityName,
        "key_number": keyNumber,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "phone_number": phoneNumber,
        "google_map_url": googleMapUrl,
        "implementation_time": implementationTime,
        "from_time": fromTime,
        "rotation_type": rotationType,
        "days": days,
        "contact_person_name": contactPersonName,
        "contact_person_phone_number": contactPersonPhoneNumber,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
