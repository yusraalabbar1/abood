import 'package:abood/constant/urls.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

deleteLike(idUser, idItem) async {
  print(idItem);
  print(idUser);
  var request = http.Request(
      'GET',
      Uri.parse(
          baseURL + '/api/wishList/delete/userId/$idUser/itemId/$idItem'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
