import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/notification/number_noti_model.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future numberNotificationApi() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  Homecontroller controller = Get.put(Homecontroller());
  String? deviceId = preferences.getString("deviceId");
  var request = http.Request(
      'GET',
      Uri.parse(baseURL +
          '/api/notification/GetNumberOfNotification?deviceId=$deviceId'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  NumberNotification c = NumberNotification.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      controller.SaveNumberNotif(c.data);
    }
  } else {}
}
