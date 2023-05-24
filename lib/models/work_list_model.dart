// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

WorkListModel workListModelFromJson(String str) =>
    WorkListModel.fromJson(json.decode(str));

String workListModelToJson(WorkListModel data) => json.encode(data.toJson());

class WorkListModel {
  List<Datum>? data;

  WorkListModel({
    this.data,
  });

  factory WorkListModel.fromJson(Map<String, dynamic> json) => WorkListModel(
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
  String? address;
  String? hours;
  String? minutes;
  String? contactPersonName;
  String? contactPersonPhoneNumber;
  String? startTime;
  String? endTime;
  int? id;

  Datum({
    this.address,
    this.hours,
    this.minutes,
    this.contactPersonName,
    this.contactPersonPhoneNumber,
    this.startTime,
    this.endTime,
    this.id,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        address: json["address"],
        hours: json["hours"],
        minutes: json["minutes"],
        contactPersonName: json["contact_person_name"],
        contactPersonPhoneNumber: json["contact_person_phone_number"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "hours": hours,
        "minutes": minutes,
        "contact_person_name": contactPersonName,
        "contact_person_phone_number": contactPersonPhoneNumber,
        "start_time": startTime,
        "end_time": endTime,
        "id": id,
      };
}
