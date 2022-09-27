// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddRateModel welcomeFromJson(String str) =>
    AddRateModel.fromJson(json.decode(str));

String welcomeToJson(AddRateModel data) => json.encode(data.toJson());

class AddRateModel {
  AddRateModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory AddRateModel.fromJson(Map<String, dynamic> json) => AddRateModel(
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
