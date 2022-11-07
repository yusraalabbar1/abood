import 'dart:convert';

import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/auth/profile/updat_profile_model.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future changPassWord(context, newPass) async {
  Homecontroller controller = Get.put(Homecontroller());
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/user/changePass'));
  request.body = json.encode({"UserId": controller.id, "NewPassword": newPass});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  UpdateProfile c = UpdateProfile.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      diaSuccCart(context, c.message);
    } else {
      diaFaildCart(context, c.message);
    }
  } else {
    print(response.reasonPhrase);
  }
}

Future changPassWordForget(context, newPass) async {
  Homecontroller controller = Get.put(Homecontroller());
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/user/changePass'));
  request.body = json.encode({"UserId": controller.id, "NewPassword": newPass});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  UpdateProfile c = UpdateProfile.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      diaSuccForget(context, c.message);
    } else {
      diaFaildCart(context, c.message);
    }
  } else {
    print(response.reasonPhrase);
  }
}

Future diaSuccForget(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          dialogType: DialogType.SUCCES,
          btnOkOnPress: () {
            Navigator.of(context).pushReplacementNamed("login");
          },
          body: Text(c.toString().tr + "\t" + " Enter to Login".tr,
              style: const TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}
