import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Text text1(text) {
  return Text(text,
      style: const TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
}

AppBar appbarmain(GlobalKey<ScaffoldState> scaffoldKey, context) {
  return AppBar(
    toolbarHeight: 70,
    title: SizedBox(
      width: 250.0,
      child: AnimatedTextKit(
        displayFullTextOnTap: false,
        repeatForever: true,
        animatedTexts: [
          FadeAnimatedText('ABOOD'),
          FadeAnimatedText('ABOOD'),
          FadeAnimatedText('For All New!!!'),
        ],
        onTap: () {
          print("Tap Event");
        },
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("notification");
          },
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("myLike");
          },
          icon: const Icon(
            Icons.favorite,
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("MyCart");
          },
          icon: const Icon(
            Icons.shopping_bag,
            color: Colors.white,
          )),
    ],
    leading: Row(children: [
      Expanded(
        child: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
      ),
      Expanded(
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("searchProductUser");
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
      )
    ]),
  );
}

AppBar appb(c) {
  return AppBar(
      backgroundColor: c,
      toolbarHeight: 70,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            )),
      ],
      leading: BackButton(
        color: Colors.black,
      ));
}
