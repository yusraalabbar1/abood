import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/view/user/auth/start_account.dart';
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
    toolbarHeight: 60, titleSpacing: 0.0, automaticallyImplyLeading: false,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
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
            )),
        Expanded(
          child: Center(
            child: AnimatedTextKit(
              displayFullTextOnTap: false,
              repeatForever: true,
              animatedTexts: [
                FadeAnimatedText('CLICK & PICK',
                    textStyle: TextStyle(fontSize: 17)),
                FadeAnimatedText('CLICK & PICK',
                    textStyle: TextStyle(fontSize: 17)),
                // FadeAnimatedText('For All New!!!'),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        )
      ],
    ),
    // automaticallyImplyLeading: false,

    actions: [
      GetBuilder<Homecontroller>(builder: (controller) {
        return Badge(
          position: BadgePosition.topEnd(top: 10, end: 8),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          badgeColor: Colors.red,
          borderRadius: BorderRadius.circular(8),
          badgeContent: controller.numNotif != 0 && controller.numNotif != null
              ? Text(controller.numNotif.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 7))
              : Text(""),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("notification");
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
        );
      }),
      GetBuilder<ControllerProduct>(builder: (controllerPro) {
        return guest != true
            ? Badge(
                position: BadgePosition.topEnd(top: 10, end: 8),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeColor: Color.fromARGB(255, 245, 71, 129),
                borderRadius: BorderRadius.circular(8),
                badgeContent: controllerPro.myFavorite.length != 0
                    ? Text(controllerPro.myFavorite.length.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 7))
                    : Text(""),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("myLike");
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    )),
              )
            : IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("myLike");
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ));
      }),
      GetBuilder<ControllerProduct>(builder: (controllerPro) {
        return guest != true
            ? Badge(
                position: BadgePosition.topEnd(top: 10, end: 8),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeColor: Color.fromARGB(255, 122, 187, 239),
                borderRadius: BorderRadius.circular(8),
                badgeContent: controllerPro.myCart.length != 0
                    ? Text(controllerPro.myCart.length.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 7))
                    : Text(""),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("MyCart");
                    },
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    )),
              )
            : IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("MyCart");
                },
                icon: const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                ));
      }),
    ],
    // leading: Row(children: [
    //   Expanded(
    //     child: IconButton(
    //         onPressed: () {
    //           scaffoldKey.currentState!.openDrawer();
    //         },
    //         icon: const Icon(
    //           Icons.menu,
    //           color: Colors.white,
    //         )),
    //   ),
    //   Expanded(
    //     child: IconButton(
    //         onPressed: () {
    //           Navigator.of(context).pushNamed("searchProductUser");
    //         },
    //         icon: const Icon(
    //           Icons.search,
    //           color: Colors.white,
    //         )),
    //   ),
    // ]),
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
