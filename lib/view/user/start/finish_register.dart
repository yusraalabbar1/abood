import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class finishRegister extends StatefulWidget {
  const finishRegister({super.key});

  @override
  State<finishRegister> createState() => _finishRegisterState();
}

class _finishRegisterState extends State<finishRegister>
    with AutomaticKeepAliveClientMixin {
  getInfo() async {}

  Timer? searchOnStoppedTyping;
  _onChangeHandler() {
    const duration = Duration(
        milliseconds:
            3000); // set the duration that you want call pop() after that.
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping?.cancel(); // clear timer
    }
    searchOnStoppedTyping = new Timer(duration, () => navigateHome());
  }

  navigateHome() {
    Navigator.of(context).pushReplacementNamed("lang");
  }

  @override
  void initState() {
    getInfo();
    _onChangeHandler();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
              child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 40.0,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('ABOOD'),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "جميع الحقوق محفوظة لدى التطبيق ",
                style: TextStyle(
                    fontSize: 13, color: Colors.white, fontFamily: 'majallab'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
