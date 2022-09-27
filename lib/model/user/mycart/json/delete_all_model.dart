// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DeleteAllCart welcomeFromJson(String str) =>
    DeleteAllCart.fromJson(json.decode(str));

String welcomeToJson(DeleteAllCart data) => json.encode(data.toJson());

class DeleteAllCart {
  DeleteAllCart({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory DeleteAllCart.fromJson(Map<String, dynamic> json) => DeleteAllCart(
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
