// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ForgetModel welcomeFromJson(String str) =>
    ForgetModel.fromJson(json.decode(str));

String welcomeToJson(ForgetModel data) => json.encode(data.toJson());

class ForgetModel {
  ForgetModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  Data? data;

  factory ForgetModel.fromJson(Map<String, dynamic> json) => ForgetModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.userId,
  });

  int? userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
      };
}
