import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/product/subCategory/subCatModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

SubCategories(sub) async {
  List<Map<dynamic, dynamic>> SubCat = [];
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  var request =
      http.Request('GET', Uri.parse(baseURL + '/api/section/sub/$sub'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SubCatMobel c = SubCatMobel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        SubCat.add(c.data![i].toJson());
      }

      // print("=================SubCategories(sub)====================");
      // print(SubCat);
      controllerPro.SaveSubCateg(SubCat);
    }
  } else {
    print("not response");
  }
  return res.body;
}
