import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/auth/signup/json/city_model.dart';
import 'package:abood/model/user/auth/signup/json/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future cityGen() async {
  Homecontroller controller = Get.put(Homecontroller());
  int id = int.parse(controller.countryId.toString());
  print("=========id Country=========");
  print(id);
  List<Map<dynamic, dynamic>> allCity = [];
  var request =
      http.Request('GET', Uri.parse(baseURL + '/api/lookup/City/$id'));

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  CityModel c = CityModel.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        allCity.add(c.data![i].toJson());
      }
      print(c.message);

      controller.SaveallCity(allCity);
    } else {
      print(c.message);
    }
  } else {
    print(c.message);
  }
}
