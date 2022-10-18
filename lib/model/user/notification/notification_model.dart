// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

NotificationModel NotificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String welcomeToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<DatumNotification>? data;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<DatumNotification>.from(
            json["data"].map((x) => DatumNotification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumNotification {
  DatumNotification({
    this.title,
    this.body,
    this.date,
    this.notificationImage,
    this.target,
    this.value,
    this.id,
  });

  String? title;
  String? body;
  DateTime? date;
  dynamic? notificationImage;
  String? target;
  String? value;
  int? id;

  factory DatumNotification.fromJson(Map<String, dynamic> json) =>
      DatumNotification(
        title: json["title"],
        body: json["body"],
        date: DateTime.parse(json["date"]),
        notificationImage: json["notificationImage"],
        target: json["target"] == null ? null : json["target"],
        value: json["value"] == null ? null : json["value"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "date": date!.toIso8601String(),
        "notificationImage": notificationImage,
        "target": target == null ? null : target,
        "value": value == null ? null : value,
        "id": id,
      };
}
