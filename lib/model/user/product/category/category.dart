import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/product/category/categoryModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

AllCategories() async {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  List<Map<dynamic, dynamic>> allCat = [];
  List<Map<dynamic, dynamic>> all = [
    {
      "id": 0,
      "descEn": "All",
      "descAr": "الكل",
      "image":
          "https://myexpress.aqdeveloper.tech/core/public/storage/categories/8/QAkzOJ8dcGQaxaHEPxMOAaqkvjdv4m14MjjCq3rL.jpg"
    }
  ];
  var request = http.Request('GET', Uri.parse(baseURL + '/api/section'));

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  CategoryModel c = CategoryModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        allCat.add(c.data![i].toJson());
      }

      all.addAll(allCat);
      print("=================allCat====================");
      print(all);
      controllerPro.SaveAllCateg(all);
      controllerPro.SaveAllCategWithoutall(allCat);
    }
  } else {
    print("not response");
  }
}
