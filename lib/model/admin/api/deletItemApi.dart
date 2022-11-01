import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/admin/jsonModel/onlyItemDelete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future deletItemApi(context, id) async {
  var request =
      http.Request('GET', Uri.parse(baseURL + '/api/items/delete/$id'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  deletOnlyItem c = deletOnlyItem.fromJson(jsonDecode(res.body));
  print(res.body);
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print(c.message);
      myDialog2(context, "تمت العملية بنجاح ");
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

Future deletItemSizeApi(context, id) async {
  var request =
      http.Request('GET', Uri.parse(baseURL + '/api/items/delete/size/$id'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  deletOnlyItem c = deletOnlyItem.fromJson(jsonDecode(res.body));
  print(res.body);
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print(c.message);
      myDialog2(context, "تمت العملية بنجاح ");
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

Future deletItemColorApi(context, id) async {
  var request =
      http.Request('GET', Uri.parse(baseURL + '/api/items/delete/color/$id'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  deletOnlyItem c = deletOnlyItem.fromJson(jsonDecode(res.body));
  print(res.body);
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print(c.message);
      myDialog2(context, "تمت العملية بنجاح ");
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

Future deletItemImageApi(context, id) async {
  var request =
      http.Request('GET', Uri.parse(baseURL + '/api/items/delete/image/$id'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  deletOnlyItem c = deletOnlyItem.fromJson(jsonDecode(res.body));
  print(res.body);
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print(c.message);
      myDialog2(context, "تمت العملية بنجاح ");
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
