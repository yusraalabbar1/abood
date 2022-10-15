import 'package:abood/controller/controlProduct.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Text text1(text) {
  return Text(text,
      style: const TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
}

AppBar appbarmain(GlobalKey<ScaffoldState> scaffoldKey, context) {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  return AppBar(
    toolbarHeight: 70,
    title: AnimatedTextKit(
      displayFullTextOnTap: false,
      repeatForever: true,
      animatedTexts: [
        FadeAnimatedText('ABOOD'),
        FadeAnimatedText('ABOOD'),
        // FadeAnimatedText('For All New!!!'),
      ],
      onTap: () {
        print("Tap Event");
      },
    ),
    actions: [
      Badge(
        position: BadgePosition.topEnd(top: 10, end: 8),
        animationDuration: Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeColor: Colors.red,
        borderRadius: BorderRadius.circular(8),
        badgeContent:
            const Text('3', style: TextStyle(color: Colors.white, fontSize: 7)),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("notification");
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            )),
      ),
      Badge(
        position: BadgePosition.topEnd(top: 10, end: 8),
        animationDuration: Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeColor: Color.fromARGB(255, 245, 71, 129),
        borderRadius: BorderRadius.circular(8),
        badgeContent: Text(controllerPro.myFavorite.length.toString(),
            style: TextStyle(color: Colors.white, fontSize: 7)),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("myLike");
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            )),
      ),
      Badge(
        position: BadgePosition.topEnd(top: 10, end: 8),
        animationDuration: Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeColor: Color.fromARGB(255, 122, 187, 239),
        borderRadius: BorderRadius.circular(8),
        badgeContent: Text(controllerPro.myCart.length.toString(),
            style: TextStyle(color: Colors.white, fontSize: 7)),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("MyCart");
            },
            icon: const Icon(
              Icons.shopping_bag,
              color: Colors.white,
            )),
      ),
    ],
    leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("searchProductUser");
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
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
