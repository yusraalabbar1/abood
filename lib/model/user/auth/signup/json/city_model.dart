// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CityModel welcomeFromJson(String str) => CityModel.fromJson(json.decode(str));

String welcomeToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<Datum>? data;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
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
    this.countryId,
    this.cityAr,
    this.cityOt,
    this.active,
    this.id,
  });

  int? countryId;
  String? cityAr;
  String? cityOt;
  bool? active;
  int? id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        countryId: json["countryId"],
        cityAr: json["cityAr"],
        cityOt: json["cityOt"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "countryId": countryId,
        "cityAr": cityAr,
        "cityOt": cityOt,
        "active": active,
        "id": id,
      };
}
