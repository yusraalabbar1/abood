import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/user/auth/signup/json/GeneratNewOtp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future generatnewOtp(context, mobile) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/user/forgetPass'));
  request.body = json.encode({"MobileNumber": mobile});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  GeneratNewOtp c = GeneratNewOtp.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
    } else {
      mydiaFaild(context, c.message);
    }
    // print(await response.stream.bytesToString());
  } else {
    // print(response.reasonPhrase);
    mydiaFaild(context, c.message);
  }
}
