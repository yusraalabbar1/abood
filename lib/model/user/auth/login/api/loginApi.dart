import 'dart:convert';
import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/auth/login/json/loginModel.dart';
import 'package:abood/model/user/notification/notification_user.dart';
import 'package:abood/view/user/start/finish_register.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future loginApi(context, mobile, password) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  Homecontroller controller = Get.put(Homecontroller());
  /////////////////////////////////////////////
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(baseURL + '/api/user/login'));
  request.body = json.encode({"MobileNumber": mobile, "Password": password});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  LoginModel c = LoginModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      // Navigator.of(context).pushReplacementNamed("finishRegister");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => finishRegister()),
        (Route<dynamic> route) => false,
      );
      print(c.message);
      /////////////////////////////////////////////
      preferences.setInt("id", int.parse(c.data!.id.toString()));
      controller.Saveid(preferences.getInt('id'));
      /////////////////////////////////////////////
      preferences.setInt("userType", int.parse(c.data!.userType.toString()));
      controller.SaveuserType(preferences.getInt('userType'));
      /////////////////////////////////////////////
      preferences.setInt("countryId", int.parse(c.data!.countryId.toString()));
      controller.SavecountryId(preferences.getInt('countryId'));
      /////////////////////////////////////////////
      preferences.setString("mobileNumber", c.data!.mobileNumber.toString());
      controller.SavemobileNumber(preferences.getString('mobileNumber'));
      /////////////////////////////////////////////
      preferences.setString("password", c.data!.password.toString());
      controller.Savepassword(preferences.getString('password'));
      /////////////////////////////////////////////
      preferences.setString("firstName", c.data!.firstName.toString());
      controller.SavefirstName(preferences.getString('firstName'));
      /////////////////////////////////////////////
      preferences.setString("lastName", c.data!.lastName.toString());
      controller.SavelastName(preferences.getString('lastName'));
      /////////////////////////////////////////////
      preferences.setString("fullName", c.data!.fullName.toString());
      controller.SavefullName(preferences.getString('fullName'));
      /////////////////////////////////////////////
      preferences.setString("deviceId", c.data!.deviceId.toString());
      controller.SavedeviceId(preferences.getString('deviceId'));
      ////////////////////////////////////////////
      preferences.setBool("active", c.data!.active);
      controller.Saveactive(preferences.getBool('active'));
      /////////////////////////////////////////////
      preferences.setBool("isLogin", true);
      controller.SaveaisLogin(preferences.getBool('isLogin'));
      notificationApiUser();
      //diaSucc(context, c);
    } else {
      print(c.message);
      diaFaild(context, c);
    }
  } else {
    diaFaild(context, c);
  }
}

Future diaSucc(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          dialogType: DialogType.SUCCES,
          btnOkOnPress: () {},
          body: Text(c.message.toString().tr,
              style: const TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

Future diaFaildDelet(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          dialogType: DialogType.ERROR,
          headerAnimationLoop: true,
          btnOkOnPress: () {},
          body: Text(c,
              style: const TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

Future diaFaild(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          dialogType: DialogType.ERROR,
          headerAnimationLoop: true,
          btnOkOnPress: () {},
          body: Text(c.message.toString().tr,
              style: const TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}
