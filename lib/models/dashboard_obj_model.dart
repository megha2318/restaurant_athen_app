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
  DateTime? startDate;
  String? clientName;
  String? keyNumber;
  String? address;
  String? hour;
  String? googleMapUrl;
  String? fromTime;
  String? at;
  int? id;

  Datum({
    this.startDate,
    this.clientName,
    this.keyNumber,
    this.address,
    this.hour,
    this.googleMapUrl,
    this.fromTime,
    this.at,
    this.id,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        clientName: json["client_name"],
        keyNumber: json["key_number"],
        address: json["address"],
        hour: json["hour"],
        googleMapUrl: json["google_map_url"],
        fromTime: json["from_time"],
        at: json["at"],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "client_name": clientName,
        "key_number": keyNumber,
        "address": address,
        "hour": hour,
        "google_map_url": googleMapUrl,
        "from_time": fromTime,
        "at": at,
        "id": id,
      };
}
