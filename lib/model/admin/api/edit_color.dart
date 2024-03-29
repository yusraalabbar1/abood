import 'dart:convert';

import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/admin/jsonModel/onlyItemDelete.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

edit_color(context, id, qty, value, idd) async {
  if (Value != "" || Value != null) {
    print(id);
    print(qty);
    print(value);
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse(baseURL + '/api/items/update/color'));
    request.body = json.encode({
      "Id": int.parse(id.toString()),
      "Qty": int.parse(qty.toString()),
      "Value": value
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res = await http.Response.fromStream(response);
    deletOnlyItem c = deletOnlyItem.fromJson(jsonDecode(res.body));
    print(res.body);
    if (response.statusCode == 200) {
      if (c.isSuccess == true) {
        print(c.message);

        AwesomeDialog(
                context: context,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                dialogType: DialogType.SUCCES,
                btnOkOnPress: () {},
                body: Center(
                  child: Text(c.message.toString().tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Almarai',
                          fontWeight: FontWeight.bold)),
                ),
                dialogBackgroundColor: MyColors.color3,
                btnOkColor: Colors.black)
            .show();
      } else {
        diaFaild(context, c);
        print(c.message);
      }
    } else {
      mydiaFaild(context, "حصل خطأ أثناء ادخال المعلومات");
      print(c.message);
      print("nooooo");
    }
  } else {
    mydiaFaild(context, "pick color");
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
  var res = await http.Response.fromStream(response);
  deletOnlyItem c = deletOnlyItem.fromJson(jsonDecode(res.body));
  print(res.body);
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print(c.message);
      // myDialog3(context, "تمت العملية بنجاح ");
      AwesomeDialog(
              context: context,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              dialogType: DialogType.SUCCES,
              btnOkOnPress: () {},
              body: Center(
                child: Text(c.message.toString().tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.bold)),
              ),
              dialogBackgroundColor: MyColors.color3,
              btnOkColor: Colors.black)
          .show();
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
