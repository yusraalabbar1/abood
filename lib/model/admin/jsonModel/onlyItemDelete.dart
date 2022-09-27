// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

deletOnlyItem welcomeFromJson(String str) =>
    deletOnlyItem.fromJson(json.decode(str));

String welcomeToJson(deletOnlyItem data) => json.encode(data.toJson());

class deletOnlyItem {
  deletOnlyItem({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  String? data;

  factory deletOnlyItem.fromJson(Map<String, dynamic> json) => deletOnlyItem(
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
