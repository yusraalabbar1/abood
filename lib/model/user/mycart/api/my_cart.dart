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

myCartApi() async {
  List<Map<dynamic, dynamic>> MyCart = [];
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  Homecontroller controller = Get.put(Homecontroller());
  int id = controller.id;
  dynamic total = 0.0;
  var request = http.Request('GET', Uri.parse(baseURL + '/api/cart/$id'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);

  MyCartModel c = MyCartModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        MyCart.add(c.data![i].toJson());
        print(c.data![i].toJson()["qty"]);
        if (c.data![i].toJson()["isCheck"] == true) {
          total = total +
              (c.data![i].toJson()["qty"] * c.data![i].toJson()["newPrice"]);
        }
      }
      print("========MyCart===============");
      // print(MyCart.length);
      print(MyCart);
      controllerPro.SaveMyCart(MyCart);
      controllerPro.SaveMyCartTotal(total);
    }
  } else {
    print("not response");
  }
}
