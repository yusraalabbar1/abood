import 'package:abood/constant/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future GetStoreBySection() async {
  var request = http.Request('GET',
      Uri.parse(baseURL + '/api/store/sectionId/0/subsectionId/0/pageIndex/0'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
