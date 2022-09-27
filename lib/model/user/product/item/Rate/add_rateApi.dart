import 'dart:convert';

import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/model/user/product/item/Rate/add_rateModel.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

addRate(context, idItem, idUser, rate, comment) async {
  print(idItem);
  print(idUser);
  print(rate);
  print(comment);
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/items/addItemRate'));
  request.body = json.encode({
    "UserId": int.parse(idUser.toString()),
    "ItemId": int.parse(idItem.toString()),
    "RateNumber": rate,
    "RateText": comment.toString()
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  AddRateModel c = AddRateModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print(c.message);
      // diaSuccRate(context, c);
    } else {
      // diaFaildRate(context, c);
      print(c.message);
    }
  } else {
    print("not response");
  }
}

Future diaSuccRate(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          dialogType: DialogType.SUCCES,
          btnOkOnPress: () {},
          body: Text(c.toString(),
              style: const TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

Future diaFaildRate(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          dialogType: DialogType.ERROR,
          headerAnimationLoop: true,
          btnOkOnPress: () {},
          body: Text(c.toString(),
              style: const TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}
