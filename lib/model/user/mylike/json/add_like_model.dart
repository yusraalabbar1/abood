// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddLikeModel welcomeFromJson(String str) =>
    AddLikeModel.fromJson(json.decode(str));

String welcomeToJson(AddLikeModel data) => json.encode(data.toJson());

class AddLikeModel {
  AddLikeModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory AddLikeModel.fromJson(Map<String, dynamic> json) => AddLikeModel(
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
