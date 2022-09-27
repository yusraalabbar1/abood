// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RigesterModel welcomeFromJson(String str) =>
    RigesterModel.fromJson(json.decode(str));

String welcomeToJson(RigesterModel data) => json.encode(data.toJson());

class RigesterModel {
  RigesterModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory RigesterModel.fromJson(Map<String, dynamic> json) => RigesterModel(
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
