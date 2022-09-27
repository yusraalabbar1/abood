// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddImagModel welcomeFromJson(String str) =>
    AddImagModel.fromJson(json.decode(str));

String welcomeToJson(AddImagModel data) => json.encode(data.toJson());

class AddImagModel {
  AddImagModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory AddImagModel.fromJson(Map<String, dynamic> json) => AddImagModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null ? json["data"] : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data,
      };
}
