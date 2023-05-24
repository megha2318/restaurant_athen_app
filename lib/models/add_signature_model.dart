// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddSignatureModel addSignatureModelFromJson(String str) => AddSignatureModel.fromJson(json.decode(str));

String addSignatureModelToJson(AddSignatureModel data) => json.encode(data.toJson());

class AddSignatureModel {
  String? message;

  AddSignatureModel({
    this.message,
  });

  factory AddSignatureModel.fromJson(Map<String, dynamic> json) => AddSignatureModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
