import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/product/sub2Cat/sub2CatModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Sub2Categories(id) async {
  List<Map<dynamic, dynamic>> SubCat = [];
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  var request =
      http.Request('GET', Uri.parse(baseURL + '/api/store/$id/items'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  Sub2catModel c = Sub2catModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        SubCat.add(c.data![i].toJson());
      }

      print("=================SubCategories(sub)====================");
      print(SubCat);
      controllerPro.SaveSub2Categ(SubCat);
    }
  } else {
    print("not response");
  }
  return res.body;
}
