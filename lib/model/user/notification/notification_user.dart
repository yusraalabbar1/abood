import 'dart:convert';
import 'dart:io';

import 'package:abood/constant/urls.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:device_info/device_info.dart';

Future notificationApiUser() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? deviceId = preferences.getString("deviceId");
  var request = http.Request(
      'GET',
      Uri.parse(
          baseURL + '/api/notification/GetNotification?deviceId=$deviceId'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

Future notificationApiUserUpdate() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? deviceId = preferences.getString("deviceId");
  var request = http.Request(
      'GET',
      Uri.parse(
          baseURL + '/api/notification/UpdateNotification?deviceId=$deviceId'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
