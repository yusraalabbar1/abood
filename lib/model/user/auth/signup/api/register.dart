import 'dart:convert';
import 'dart:io';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/user/auth/signup/json/register_model.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future register(context, mobile, password, email, first, last, idcount) async {
  var identifier;
  final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

  Homecontroller controller = Get.put(Homecontroller());
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      identifier = build.androidId; //UUID for Android

      print("*********androidId********");
      print(identifier);
      print("*********identifier********");
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      identifier = data.identifierForVendor; //UUID for iOS

      print("*********isIOS********");
      print(identifier);
      print("*********identifier********");
    }
  } on PlatformException {
    print('Failed to get platform version');
  }
  controller.ident(identifier);
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/user/registration'));
  request.body = json.encode({
    "UserType": 1,
    "CountryId": idcount,
    "Email": email,
    "MobileNumber": mobile,
    "Password": password,
    "FirstName": first,
    "LastName": last,
    "DeviceId": identifier,
    "OTPCode": ""
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  RigesterModel c = RigesterModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      controller.SaveIdRegister(c.data);
      Navigator.of(context).pushNamed("otpSignup");
    } else {
      mydiaFaild(context, c.message);
    }
  } else {
    mydiaFaild(context, c.message);
  }
}
