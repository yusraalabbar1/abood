import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/auth/forget_pass/json/forget_model.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future forgetApi(context, mobile) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  Homecontroller controller = Get.put(Homecontroller());
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/user/forgetPass'));
  request.body = json.encode({"MobileNumber": mobile.toString()});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  ForgetModel c = ForgetModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      // diaSuccCart(context, c.message);
      controller.SaveIdRegister(c.data!.userId);
      Navigator.of(context).pushNamed("OtpForget");
    } else {
      diaFaildCart(context, c.message);
    }
    // print(await response.stream.bytesToString());
  } else {
    // print(response.reasonPhrase);
    diaFaildCart(context, c.message);
  }
}
