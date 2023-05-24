// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

EditProblemModel editProblemModelFromJson(String str) =>
    EditProblemModel.fromJson(json.decode(str));

String editProblemModelToJson(EditProblemModel data) =>
    json.encode(data.toJson());

class EditProblemModel {
  String? message;

  EditProblemModel({
    this.message,
  });

  factory EditProblemModel.fromJson(Map<String, dynamic> json) =>
      EditProblemModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
