import 'package:abood/controller/ControlUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:html/parser.dart';

class Protect extends StatefulWidget {
  const Protect({super.key});

  @override
  State<Protect> createState() => _ProtectState();
}

class _ProtectState extends State<Protect> {
  Homecontroller controller = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("protection"),
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          parse(controller.prot.toString()).body!.text,
          textAlign: TextAlign.center,
          style: TextStyle(height: 3, fontSize: 15),
        ),
      ),
    );
  }
}
