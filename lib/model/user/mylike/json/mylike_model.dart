// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LikeModel welcomeFromJson(String str) => LikeModel.fromJson(json.decode(str));

String welcomeToJson(LikeModel data) => json.encode(data.toJson());

class LikeModel {
  LikeModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<Datum>? data;

  factory LikeModel.fromJson(Map<String, dynamic> json) => LikeModel(
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
  dynamic? price;
  dynamic? newPrice;
  String? extraText;
  String? offerText;
  bool? isOffer;
  List<ItemImage>? itemImages;
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
        offerText: json["offerText"] == null ? null : json["offerText"],
        isOffer: json["isOffer"],
        itemImages: json["itemImages"] != null
            ? List<ItemImage>.from(
                json["itemImages"].map((x) => ItemImage.fromJson(x)))
            : null,
        itemColors: json["itemColors"] != null
            ? List<ItemColor>.from(
                json["itemColors"].map((x) => ItemColor.fromJson(x)))
            : null,
        itemSizes: json["itemSizes"] != null
            ? List<ItemSize>.from(
                json["itemSizes"].map((x) => ItemSize.fromJson(x)))
            : null,
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
        "offerText": offerText == null ? null : offerText,
        "isOffer": isOffer,
        "itemImages": List<dynamic>.from(itemImages!.map((x) => x.toJson())),
        "itemColors": List<dynamic>.from(itemColors!.map((x) => x.toJson())),
        "itemSizes": List<dynamic>.from(itemSizes!.map((x) => x.toJson())),
      };
}

class ItemColor {
  ItemColor({
    this.itemId,
    this.itemColorId,
    this.value,
  });

  int? itemId;
  int? itemColorId;
  String? value;

  factory ItemColor.fromJson(Map<String, dynamic> json) => ItemColor(
        itemId: json["itemId"],
        itemColorId: json["itemColorId"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "itemColorId": itemColorId,
        "value": value,
      };
}

class ItemImage {
  ItemImage({
    this.itemId,
    this.itemImageId,
    this.imageUrl,
  });

  int? itemId;
  int? itemImageId;
  String? imageUrl;

  factory ItemImage.fromJson(Map<String, dynamic> json) => ItemImage(
        itemId: json["itemId"],
        itemImageId: json["itemImageId"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "itemImageId": itemImageId,
        "imageUrl": imageUrl,
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
