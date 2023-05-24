// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TaskListModel taskListModelFromJson(String str) =>
    TaskListModel.fromJson(json.decode(str));

String taskListModelToJson(TaskListModel data) => json.encode(data.toJson());

class TaskListModel {
  List<Datum>? data;

  TaskListModel({
    this.data,
  });

  factory TaskListModel.fromJson(Map<String, dynamic> json) => TaskListModel(
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
  String? name;
  String? pdf;

  Datum({
    this.name,
    this.pdf,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        pdf: json["pdf"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "pdf": pdf,
      };
}
