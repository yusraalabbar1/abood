import 'dart:convert';

AddItem AddItemFromJson(String str) => AddItem.fromJson(json.decode(str));

String AddItemToJson(AddItem data) => json.encode(data.toJson());

class AddItem {
  AddItem({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  DataAddItem? data;

  factory AddItem.fromJson(Map<String, dynamic> json) => AddItem(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null ? DataAddItem.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data!.toJson(),
      };
}

class DataAddItem {
  DataAddItem({
    this.itemId,
  });

  int? itemId;

  factory DataAddItem.fromJson(Map<String, dynamic> json) => DataAddItem(
        itemId: json["itemId"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
      };
}
