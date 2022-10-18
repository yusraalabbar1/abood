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
  DatumRate? data;

  factory ModelRate.fromJson(Map<String, dynamic> json) => ModelRate(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: DatumRate.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data!.toJson(),
      };
}

class DatumRate {
  DatumRate({
    this.totalOfRate,
    this.rate,
    this.itemRates,
  });

  dynamic? totalOfRate;
  dynamic? rate;
  List<ItemRate>? itemRates;

  factory DatumRate.fromJson(Map<String, dynamic> json) => DatumRate(
        totalOfRate: json["totalOfRate"],
        rate: json["rate"],
        itemRates: List<ItemRate>.from(
            json["itemRates"].map((x) => ItemRate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalOfRate": totalOfRate,
        "rate": rate,
        "itemRates": List<dynamic>.from(itemRates!.map((x) => x.toJson())),
      };
}

class ItemRate {
  ItemRate({
    this.id,
    this.userId,
    this.fullName,
    this.rate,
    this.rateText,
  });

  int? id;
  int? userId;
  String? fullName;
  dynamic? rate;
  String? rateText;

  factory ItemRate.fromJson(Map<String, dynamic> json) => ItemRate(
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
