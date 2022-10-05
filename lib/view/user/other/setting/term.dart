import 'package:abood/controller/ControlUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class Term extends StatefulWidget {
  const Term({super.key});

  @override
  State<Term> createState() => _TermState();
}

class _TermState extends State<Term> {
  Homecontroller controller = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Term"),
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          parse(controller.term.toString()).body!.text,
          textAlign: TextAlign.center,
          style: TextStyle(height: 3, fontSize: 15),
        ),
      ),
    );
  }
}
