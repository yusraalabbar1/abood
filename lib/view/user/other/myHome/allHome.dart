import 'package:abood/view/user/other/myHome/allStore.dart';
import 'package:abood/view/user/other/myHome/page_view_ads.dart';
import 'package:abood/view/user/other/myHome/page_view_banner.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AllHome extends StatefulWidget {
  const AllHome({super.key});

  @override
  State<AllHome> createState() => _AllHomeState();
}

class _AllHomeState extends State<AllHome> {
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 23.0,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed("offer");
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Go See Offers",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  AnimatedTextKit(
                    displayFullTextOnTap: false,
                    repeatForever: true,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        '30% OFF',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        '50% OFF',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        '20% OFF',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        '10% OFF',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  )
                ],
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height / 5,
            decoration: box(),
            child: CarouselBanner()),
        const SizedBox(
          height: 10,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height / 6,
            decoration: box(),
            child: Carousel()),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              text1("Stores"),
            ],
          ),
        ),
        Container(
            decoration: box(),
            height: MediaQuery.of(context).size.height / 5,
            child: allStore())
      ],
    );
  }

  BoxDecoration box() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
}
