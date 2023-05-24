// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SingleObjModel singleObjModelFromJson(String str) =>
    SingleObjModel.fromJson(json.decode(str));

String singleObjModelToJson(SingleObjModel data) => json.encode(data.toJson());

class SingleObjModel {
  Data? data;

  SingleObjModel({
    this.data,
  });

  factory SingleObjModel.fromJson(Map<String, dynamic> json) => SingleObjModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? userId;
  String? employeeId;
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
  List<Pdf>? pdfs;
  String? contactPersonName;
  String? contactPersonPhoneNumber;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Task>? tasks;
  List<Signature>? signature;
  List<Problem>? problems;

  Data({
    this.id,
    this.userId,
    this.employeeId,
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
    this.pdfs,
    this.contactPersonName,
    this.contactPersonPhoneNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tasks,
    this.signature,
    this.problems,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        employeeId: json["employee_id"],
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
        pdfs: json["pdfs"] == null
            ? []
            : List<Pdf>.from(json["pdfs"]!.map((x) => Pdf.fromJson(x))),
        contactPersonName: json["contact_person_name"],
        contactPersonPhoneNumber: json["contact_person_phone_number"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        tasks: json["tasks"] == null
            ? []
            : List<Task>.from(json["tasks"]!.map((x) => Task.fromJson(x))),
        signature: json["signature"] == null
            ? []
            : List<Signature>.from(
                json["signature"]!.map((x) => Signature.fromJson(x))),
        problems: json["problems"] == null
            ? []
            : List<Problem>.from(
                json["problems"]!.map((x) => Problem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "employee_id": employeeId,
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
        "pdfs": pdfs == null
            ? []
            : List<dynamic>.from(pdfs!.map((x) => x.toJson())),
        "contact_person_name": contactPersonName,
        "contact_person_phone_number": contactPersonPhoneNumber,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "tasks": tasks == null
            ? []
            : List<dynamic>.from(tasks!.map((x) => x.toJson())),
        "signature": signature == null
            ? []
            : List<dynamic>.from(signature!.map((x) => x.toJson())),
        "problems": problems == null
            ? []
            : List<dynamic>.from(problems!.map((x) => x.toJson())),
      };
}

class Pdf {
  int? id;
  String? userId;
  String? objectId;
  String? pdf;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pdf({
    this.id,
    this.userId,
    this.objectId,
    this.pdf,
    this.createdAt,
    this.updatedAt,
  });

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        id: json["id"],
        userId: json["user_id"],
        objectId: json["object_id"],
        pdf: json["pdf"],
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
        "object_id": objectId,
        "pdf": pdf,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Problem {
  int? id;
  String? reason;
  String? image;

  Problem({
    this.id,
    this.reason,
    this.image,
  });

  factory Problem.fromJson(Map<String, dynamic> json) => Problem(
        id: json["id"],
        reason: json["reason"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reason": reason,
        "image": image,
      };
}

class Signature {
  int? id;
  String? signature;

  Signature({
    this.id,
    this.signature,
  });

  factory Signature.fromJson(Map<String, dynamic> json) => Signature(
        id: json["id"],
        signature: json["signature"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "signature": signature,
      };
}

class Task {
  int? id;
  String? employeeId;
  String? name;
  String? status;
  dynamic pdf;
  List<Employee>? employee;

  Task({
    this.id,
    this.employeeId,
    this.name,
    this.status,
    this.pdf,
    this.employee,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        employeeId: json["employee_id"],
        name: json["name"],
        status: json["status"],
        pdf: json["pdf"],
        employee: json["employee"] == null
            ? []
            : List<Employee>.from(
                json["employee"]!.map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_id": employeeId,
        "name": name,
        "status": status,
        "pdf": pdf,
        "employee": employee == null
            ? []
            : List<dynamic>.from(employee!.map((x) => x.toJson())),
      };
}

class Employee {
  int? id;
  String? firstName;
  String? lastName;

  Employee({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
      };
}
