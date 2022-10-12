import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/admin/jsonModel/model_ad_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future addItem(context, itemName, itemDescription, price, extraText,
    List<Map<String, String>> sizes, List<Map<String, dynamic>> colors) async {
  ControllerAdmin controller = Get.put(ControllerAdmin());
  print("=========api==============");
  print(itemName);
  print(itemName.runtimeType);
  print(itemDescription);
  print(itemDescription.runtimeType);
  print(price);
  print(price.runtimeType);
  print(extraText);
  print(extraText.runtimeType);
  print(sizes);
  print(sizes.runtimeType);
  print(colors);
  print(colors.runtimeType);
  print("=========api==============");
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(baseURL + '/api/items/add'));
  request.body = json.encode({
    "StoreId": controller.idStore,
    "ItemName": itemName,
    "ItemDescription": itemDescription,
    "Price": double.parse(price.toString()),
    "ExtraText": extraText,
    "Sizes": sizes,
    "Colors": colors
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  AddItem c = AddItem.fromJson(jsonDecode(res.body));
  print(res.body);
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print(c.message);
      controller.SaveidProduct(c.data!.itemId);
      myDialog(
          context, "تمت العملية بنجاح يمكنك إضافة صورة للمنتج بالضغط على الزر");
    } else {
      diaFaild(context, c);
      print(c.message);
    }
  } else {
    mydiaFaild(context, "حصل خطأ أثناء ادخال المعلومات");
    print(c.message);
    print("nooooo");
  }
}
