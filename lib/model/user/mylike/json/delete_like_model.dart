// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DeletLike welcomeFromJson(String str) => DeletLike.fromJson(json.decode(str));

String welcomeToJson(DeletLike data) => json.encode(data.toJson());

class DeletLike {
  DeletLike({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory DeletLike.fromJson(Map<String, dynamic> json) => DeletLike(
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
