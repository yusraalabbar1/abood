// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BannerMainModel welcomeFromJson(String str) =>
    BannerMainModel.fromJson(json.decode(str));

String welcomeToJson(BannerMainModel data) => json.encode(data.toJson());

class BannerMainModel {
  BannerMainModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<Datum>? data;

  factory BannerMainModel.fromJson(Map<String, dynamic> json) =>
      BannerMainModel(
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
    this.image,
    this.redirectLink,
    this.sortOrder,
    this.target,
    this.value,
    this.active,
    this.id,
  });

  String? image;
  String? redirectLink;
  int? sortOrder;
  String? target;
  String? value;
  bool? active;
  int? id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        image: json["image"],
        redirectLink: json["redirectLink"],
        sortOrder: json["sortOrder"],
        target: json["target"] == null ? null : json["target"],
        value: json["value"] == null ? null : json["value"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "redirectLink": redirectLink,
        "sortOrder": sortOrder,
        "target": target == null ? null : target,
        "value": value == null ? null : value,
        "active": active,
        "id": id,
      };
}
