// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

VerifyModel welcomeFromJson(String str) =>
    VerifyModel.fromJson(json.decode(str));

String welcomeToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
  VerifyModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
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
