import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/auth/signup/json/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future countryGen() async {
  Homecontroller controllerPro = Get.put(Homecontroller());
  List<Map<dynamic, dynamic>> allCountry = [];
  var request = http.Request('GET', Uri.parse(baseURL + '/api/lookup/Country'));

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  CountryModel c = CountryModel.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        allCountry.add(c.data![i].toJson());
      }
      print(c.message);

      controllerPro.SaveallCountry(allCountry);
    } else {
      print(c.message);
    }
  } else {
    print(c.message);
  }
}
