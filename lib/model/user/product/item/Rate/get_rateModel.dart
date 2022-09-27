// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ModelRate RateFromJson(String str) => ModelRate.fromJson(json.decode(str));

String welcomeToJson(ModelRate data) => json.encode(data.toJson());

class ModelRate {
  ModelRate({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<DatumRate>? data;

  factory ModelRate.fromJson(Map<String, dynamic> json) => ModelRate(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null
            ? List<DatumRate>.from(
                json["data"].map((x) => DatumRate.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumRate {
  DatumRate({
    this.id,
    this.userId,
    this.fullName,
    this.rate,
    this.rateText,
  });

  int? id;
  int? userId;
  String? fullName;
  double? rate;
  String? rateText;

  factory DatumRate.fromJson(Map<String, dynamic> json) => DatumRate(
        id: json["id"],
        userId: json["userId"],
        fullName: json["fullName"],
        rate: json["rate"],
        rateText: json["rateText"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "fullName": fullName,
        "rate": rate,
        "rateText": rateText,
      };
}
