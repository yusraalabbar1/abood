// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DeleteCart welcomeFromJson(String str) => DeleteCart.fromJson(json.decode(str));

String welcomeToJson(DeleteCart data) => json.encode(data.toJson());

class DeleteCart {
  DeleteCart({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory DeleteCart.fromJson(Map<String, dynamic> json) => DeleteCart(
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
