// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginModel LoginFromJson(String str) => LoginModel.fromJson(json.decode(str));

String LoginToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  DataLoginModel? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data:
            json["data"] != null ? DataLoginModel.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data!.toJson(),
      };
}

class DataLoginModel {
  DataLoginModel({
    this.userType,
    this.countryId,
    this.mobileNumber,
    this.password,
    this.firstName,
    this.lastName,
    this.fullName,
    this.deviceId,
    this.createDate,
    required this.active,
    this.id,
  });

  int? userType;
  int? countryId;
  String? mobileNumber;
  String? password;
  String? firstName;
  String? lastName;
  dynamic? fullName;
  String? deviceId;
  DateTime? createDate;
  bool active;
  int? id;

  factory DataLoginModel.fromJson(Map<String, dynamic> json) => DataLoginModel(
        userType: json["userType"],
        countryId: json["countryId"],
        mobileNumber: json["mobileNumber"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        deviceId: json["deviceId"],
        createDate: DateTime.parse(json["createDate"]),
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "userType": userType,
        "countryId": countryId,
        "mobileNumber": mobileNumber,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "deviceId": deviceId,
        "createDate": createDate!.toIso8601String(),
        "active": active,
        "id": id,
      };
}
