import 'dart:convert';

import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/model/admin/jsonModel/GetItemStoreModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

getItemDetailStore(id) async {
  ControllerAdmin controllerPro = Get.put(ControllerAdmin());

  var request = http.Request(
      'GET',
      Uri.parse(
          'https://friendly-proskuriakova.162-55-191-66.plesk.page/AboodAPI/api/items/$id/details'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  GetItemStoreModel c = GetItemStoreModel.fromJson(jsonDecode(res.body));
  print(res.body);

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print(c.message);
      print(c.data!.toJson());
      controllerPro.SaveItemsByIdStore(c.data!.toJson());
    } else {
      print(c.message);
    }
  } else {
    print(c.message);
    print("nooooo");
  }
}
