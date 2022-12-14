// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MyPymentModel welcomeFromJson(String str) =>
    MyPymentModel.fromJson(json.decode(str));

String welcomeToJson(MyPymentModel data) => json.encode(data.toJson());

class MyPymentModel {
  MyPymentModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory MyPymentModel.fromJson(Map<String, dynamic> json) => MyPymentModel(
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
