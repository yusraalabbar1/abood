import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/api/my_cart.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:abood/model/user/mycart/json/check_copon_api.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

checkCoponApi(context, CouponCode, StoreId, Total) async {
  print(CouponCode.runtimeType);
  print(StoreId.runtimeType);
  print(Total.runtimeType);

  double t = 0.0;

  ControllerProduct controllerPro = Get.put(ControllerProduct());
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/userRequest/checkCoupon'));
  request.body = json.encode({
    "CouponCode": CouponCode,
    "StoreId": int.parse(StoreId.toString()),
    "Total": Total
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  CheckCoponModel c = CheckCoponModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      diaSuccCart(
          context,
          ("total : " +
                  c.data!.total.toString() +
                  "\t" +
                  "discount : " +
                  c.data!.discount.toString() +
                  "\t" +
                  "netTotal : " +
                  c.data!.netTotal.toString())
              .toString());
      //edit total
      print("========edit total===========");
      for (var i = 0; i < controllerPro.thirdMap.length; i++) {
        if (controllerPro.thirdMap[i][0] == int.parse(StoreId.toString())) {
          print(controllerPro.thirdMap[i][1]);
          controllerPro.thirdMap[i] = {0: StoreId, 1: c.data!.netTotal};
        }
      }
      print(controllerPro.thirdMap);
      for (var i = 0; i < controllerPro.thirdMap.length; i++) {
        t = t + controllerPro.thirdMap[i][1];
        controllerPro.SaveMyCartTotal(t);
      }
      controllerPro.SaveThrid(controllerPro.thirdMap);
      await myCartApi();
    } else {
      diaFaildCart(context, c.message);
    }
  } else {
    print("not response");
  }
  return c.data!.netTotal.toString();
}
