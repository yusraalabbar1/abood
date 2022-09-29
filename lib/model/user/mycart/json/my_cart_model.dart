// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MyCartModel welcomeFromJson(String str) =>
    MyCartModel.fromJson(json.decode(str));

String welcomeToJson(MyCartModel data) => json.encode(data.toJson());

class MyCartModel {
  MyCartModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<Datum>? data;

  factory MyCartModel.fromJson(Map<String, dynamic> json) => MyCartModel(
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
    this.storeId,
    this.descEn,
    this.descAr,
    this.info,
    this.image,
    this.itemId,
    this.itemName,
    this.itemDescription,
    this.qty,
    this.price,
    this.newPrice,
    this.extraText,
    this.offerText,
    this.isOffer,
    this.isCheck,
    this.itemImages,
    this.itemColors,
    this.itemSizes,
  });

  int? id;
  int? storeId;
  String? descEn;
  String? descAr;
  String? info;
  String? image;
  int? itemId;
  String? itemName;
  String? itemDescription;
  int? qty;
  bool? isCheck;
  dynamic? price;
  dynamic? newPrice;
  String? extraText;
  String? offerText;
  bool? isOffer;
  List<ItemImage>? itemImages;
  ItemColors? itemColors;
  ItemSizes? itemSizes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        storeId: json["storeId"],
        descEn: json["descEn"],
        descAr: json["descAr"],
        info: json["info"],
        image: json["image"],
        itemId: json["itemId"],
        itemName: json["itemName"],
        isCheck: json["isCheck"],
        itemDescription: json["itemDescription"],
        qty: json["qty"],
        price: json["price"],
        newPrice: json["newPrice"],
        extraText: json["extraText"],
        offerText: json["offerText"],
        isOffer: json["isOffer"],
        itemImages: json["itemImages"] != null
            ? List<ItemImage>.from(
                json["itemImages"].map((x) => ItemImage.fromJson(x)))
            : null,
        itemColors: json["itemColors"] != null
            ? ItemColors.fromJson(json["itemColors"])
            : null,
        itemSizes: json["itemSizes"] != null
            ? ItemSizes.fromJson(json["itemSizes"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "storeId": storeId,
        "descEn": descEn,
        "descAr": descAr,
        "info": info,
        "image": image,
        "itemId": itemId,
        "itemName": itemName,
        "isCheck": isCheck,
        "itemDescription": itemDescription,
        "qty": qty,
        "price": price,
        "newPrice": newPrice,
        "extraText": extraText,
        "offerText": offerText,
        "isOffer": isOffer,
        "itemImages": List<dynamic>.from(itemImages!.map((x) => x.toJson())),
        "itemColors": itemColors!.toJson(),
        "itemSizes": itemSizes!.toJson(),
      };
}

class ItemColors {
  ItemColors({
    this.itemId,
    this.itemColorId,
    this.value,
  });

  int? itemId;
  int? itemColorId;
  String? value;

  factory ItemColors.fromJson(Map<String, dynamic> json) => ItemColors(
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

class ItemSizes {
  ItemSizes({
    this.itemId,
    this.itemSizeId,
    this.itemSizeDescAr,
    this.itemSizeDescEn,
  });

  int? itemId;
  int? itemSizeId;
  String? itemSizeDescAr;
  String? itemSizeDescEn;

  factory ItemSizes.fromJson(Map<String, dynamic> json) => ItemSizes(
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
