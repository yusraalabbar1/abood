import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:abood/model/user/mycart/json/addcart_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

addCartApi(context, itemId, itemSizeId, itemColorId) async {
  Homecontroller controllerPro = Get.put(Homecontroller());
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(baseURL + '/api/cart/add'));
  request.body = json.encode({
    "UserId": controllerPro.id,
    "ItemId": itemId,
    "ItemSizeId": itemSizeId,
    "ItemColorId": itemColorId
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  AddCart c = AddCart.fromJson(jsonDecode(res.body));

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
