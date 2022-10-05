import 'package:abood/controller/ControlUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:html/parser.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  Homecontroller controller = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About Us"),
          toolbarHeight: 60,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            parse(controller.about.toString()).body!.text,
            textAlign: TextAlign.center,
            style: TextStyle(height: 3, fontSize: 15),
          ),
        ));
  }
}
