// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SubCatMobel SubCatMobelFromJson(String str) =>
    SubCatMobel.fromJson(json.decode(str));

String SubCatMobelToJson(SubCatMobel data) => json.encode(data.toJson());

class SubCatMobel {
  SubCatMobel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<SubCatMobelData>? data;

  factory SubCatMobel.fromJson(Map<String, dynamic> json) => SubCatMobel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<SubCatMobelData>.from(
            json["data"].map((x) => SubCatMobelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SubCatMobelData {
  SubCatMobelData({
    this.sectionId,
    this.descAr,
    this.descEn,
    this.sortOrder,
    this.active,
    this.id,
  });

  int? sectionId;
  String? descAr;
  String? descEn;
  String? sortOrder;
  bool? active;
  int? id;

  factory SubCatMobelData.fromJson(Map<String, dynamic> json) =>
      SubCatMobelData(
        sectionId: json["sectionId"],
        descAr: json["descAr"],
        descEn: json["descEn"],
        sortOrder: json["sortOrder"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "sectionId": sectionId,
        "descAr": descAr,
        "descEn": descEn,
        "sortOrder": sortOrder,
        "active": active,
        "id": id,
      };
}
