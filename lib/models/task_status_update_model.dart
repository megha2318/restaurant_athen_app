// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TaskStatusUpdateModel taskStatusUpdateModelFromJson(String str) =>
    TaskStatusUpdateModel.fromJson(json.decode(str));

String taskStatusUpdateModelToJson(TaskStatusUpdateModel data) =>
    json.encode(data.toJson());

class TaskStatusUpdateModel {
  String? message;

  TaskStatusUpdateModel({
    this.message,
  });

  factory TaskStatusUpdateModel.fromJson(Map<String, dynamic> json) =>
      TaskStatusUpdateModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
