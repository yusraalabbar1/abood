// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddCart welcomeFromJson(String str) => AddCart.fromJson(json.decode(str));

String welcomeToJson(AddCart data) => json.encode(data.toJson());

class AddCart {
  AddCart({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory AddCart.fromJson(Map<String, dynamic> json) => AddCart(
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
