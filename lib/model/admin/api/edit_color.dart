import 'dart:convert';

import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/admin/jsonModel/onlyItemDelete.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

edit_color(context, id, qty, value, idd) async {
  print(id);
  print(qty);
  print(value);
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://friendly-proskuriakova.162-55-191-66.plesk.page/AboodAPI/api/items/update/color'));
  request.body = json.encode({
    "Id": int.parse(id.toString()),
    "Qty": int.parse(qty.toString()),
    "Value": value
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    // await myDialog2(context, c.message);
    // updateStoreItems(idd);
  } else {
    print(response.reasonPhrase);
  }
}

edit_size(context, id, ar, en, idStore) async {
  print(id);
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://friendly-proskuriakova.162-55-191-66.plesk.page/AboodAPI/api/items/update/size'));
  request.body = json.encode({"Id": id, "DescAr": ar, "DescEn": en});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());

    // print("=========api==============");
    // print(idStore);
    // updateStoreItems(idStore);
  } else {
    // print(response.reasonPhrase);
  }
}

updateStoreItems(id) async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://friendly-proskuriakova.162-55-191-66.plesk.page/AboodAPI/api/store/$id/items/pageIndex/0'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
