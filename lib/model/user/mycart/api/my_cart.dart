import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/api/update_check.dart';
import 'package:abood/model/user/mycart/json/my_cart_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;

// var thirdMap;
List<Map<dynamic, dynamic>> thirdMap = [];
myCartApi() async {
  List<Map<dynamic, dynamic>> MyCart = [];
  List stor = [];
  List storPrice = [];
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  Homecontroller controller = Get.put(Homecontroller());
  int id = controller.id;
  double total = 0.0;
  double total1 = 0.0;
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
          if (i == j) {
            map3 = {stor[i], storPrice[j]}.toList().asMap();
            print(map3);
            thirdMap.add(map3);
            // thirdMap = [...thirdMap, map3];
            break;
          }
        }
      }
      print("===================thirdMap price===================");
      print(thirdMap);
      final ids = thirdMap.map<int>((e) => e[0]).toSet();
      thirdMap.retainWhere((Map x) {
        return ids.remove(x[0]);
      });

      print('Without duplicates $thirdMap');
    }
  } else {
    print("not response");
  }
}
