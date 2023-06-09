// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DashboardObjModel dashboardObjModelFromJson(String str) =>
    DashboardObjModel.fromJson(json.decode(str));

String dashboardObjModelToJson(DashboardObjModel data) =>
    json.encode(data.toJson());

class DashboardObjModel {
  List<Datum>? data;

  DashboardObjModel({
    this.data,
  });

  factory DashboardObjModel.fromJson(Map<String, dynamic> json) =>
      DashboardObjModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  Objects? objects;
  dynamic startDate;
  dynamic clientName;
  dynamic keyNumber;
  dynamic address;
  String? hour;
  dynamic googleMapUrl;
  String? fromTime;
  String? at;

  Datum({
    this.id,
    this.objects,
    this.startDate,
    this.clientName,
    this.keyNumber,
    this.address,
    this.hour,
    this.googleMapUrl,
    this.fromTime,
    this.at,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        objects:
            json["objects"] == null ? null : Objects.fromJson(json["objects"]),
        startDate: json["start_date"],
        clientName: json["client_name"],
        keyNumber: json["key_number"],
        address: json["address"],
        hour: json["hour"],
        googleMapUrl: json["google_map_url"],
        fromTime: json["from_time"],
        at: json["at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "objects": objects?.toJson(),
        "start_date": startDate,
        "client_name": clientName,
        "key_number": keyNumber,
        "address": address,
        "hour": hour,
        "google_map_url": googleMapUrl,
        "from_time": fromTime,
        "at": at,
      };
}

class Objects {
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

  Objects({
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

  factory Objects.fromJson(Map<String, dynamic> json) => Objects(
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
