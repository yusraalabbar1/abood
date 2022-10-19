import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/stor/items/get_items_id_model.dart';
import 'package:abood/model/user/stor/items/items_stor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future getItemsIdApi(id) async {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  Homecontroller controlleR = Get.put(Homecontroller());
  int idUser;
  if (controlleR.id != null) {
    idUser = controlleR.id;
  } else {
    idUser = 0;
  }

  print(idUser);
  print(id);
  var request =
      http.Request('GET', Uri.parse(baseURL + '/api/items/$id/user/$idUser'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  GetItemsIdModel c = GetItemsIdModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print("=================getItemsIdApi====================");
      print(c.data!.toJson());
      controllerPro.SaveItemsById(c.data!.toJson());
    }
  } else {
    print("not response");
  }
  return jsonDecode(res.body);
}

Future getItemsIdApiStore(id) async {
  ControllerAdmin controllerAdmin = Get.put(ControllerAdmin());
  Homecontroller controlleR = Get.put(Homecontroller());
  int idUser;
  if (controlleR.id != null) {
    idUser = controlleR.id;
  } else {
    idUser = 0;
  }

  print(idUser);
  print(id);
  var request = http.Request(
      'GET', Uri.parse(baseURL + '/api/store/items/users/$idUser/pageIndex/0'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  ItemsStoreModel c = ItemsStoreModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print("=================getItemsIdApi====================");
      print(c.data);
      // controllerAdmin.SaveItemsById(c.data);
    }
  } else {
    print("not response");
  }
  return jsonDecode(res.body);
}
