import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mylike/json/mylike_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

myLikeApi(iduser) async {
  //ControllerProduct

  List<Map<dynamic, dynamic>> MyFavorite = [];
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  var request =
      http.Request('GET', Uri.parse(baseURL + '/api/wishList/$iduser'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);

  LikeModel c = LikeModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        MyFavorite.add(c.data![i].toJson());
      }
      print("========favorit===============");
      print(MyFavorite);
      controllerPro.SaveMyFavorite(MyFavorite);
    }
  } else {
    print("not response");
  }
}
