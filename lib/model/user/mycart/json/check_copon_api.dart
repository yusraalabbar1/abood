// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CheckCoponModel welcomeFromJson(String str) =>
    CheckCoponModel.fromJson(json.decode(str));

String welcomeToJson(CheckCoponModel data) => json.encode(data.toJson());

class CheckCoponModel {
  CheckCoponModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  Data? data;

  factory CheckCoponModel.fromJson(Map<String, dynamic> json) =>
      CheckCoponModel(
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
    this.total,
    this.discount,
    this.netTotal,
  });

  double? total;
  double? discount;
  double? netTotal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        discount: json["discount"].toDouble(),
        netTotal: json["netTotal"] != null ? json["netTotal"].toDouble() : null,
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "discount": discount,
        "netTotal": netTotal,
      };
}
