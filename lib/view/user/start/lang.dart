import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lang extends StatefulWidget {
  const lang({super.key});

  @override
  State<lang> createState() => _langState();
}

class _langState extends State<lang> {
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
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 300,
              color: Colors.black,
              child: Center(child: text1("ABOOD")),
            ),
          ),
          Center(child: text2("لغة التطبيق")),
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
            if (preferences.getInt("userType") == 1) {
              Navigator.of(context).pushReplacementNamed("homePage");
            } else if (preferences.getInt("userType") == 2) {
              Navigator.of(context).pushReplacementNamed("MainScreenStor");
            } else {
              print("no thing");
            }
          } else {
            if (preferences.getInt("userType") == 1) {
              Navigator.of(context).pushReplacementNamed("homePage");
            } else if (preferences.getInt("userType") == 2) {
              Navigator.of(context).pushReplacementNamed("MainScreenStor");
            } else {
              print("no thing");
            }
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
