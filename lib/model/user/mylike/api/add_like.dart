import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

addLike(idItem, idUser) async {
  print(idItem);
  print(idUser);
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(baseURL + '/api/wishList/add'));
  request.body = json.encode({"ItemId": idItem, "UserId": idUser});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
