// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddProblemModel addProblemModelFromJson(String str) =>
    AddProblemModel.fromJson(json.decode(str));

String addProblemModelToJson(AddProblemModel data) =>
    json.encode(data.toJson());

class AddProblemModel {
  String? message;

  AddProblemModel({
    this.message,
  });

  factory AddProblemModel.fromJson(Map<String, dynamic> json) =>
      AddProblemModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
