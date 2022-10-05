// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Payment payFromJson(String str) => Payment.fromJson(json.decode(str));

String welcomeToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    this.userId,
    this.fullName,
    this.mobileNo,
    this.cityId,
    this.area,
    this.streetName,
    this.buildingNo,
    this.stores,
  });

  int? userId;
  String? fullName;
  String? mobileNo;
  int? cityId;
  String? area;
  String? streetName;
  String? buildingNo;
  List<Store>? stores;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        userId: json["UserId"],
        fullName: json["FullName"],
        mobileNo: json["MobileNo"],
        cityId: json["CityId"],
        area: json["Area"],
        streetName: json["StreetName"],
        buildingNo: json["BuildingNo"],
        stores: List<Store>.from(json["Stores"].map((x) => Store.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "FullName": fullName,
        "MobileNo": mobileNo,
        "CityId": cityId,
        "Area": area,
        "StreetName": streetName,
        "BuildingNo": buildingNo,
        "Stores": List<dynamic>.from(stores!.map((x) => x.toJson())),
      };
}

class Store {
  Store({
    this.storeId,
    this.couponCode,
    this.details,
  });

  int? storeId;
  String? couponCode;
  List<Detail>? details;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        storeId: json["StoreId"],
        couponCode: json["CouponCode"],
        details:
            List<Detail>.from(json["Details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StoreId": storeId,
        "CouponCode": couponCode,
        "Details": List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.itemId,
    this.itemSizeId,
    this.itemColorId,
    this.qty,
    this.total,
  });

  int? itemId;
  int? itemSizeId;
  int? itemColorId;
  int? qty;
  int? total;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        itemId: json["ItemId"],
        itemSizeId: json["ItemSizeId"],
        itemColorId: json["ItemColorId"],
        qty: json["Qty"],
        total: json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "ItemId": itemId,
        "ItemSizeId": itemSizeId,
        "ItemColorId": itemColorId,
        "Qty": qty,
        "Total": total,
      };
}
