// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CategoryModel CategoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String CategoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<Datum>? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
    this.sortOrder,
    this.active,
    this.id,
  });

  String? descAr;
  String? descEn;
  String? sortOrder;
  bool? active;
  int? id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        descAr: json["descAr"],
        descEn: json["descEn"],
        sortOrder: json["sortOrder"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "descAr": descAr,
        "descEn": descEn,
        "sortOrder": sortOrder,
        "active": active,
        "id": id,
      };
}
