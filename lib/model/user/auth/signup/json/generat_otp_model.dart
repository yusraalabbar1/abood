// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

GenerateOtp welcomeFromJson(String str) =>
    GenerateOtp.fromJson(json.decode(str));

String welcomeToJson(GenerateOtp data) => json.encode(data.toJson());

class GenerateOtp {
  GenerateOtp({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  Data? data;

  factory GenerateOtp.fromJson(Map<String, dynamic> json) => GenerateOtp(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
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
