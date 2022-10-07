import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lang extends StatefulWidget {
  const lang({super.key});

  @override
  State<lang> createState() => _langState();
}

class _langState extends State<lang> {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  Text text2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  Homecontroller controller = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
                height: 250,
                color: Colors.black,
                child: Center(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText('ABOOD Language'),
                        FadeAnimatedText('ARABIC!!'),
                        FadeAnimatedText('ENGLISH!!!'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                )),
          ),
          Center(child: text2("لغة التطبيق")),
          Center(child: text2(" Application Language")),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ButtonRegister1(Colors.black, Colors.white, "عربي ", 1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ButtonRegister1(Colors.white, Colors.black, "English", 2),
          )
        ],
      ),
    );
  }

  Widget ButtonRegister1(c2, c1, text, n) {
    return Container(
      width: 300,
      height: 53,
      child: RaisedButton(
        onPressed: () async {
          print('Button Clicked.');
          SharedPreferences preferences = await SharedPreferences.getInstance();
          if (n == 1) {
            preferences.setString("lang", "ar");

            controllerPro.SaveLang('ar');
            Get.updateLocale(Locale('ar'));
            Navigator.of(context).pushNamed("startAccount");
          } else {
            preferences.setString("lang", "en");
            // controller.SaveLang("en");
            controllerPro.SaveLang('en');
            Get.updateLocale(Locale('en'));
            Navigator.of(context).pushNamed("startAccount");
          }
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Text(
          text,
          style: TextStyle(
              color: c1,
              fontSize: 26,
              fontFamily: 'majallab',
              fontWeight: FontWeight.bold),
        ),
        textColor: c1,
        splashColor: Colors.white,
        color: c2,
      ),
    );
  }
}
