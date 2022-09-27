import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/user/auth/signup/json/verify_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future verifyOtp(context, otp) async {
  print("======================");

  Homecontroller controller = Get.put(Homecontroller());

  SharedPreferences preferences = await SharedPreferences.getInstance();
  print(controller.idReg);
  print(otp);
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/user/verifyOtp'));
  request.body =
      json.encode({"UserId": int.parse(controller.idReg), "Otp": otp});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  VerifyModel c = VerifyModel.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      // Navigator.of(context).pushNamed("homePage");
      Navigator.of(context).pushReplacementNamed("finishRegister");
      print(c.message);
      /////////////////////////////////////////////
      preferences.setInt("id", int.parse(controller.idReg.toString()));
      controller.Saveid(preferences.getInt('id'));
      /////////////////////////////////////////////
      preferences.setInt("userType", 1);
      controller.SaveuserType(preferences.getInt('userType'));
      /////////////////////////////////////////////
      preferences.setInt(
          "countryId", int.parse(controller.saveaCountryId.toString()));
      controller.SavecountryId(preferences.getInt('countryId'));
      /////////////////////////////////////////////
      preferences.setString("mobileNumber", controller.mobileNumber);
      controller.SavemobileNumber(preferences.getString('mobileNumber'));
      /////////////////////////////////////////////
      preferences.setString("password", controller.password);
      controller.Savepassword(preferences.getString('password'));
      /////////////////////////////////////////////
      preferences.setString("firstName", controller.firstName);
      controller.SavefirstName(preferences.getString('firstName'));
      /////////////////////////////////////////////
      preferences.setString("lastName", controller.lastName);
      controller.SavelastName(preferences.getString('lastName'));
      /////////////////////////////////////////////
      preferences.setString(
          "fullName", controller.firstName + controller.lastName);
      controller.SavefullName(preferences.getString('fullName'));
      /////////////////////////////////////////////
      preferences.setString("deviceId", controller.identif);
      controller.SavedeviceId(preferences.getString('deviceId'));
      /////////////////////////////////////////////
      preferences.setBool("isLogin", true);
      controller.SaveaisLogin(preferences.getBool('isLogin'));
    } else {
      mydiaFaild(context, c.message);
    }
    // print(await response.stream.bytesToString());
  } else {
    // print(response.reasonPhrase);
    mydiaFaild(context, c.message);
  }
}
