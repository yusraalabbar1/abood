//GeneratNewOtp
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

GeneratNewOtp welcomeFromJson(String str) =>
    GeneratNewOtp.fromJson(json.decode(str));

String welcomeToJson(GeneratNewOtp data) => json.encode(data.toJson());

class GeneratNewOtp {
  GeneratNewOtp({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  Data? data;

  factory GeneratNewOtp.fromJson(Map<String, dynamic> json) => GeneratNewOtp(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.userId,
  });

  int? userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
      };
}
