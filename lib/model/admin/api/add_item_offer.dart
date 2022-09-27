import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/admin/jsonModel/onlyItemDelete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future addItemRate(context, id, price, text) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/items/edit/offer'));
  request.body = json.encode({
    "ItemId": int.parse(id.toString()),
    "NewPrice": int.parse(price.toString()),
    "OfferText": text.toString()
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  deletOnlyItem c = deletOnlyItem.fromJson(jsonDecode(res.body));
  print(res.body);
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print(c.message);
      myDialog3(context, "تمت العملية بنجاح ");
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
