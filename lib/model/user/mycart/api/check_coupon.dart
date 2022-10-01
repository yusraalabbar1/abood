import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:abood/model/user/mycart/json/check_copon_api.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

checkCoponApi(context, CouponCode, StoreId, Total) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/userRequest/checkCoupon'));
  request.body = json
      .encode({"CouponCode": CouponCode, "StoreId": StoreId, "Total": Total});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  CheckCoponModel c = CheckCoponModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      diaSuccCart(context, c.data);
    } else {
      diaFaildCart(context, c.message);
    }
  } else {
    print("not response");
  }
}
