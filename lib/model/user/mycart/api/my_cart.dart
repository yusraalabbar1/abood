import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/api/check_coupon.dart';
import 'package:abood/model/user/mycart/api/update_check.dart';
import 'package:abood/model/user/mycart/json/my_cart_model.dart';
import 'package:abood/model/user/mycart/json/object_payment.dart';
import 'package:abood/view/user/other/myHome/allStore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;

// var thirdMap;

myCartApi() async {
  List<Map<dynamic, dynamic>> thirdMap = [];
  List<Map<dynamic, dynamic>> MyCart = [];
  List stor = [];
  List storPrice = [];
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  Homecontroller controller = Get.put(Homecontroller());
  int id = controller.id;
  double total = 0.0;
  double total1 = 0.0;
  double totalnew = 0.0;
  var request = http.Request('GET', Uri.parse(baseURL + '/api/cart/$id'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);

  MyCartModel c = MyCartModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        MyCart.add(c.data![i].toJson());
        // print(c.data![i].toJson()["qty"]);
        if (c.data![i].toJson()["isCheck"] == true) {
          total = total +
              (c.data![i].toJson()["qty"] * c.data![i].toJson()["newPrice"]);
          stor.add(c.data![i].toJson()["storeId"]);
        }
      }

      print("========MyCart===============");
      // print(MyCart.length);
      print(MyCart);
      controllerPro.SaveMyCart(MyCart);
      controllerPro.SaveMyCartTotal(total);

      stor = stor.toSet().toList();

      print("===================stors id===================");
      print(stor);
      for (var j = 0; j < stor.length; j++) {
        for (var i = 0; i < c.data!.length; i++) {
          if (c.data![i].toJson()["storeId"] == stor[j]) {
            if (c.data![i].toJson()["isCheck"] == true) {
              total1 = total1 +
                  (c.data![i].toJson()["qty"] *
                      c.data![i].toJson()["newPrice"]);
            }
          }
        }
        storPrice.add(total1);
        total1 = 0;
      }
      print("===================stors price===================");
      print(storPrice);

      Map map3;

      for (var j = 0; j < stor.length; j++) {
        for (var i = 0; i < storPrice.length; i++) {
          for (var k = 0; k < nameStors.length; k++) {
            if (i == j && stor[j] == nameStors[k]["id"]) {
              map3 = {
                stor[i],
                storPrice[j],
                nameStors[k]["nameEn"],
                nameStors[k]["nameAr"]
              }.toList().asMap();
              print(map3);
              thirdMap.add(map3);

              break;
            }
          }
        }
      }

      print("===================thirdMap price===================");
      // print(thirdMap);
      final ids = thirdMap.map<int>((e) => e[0]).toSet();
      thirdMap.retainWhere((Map x) {
        return ids.remove(x[0]);
      });

      print('Without duplicates $thirdMap');
      controllerPro.SaveThrid(thirdMap);

      print("===========Details===============");
      List<Map<String, dynamic>> detailsStros = [];
      for (var j = 0; j < stor.length; j++) {
        print(stor[j]);
        for (var i = 0; i < c.data!.length; i++) {
          if (c.data![i].toJson()["isCheck"] == true) {
            if (c.data![i].toJson()["storeId"] == stor[j]) {
              //add element
              print("========Details========");
              print(c.data![i].toJson()["itemId"]);
              print(c.data![i].toJson()["itemSizes"]["itemSizeId"]);
              print(c.data![i].toJson()["itemColors"]["itemColorId"]);
              print(c.data![i].toJson()["qty"]);
              print(c.data![i].toJson()["newPrice"]);
              print((c.data![i].toJson()["newPrice"]) *
                  (c.data![i].toJson()["qty"]));

              detailsStros.add({
                "StoreId": c.data![i].toJson()["storeId"],
                "CouponCode": "",
                "Details": [
                  {
                    "ItemId": c.data![i].toJson()["itemId"],
                    "ItemSizeId": c.data![i].toJson()["itemSizes"]
                        ["itemSizeId"],
                    "ItemColorId": c.data![i].toJson()["itemColors"]
                        ["itemColorId"],
                    "Qty": c.data![i].toJson()["qty"],
                    "Total": (c.data![i].toJson()["newPrice"]) *
                        (c.data![i].toJson()["qty"])
                  }
                ]
              });
              print("=======================");
            }
          }
        }
      }

      print(detailsStros);
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      List<Map> newMap = [];

      List storIds = [];
      for (var i = 0; i < detailsStros.length; i++) {
        if (!storIds.contains(detailsStros[i]["StoreId"])) {
          print("object");
          storIds.add(detailsStros[i]["StoreId"]);
        }
      }
      print(storIds);

      for (var id = 0; id < storIds.length; id++) {
        int myId = storIds[id];
        var neww = [];
        dynamic newDetails = [];
        for (var j = 0; j < detailsStros.length; j++) {
          if (detailsStros[j]["StoreId"] == myId) {
            neww = neww + detailsStros[j]["Details"];
            print(neww);
            // newDetails.add(detailsStros[j]["Details"]);
          }
        }
        newMap.add({"StoreId": myId, "CouponCode": "", "Details": neww});
      }
      print("@@@@@@@@@@@@@@@@newMap@@@@@@@@@@@@@@");
      // print(storIds);
      print(newMap);
      controllerPro.SaveListPayment(newMap);
      List<Map> newCoupon = listCoupon.toSet().toList();
      print("@@@@@@@@@@@@@@@@newCoupon@@@@@@@@@@@@@@");
      print(newCoupon);
      print("@@@@@@@@@@@@@@@@newCoupon@@@@@@@@@@@@@@");
      print(newCoupon);
      for (var i = 0; i < newCoupon.length; i++) {
        for (var j = 0; j < newMap.length; j++) {
          if (newCoupon[i]["StoreId"] == newMap[j]["StoreId"]) {
            //  newMap.update(j, (value) => newCoupon[i]);
            var index = newCoupon.indexOf(newCoupon[i]);
            print("index");
            print(index);
            newMap[index]["CouponCode"] = newCoupon[i]["CouponCode"];
            print("newMap");
            print(newMap);
          }
        }
      }
    }
  } else {
    print("not response");
  }
}
