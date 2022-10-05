import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/setting/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future settingAll() async {
  Homecontroller controller = Get.put(Homecontroller());
  List<Map<dynamic, dynamic>> MySetting = [];
  var request = http.Request('GET', Uri.parse(baseURL + '/api/setting'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        if (c.data![i].isMedia == true) {
          MySetting.add(c.data![i].toJson());
        }
      }
    }
    controller.SaveAllSetting(MySetting);
  }
}

Future expiry() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request('GET',
      Uri.parse(baseURL + '/api/setting?settingName=setting.otp.expiry.time'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {}
  }
}

Future term() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request(
      'GET', Uri.parse(baseURL + '/api/setting?settingName=setting.terms'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      controller.SaveTerm(c.data![0].value);
    }
  }
}

Future aboutus() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request(
      'GET', Uri.parse(baseURL + '/api/setting?settingName=setting.aboutus'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      controller.SaveAbout(c.data![0].value);
    }
  }
}

Future facebook() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request(
      'GET', Uri.parse(baseURL + '/api/setting?settingName=setting.facebook'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      controller.SaveFaceBook(c.data![0].value);
    }
  }
}

Future otplength() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request('GET',
      Uri.parse(baseURL + '/api/setting?settingName=setting.otp.length'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {}
  }
}

Future whatsup() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request(
      'GET', Uri.parse(baseURL + '/api/setting?settingName=setting.whatsup'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      controller.SaveWhats(c.data![0].value);
    }
  }
}

Future privacy() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request(
      'GET', Uri.parse(baseURL + '/api/setting?settingName=setting.privacy'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      controller.SavePriv(c.data![0].value);
    }
  }
}

Future Website() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request(
      'GET', Uri.parse(baseURL + '/api/setting?settingName=setting.Website'));
  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      controller.SaveSite(c.data![0].value);
    }
  }
}

protection() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request(
      'GET',
      Uri.parse(
          baseURL + '/api/setting?settingName=setting.consumer.protection'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      controller.SaveProt(c.data![0].value);
    }
  }
}

deliverypalestine() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request(
      'GET',
      Uri.parse(
          baseURL + '/api/setting?settingName=setting.delivery.palestine'));
  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {}
  }
}

deliveryjordan() async {
  Homecontroller controller = Get.put(Homecontroller());

  var request = http.Request('GET',
      Uri.parse(baseURL + '/api/setting?settingName=setting.delivery.jordan'));
  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {}
  }
}
