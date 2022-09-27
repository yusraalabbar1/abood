// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

QtyModel welcomeFromJson(String str) => QtyModel.fromJson(json.decode(str));

String welcomeToJson(QtyModel data) => json.encode(data.toJson());

class QtyModel {
  QtyModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory QtyModel.fromJson(Map<String, dynamic> json) => QtyModel(
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
