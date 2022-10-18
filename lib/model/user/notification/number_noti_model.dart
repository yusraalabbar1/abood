// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

NumberNotification welcomeFromJson(String str) =>
    NumberNotification.fromJson(json.decode(str));

String welcomeToJson(NumberNotification data) => json.encode(data.toJson());

class NumberNotification {
  NumberNotification({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  int? data;

  factory NumberNotification.fromJson(Map<String, dynamic> json) =>
      NumberNotification(
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
