import 'dart:convert';
import 'dart:io';
import 'package:abood/controller/controlAdmin.dart';
import 'package:http_parser/http_parser.dart';
import 'package:async/async.dart';
import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/admin/jsonModel/add_image_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future addImageApi(context, id, image) async {
  print(image);
  print(id);
  ControllerAdmin controller = Get.put(ControllerAdmin());

  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://eloquent-chatterjee.162-55-191-66.plesk.page/AboodBackOffice/api/items/add/image'));
  request.fields.addAll({'ItemId': controller.idStore.toString()});
  request.files.add(await http.MultipartFile.fromPath('img', image.path));

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  AddImagModel c = AddImagModel.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    if (c.isSuccess == true) {
      print(c.message);
      myDialog(context, "تم الارسال");
    } else {
      diaFaild(context, c);
      print(c.message);
    }
  } else {
    diaFaild(context, c);
    print(c.message);
    print("nooooo");
  }
}

Upload(context, File? imageFile, fileName, id) async {
  var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile!.openRead()));
  var length = await imageFile.length();

  var uri = Uri.parse(
      'https://eloquent-chatterjee.162-55-191-66.plesk.page/AboodBackOffice/api/items/add/image');

  var request = http.MultipartRequest("POST", uri);
  var multipartFile = http.MultipartFile('img', stream, length,
      filename: fileName, contentType: MediaType('image', 'jpg'));
  //contentType: new MediaType('image', 'png'));
  request.fields.addAll({'ItemId': id.toString()});
  request.files.add(multipartFile);
  var response = await request.send();
  var res = await http.Response.fromStream(response);
  AddImagModel c = AddImagModel.fromJson(jsonDecode(res.body));
  print(response.statusCode);
  // response.stream.transform(utf8.decoder).listen((value) async {
  if (response.statusCode == 200) {
    print("ggggggggggggg");
    if (c.isSuccess == true) {
      print(c.message);
      myDialog(context, "تم الارسال");
    } else {
      diaFaild(context, c);
      print(c.message);
    }
  }

  // print(value);
  //});
}
