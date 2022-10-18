// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

OrderModel orderFromJson(String str) => OrderModel.fromJson(json.decode(str));

String welcomeToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.isSuccess,
    this.message,
    this.data,
  });

  bool? isSuccess;
  String? message;
  List<DatumOrders>? data;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] != null
            ? List<DatumOrders>.from(
                json["data"].map((x) => DatumOrders.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumOrders {
  DatumOrders({
    this.id,
    this.storeId,
    this.storeDescEn,
    this.storeDescAr,
    this.userId,
    this.requestNo,
    this.requestDate,
    this.couponCode,
    this.fullName,
    this.mobileNo,
    this.cityId,
    this.area,
    this.streetName,
    this.buildingNo,
    this.total,
    this.discount,
    this.netTotal,
    this.statusId,
    this.statusDesc,
    this.details,
  });

  int? id;
  int? storeId;
  int? userId;
  String? storeDescEn;
  String? storeDescAr;
  String? requestNo;
  DateTime? requestDate;
  String? couponCode;
  String? fullName;
  String? mobileNo;
  int? cityId;
  String? area;
  String? streetName;
  String? buildingNo;
  dynamic? total;
  dynamic? discount;
  dynamic? netTotal;
  dynamic? statusId;
  dynamic? statusDesc;
  List<Detail>? details;

  factory DatumOrders.fromJson(Map<String, dynamic> json) => DatumOrders(
        id: json["id"],
        storeId: json["storeId"],
        userId: json["userId"],
        storeDescEn: json["storeDescEn"],
        storeDescAr: json["storeDescAr"],
        requestNo: json["requestNo"],
        requestDate: DateTime.parse(json["requestDate"]),
        couponCode: json["couponCode"],
        fullName: json["fullName"],
        mobileNo: json["mobileNo"],
        cityId: json["cityId"],
        area: json["area"],
        streetName: json["streetName"],
        buildingNo: json["buildingNo"],
        total: json["total"],
        discount: json["discount"],
        netTotal: json["netTotal"],
        statusId: json["statusId"],
        statusDesc: json["statusDesc"],
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "storeId": storeId,
        "userId": userId,
        "storeDescEn": storeDescEn,
        "storeDescAr": storeDescAr,
        "requestNo": requestNo,
        "requestDate": requestDate!.toIso8601String(),
        "couponCode": couponCode,
        "fullName": fullName,
        "mobileNo": mobileNo,
        "cityId": cityId,
        "area": area,
        "streetName": streetName,
        "buildingNo": buildingNo,
        "total": total,
        "discount": discount,
        "netTotal": netTotal,
        "statusId": statusId,
        "statusDesc": statusDesc,
        "details": List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.userId,
    this.userRequestId,
    this.itemId,
    this.itemName,
    this.itemDescription,
    this.price,
    this.itemSizeId,
    this.itemSizeDescEn,
    this.itemSizeDescAr,
    this.itemColorId,
    this.itemColorValue,
    this.qty,
    this.totalItem,
    this.images,
  });

  int? userId;
  int? userRequestId;
  int? itemId;
  String? itemName;
  String? itemDescription;
  dynamic? price;
  int? itemSizeId;
  String? itemSizeDescEn;
  String? itemSizeDescAr;
  int? itemColorId;
  String? itemColorValue;
  int? qty;
  dynamic? totalItem;
  List<Image>? images;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        userId: json["userId"],
        userRequestId: json["userRequestId"],
        itemId: json["itemId"],
        itemName: json["itemName"],
        itemDescription: json["itemDescription"],
        price: json["price"],
        itemSizeId: json["itemSizeId"],
        itemSizeDescEn: json["itemSizeDescEn"],
        itemSizeDescAr: json["itemSizeDescAr"],
        itemColorId: json["itemColorId"],
        itemColorValue: json["itemColorValue"],
        qty: json["qty"],
        totalItem: json["totalItem"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userRequestId": userRequestId,
        "itemId": itemId,
        "itemName": itemName,
        "itemDescription": itemDescription,
        "price": price,
        "itemSizeId": itemSizeId,
        "itemSizeDescEn": itemSizeDescEn,
        "itemSizeDescAr": itemSizeDescAr,
        "itemColorId": itemColorId,
        "itemColorValue": itemColorValue,
        "qty": qty,
        "totalItem": totalItem,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    this.itemId,
    this.imageUrl,
    this.id,
  });

  int? itemId;
  String? imageUrl;
  int? id;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        itemId: json["itemId"],
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "imageUrl": imageUrl,
        "id": id,
      };
}
