// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

EditSignatureModel editSignatureModelFromJson(String str) =>
    EditSignatureModel.fromJson(json.decode(str));

String editSignatureModelToJson(EditSignatureModel data) =>
    json.encode(data.toJson());

class EditSignatureModel {
  String? message;

  EditSignatureModel({
    this.message,
  });

  factory EditSignatureModel.fromJson(Map<String, dynamic> json) =>
      EditSignatureModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
