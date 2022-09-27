import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/other/banner/bannerAdsModel.dart';
import 'package:abood/model/user/other/banner/bannerMainModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future BannerMainApi() async {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  List<String> bannerImage = [];
  List<Map<dynamic, dynamic>> bannerMap = [];
  var request = http.Request('GET', Uri.parse(baseURL + '/api/imageSlider'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  BannerMainModel c = BannerMainModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print("access banner");
      print(c.data!.length);
      for (var i = 0; i < c.data!.length; i++) {
        print(c.data![i].image);
        bannerImage.add(c.data![i].image.toString());
        bannerMap.add(c.data![i].toJson());
      }
      controllerPro.SaveMainBannerImage(bannerImage);
      controllerPro.SaveMainBannerMap(bannerMap);
      print(jsonDecode(res.body));
    } else {
      print("not access banner");
    }
  } else {
    print("error api banner");
  }
}
