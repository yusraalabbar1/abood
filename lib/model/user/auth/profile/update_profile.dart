import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/auth/profile/updat_profile_model.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future editProfil(context, First, last) async {
  Homecontroller controller = Get.put(Homecontroller());

  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/user/updateProfile'));
  request.body = json
      .encode({"UserId": controller.id, "FirstName": First, "LastName": last});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  UpdateProfile c = UpdateProfile.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      // diaSuccCart(context, c);

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("firstName", controller.firstName);
      preferences.setString("lastName", controller.lastName);
    } else {
      // diaFaildCart(context, c);
    }
  } else {
    print(response.reasonPhrase);
  }
}
