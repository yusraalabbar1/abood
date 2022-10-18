import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:abood/model/user/mycart/json/addcart_model.dart';
import 'package:abood/model/user/mycart/json/my_cart_model.dart';
import 'package:abood/model/user/mycart/json/object_payment.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;

paymentApi(context, name, mobile, cityId, area, street, flat, listMap) async {
  Homecontroller controller = Get.put(Homecontroller());
  print(name);
  print(mobile);
  print(cityId);
  print(area);
  print(street);
  print(flat);
  print(listMap);
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://friendly-proskuriakova.162-55-191-66.plesk.page/AboodAPI/api/userRequest/add'));
  request.body = json.encode({
    "UserId": controller.id,
    "FullName": name,
    "MobileNo": mobile,
    "CityId": cityId,
    "Area": area,
    "StreetName": street,
    "BuildingNo": flat,
    "Stores": listMap
  });
  print(request.body);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);

  MyPymentModel c = MyPymentModel.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      diaSuccCart(context, "Success Payment");
    } else {
      diaFaildCart(context, "Error Payment");
    }
  } else {
    diaFaildCart(context, "Error");
  }
}
