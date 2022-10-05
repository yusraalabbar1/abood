import 'package:abood/controller/ControlUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:html/parser.dart';

class Privecy extends StatefulWidget {
  const Privecy({super.key});

  @override
  State<Privecy> createState() => _PrivecyState();
}

class _PrivecyState extends State<Privecy> {
  Homecontroller controller = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy policy"),
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          parse(controller.privec.toString()).body!.text,
          textAlign: TextAlign.center,
          style: TextStyle(height: 3, fontSize: 15),
        ),
      ),
    );
  }
}
