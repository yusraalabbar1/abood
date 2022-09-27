import 'dart:convert';

import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/product/item/Rate/add_rateModel.dart';
import 'package:abood/model/user/product/item/Rate/get_rateModel.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

addRate(context, idItem, idUser, rate, comment) async {
  List<Map<dynamic, dynamic>> myRate = [];
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  var request = http.Request('GET', Uri.parse(baseURL + '/api/items/66/rate'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  ModelRate c = ModelRate.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      // diaSuccRate(context, c);
      for (var i = 0; i < c.data!.length; i++) {
        myRate.add(c.data![i].toJson());
      }
      print("========favorit===============");
      print(myRate);
      controllerPro.SaveMyRate(myRate);
    } else {
      // diaFaildRate(context, c);
    }
  } else {
    print("not response");
  }
}
