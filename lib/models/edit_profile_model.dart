// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) =>
    EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) =>
    json.encode(data.toJson());

class EditProfileModel {
  String? message;
  User? user;

  EditProfileModel({
    this.message,
    this.user,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      EditProfileModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
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
  String? cityName;
  String? countryId;
  String? phoneNumber;
  DateTime? joinDate;
  String? employeeNumber;
  String? amountOfVacationDays;
  String? amountOfHoursWork;
  var profile;
  String? otp;
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
    this.cityName,
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
        cityName: json['city_name'],
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
        "city_name": cityName,
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
