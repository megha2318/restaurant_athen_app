// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Data? data;
  String? message;

  LoginModel({
    this.data,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  String? token;
  User? user;

  Data({
    this.token,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? address;
  String? zipcode;
  String? cityId;
  String? countryId;
  String? phoneNumber;
  DateTime? joinDate;
  String? employeeNumber;
  String? amountOfVacationDays;
  String? amountOfHoursWork;
  dynamic profile;
  dynamic otp;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.address,
    this.zipcode,
    this.cityId,
    this.countryId,
    this.phoneNumber,
    this.joinDate,
    this.employeeNumber,
    this.amountOfVacationDays,
    this.amountOfHoursWork,
    this.profile,
    this.otp,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        username: json["username"],
        address: json["address"],
        zipcode: json["zipcode"],
        cityId: json["city_id"],
        countryId: json["country_id"],
        phoneNumber: json["phone_number"],
        joinDate: json["join_date"] == null
            ? null
            : DateTime.parse(json["join_date"]),
        employeeNumber: json["employee_number"],
        amountOfVacationDays: json["amount_of_vacation_days"],
        amountOfHoursWork: json["amount_of_hours_work"],
        profile: json["profile"],
        otp: json["otp"],
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
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "username": username,
        "address": address,
        "zipcode": zipcode,
        "city_id": cityId,
        "country_id": countryId,
        "phone_number": phoneNumber,
        "join_date":
            "${joinDate!.year.toString().padLeft(4, '0')}-${joinDate!.month.toString().padLeft(2, '0')}-${joinDate!.day.toString().padLeft(2, '0')}",
        "employee_number": employeeNumber,
        "amount_of_vacation_days": amountOfVacationDays,
        "amount_of_hours_work": amountOfHoursWork,
        "profile": profile,
        "otp": otp,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
