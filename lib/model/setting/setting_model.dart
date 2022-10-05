// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SettingModel welcomeFromJson(String str) =>
    SettingModel.fromJson(json.decode(str));

String welcomeToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  SettingModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<DatumSetting>? data;

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<DatumSetting>.from(
            json["data"].map((x) => DatumSetting.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : null,
      };
}

class DatumSetting {
  DatumSetting({
    this.name,
    this.value,
    this.isEditior,
    this.isMedia,
    this.displayName,
    this.id,
  });

  String? name;
  String? value;
  bool? isEditior;
  bool? isMedia;
  String? displayName;
  int? id;

  factory DatumSetting.fromJson(Map<String, dynamic> json) => DatumSetting(
        name: json["name"],
        value: json["value"],
        isEditior: json["isEditior"],
        isMedia: json["isMedia"],
        displayName: json["displayName"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "isEditior": isEditior,
        "isMedia": isMedia,
        "displayName": displayName,
        "id": id,
      };
}
