// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BannerModel BannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String BannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<BannerData>? data;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null
            ? List<BannerData>.from(
                json["data"].map((x) => BannerData.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BannerData {
  BannerData({
    this.image,
    this.active,
    this.id,
  });

  String? image;
  bool? active;
  int? id;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        image: json["image"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "active": active,
        "id": id,
      };
}
