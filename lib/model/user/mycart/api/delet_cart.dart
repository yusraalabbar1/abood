import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:abood/model/user/mycart/json/delet_cart_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

deleteCartApi(context, idCart) async {
  var request =
      http.Request('GET', Uri.parse(baseURL + '/api/cart/delete/$idCart'));

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  DeleteCart c = DeleteCart.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      diaSuccCart(context, c.message);
    } else {
      diaFaildCart(context, c.message);
    }
  } else {
    print("not response");
  }
}
