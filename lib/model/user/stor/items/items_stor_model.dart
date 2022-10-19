// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ItemsStoreModel welcomeFromJson(String str) =>
    ItemsStoreModel.fromJson(json.decode(str));

String welcomeToJson(ItemsStoreModel data) => json.encode(data.toJson());

class ItemsStoreModel {
  ItemsStoreModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<Datum>? data;

  factory ItemsStoreModel.fromJson(Map<String, dynamic> json) =>
      ItemsStoreModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.descEn,
    this.descAr,
    this.info,
    this.image,
    this.storeId,
    this.itemId,
    this.itemName,
    this.itemDescription,
    this.price,
    this.newPrice,
    this.extraText,
    this.offerText,
    this.isOffer,
    this.isWish,
    this.rate,
    this.itemImages,
    this.itemColors,
    this.itemSizes,
  });

  int? id;
  String? descEn;
  String? descAr;
  String? info;
  String? image;
  int? storeId;
  int? itemId;
  String? itemName;
  String? itemDescription;
  dynamic price;
  dynamic newPrice;
  String? extraText;
  dynamic? offerText;
  bool? isOffer;
  bool? isWish;
  dynamic? rate;
  List<dynamic>? itemImages;
  List<ItemColor>? itemColors;
  List<ItemSize>? itemSizes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        descEn: json["descEn"],
        descAr: json["descAr"],
        info: json["info"],
        image: json["image"],
        storeId: json["storeId"],
        itemId: json["itemId"],
        itemName: json["itemName"],
        itemDescription: json["itemDescription"],
        price: json["price"],
        newPrice: json["newPrice"],
        extraText: json["extraText"],
        offerText: json["offerText"],
        isOffer: json["isOffer"],
        isWish: json["isWish"],
        rate: json["rate"],
        itemImages: List<dynamic>.from(json["itemImages"].map((x) => x)),
        itemColors: List<ItemColor>.from(
            json["itemColors"].map((x) => ItemColor.fromJson(x))),
        itemSizes: List<ItemSize>.from(
            json["itemSizes"].map((x) => ItemSize.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descEn": descEn,
        "descAr": descAr,
        "info": info,
        "image": image,
        "storeId": storeId,
        "itemId": itemId,
        "itemName": itemName,
        "itemDescription": itemDescription,
        "price": price,
        "newPrice": newPrice,
        "extraText": extraText,
        "offerText": offerText,
        "isOffer": isOffer,
        "isWish": isWish,
        "rate": rate,
        "itemImages": List<dynamic>.from(itemImages!.map((x) => x)),
        "itemColors": List<dynamic>.from(itemColors!.map((x) => x.toJson())),
        "itemSizes": List<dynamic>.from(itemSizes!.map((x) => x.toJson())),
      };
}

class ItemColor {
  ItemColor({
    this.itemId,
    this.itemColorId,
    this.value,
    this.qty,
  });

  int? itemId;
  int? itemColorId;
  String? value;
  int? qty;

  factory ItemColor.fromJson(Map<String, dynamic> json) => ItemColor(
        itemId: json["itemId"],
        itemColorId: json["itemColorId"],
        value: json["value"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "itemColorId": itemColorId,
        "value": value,
        "qty": qty,
      };
}

class ItemSize {
  ItemSize({
    this.itemId,
    this.itemSizeId,
    this.itemSizeDescAr,
    this.itemSizeDescEn,
  });

  int? itemId;
  int? itemSizeId;
  String? itemSizeDescAr;
  String? itemSizeDescEn;

  factory ItemSize.fromJson(Map<String, dynamic> json) => ItemSize(
        itemId: json["itemId"],
        itemSizeId: json["itemSizeId"],
        itemSizeDescAr: json["itemSizeDescAr"],
        itemSizeDescEn: json["itemSizeDescEn"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "itemSizeId": itemSizeId,
        "itemSizeDescAr": itemSizeDescAr,
        "itemSizeDescEn": itemSizeDescEn,
      };
}
