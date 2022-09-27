// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

StorMain StorMainFromJson(String str) => StorMain.fromJson(json.decode(str));

String StorMainToJson(StorMain data) => json.encode(data.toJson());

class StorMain {
  StorMain({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<StorMainData>? data;

  factory StorMain.fromJson(Map<String, dynamic> json) => StorMain(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null
            ? List<StorMainData>.from(
                json["data"].map((x) => StorMainData.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StorMainData {
  StorMainData({
    this.descEn,
    this.descAr,
    this.info,
    this.image,
    this.sortOrder,
    this.active,
    this.id,
  });

  String? descEn;
  String? descAr;
  String? info;
  String? image;
  int? sortOrder;
  bool? active;
  int? id;

  factory StorMainData.fromJson(Map<String, dynamic> json) => StorMainData(
        descEn: json["descEn"],
        descAr: json["descAr"],
        info: json["info"],
        image: json["image"],
        sortOrder: json["sortOrder"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "descEn": descEn,
        "descAr": descAr,
        "info": info,
        "image": image,
        "sortOrder": sortOrder,
        "active": active,
        "id": id,
      };
}
