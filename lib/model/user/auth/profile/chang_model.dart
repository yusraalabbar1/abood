// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ChangePassModel welcomeFromJson(String str) =>
    ChangePassModel.fromJson(json.decode(str));

String welcomeToJson(ChangePassModel data) => json.encode(data.toJson());

class ChangePassModel {
  ChangePassModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory ChangePassModel.fromJson(Map<String, dynamic> json) =>
      ChangePassModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data,
      };
}
