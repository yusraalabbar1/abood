import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/stor/stor_by_userId_main_page/stor_by_userId_main_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future GetStorByUser() async {
  List<Map<dynamic, dynamic>> SubCat = [];
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  var request = http.Request('GET', Uri.parse(baseURL + '/api/store/users/8'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  StorMain c = StorMain.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        SubCat.add(c.data![i].toJson());
      }

      print("=================GetStorByUser(sub)====================");
      print(SubCat);
      controllerPro.SaveStorUserId(SubCat);
    }
  } else {
    print("not response");
  }
  return res.body;
}
