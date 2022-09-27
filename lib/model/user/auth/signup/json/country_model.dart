// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CountryModel welcomeFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String welcomeToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<Datum>? data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.descAr,
    this.descEn,
    this.active,
    this.id,
  });

  String? descAr;
  String? descEn;
  bool? active;
  int? id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        descAr: json["descAr"],
        descEn: json["descEn"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "descAr": descAr,
        "descEn": descEn,
        "active": active,
        "id": id,
      };
}
