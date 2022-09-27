import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/admin/jsonModel/SearchModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Searchproduct(name, t) async {
  List<Map<dynamic, dynamic>> SearchCat = [];
  List<DatumSearch> v = [];

  ControllerProduct controllerPro = Get.put(ControllerProduct());
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse(baseURL + '/api/items/searchItems'));
  request.body = json.encode({"data": name});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  SearchModel c = SearchModel.fromJson(jsonDecode(res.body));
  // final result = SearchModelwelcomeFromJson(res.body);
  final result = SearchModelFromJson(res.body);
  v = result.data!;
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      for (var i = 0; i < c.data!.length; i++) {
        SearchCat.add(c.data![i].toJson());
      }

      print("=================SearchCatCat====================");
      print(SearchCat);

      controllerPro.SaveSearchCateg(v);
    }
  } else {
    print("not response");
  }
}
