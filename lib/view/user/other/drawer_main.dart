import 'package:abood/constant/colors.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/widget/change_lang.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
import 'package:abood/view/user/other/widget/dialogs_drawer.dart';
import 'package:abood/view/user/other/widget/showLoadingDelet.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Text text1(text) {
  return Text(text,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'majallab'));
}

Text text2(text) {
  return Text(text,
      style: const TextStyle(
          color: Colors.white, fontSize: 20, fontFamily: 'majallab'));
}

Text text3(text) {
  return Text(text,
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontFamily: 'majallab'));
}

const colorizeColors = [
  Colors.white,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: 'majallab',
  fontWeight: FontWeight.bold,
);
Drawer drawermain(context) {
  Homecontroller controller = Get.put(Homecontroller());
  return Drawer(
    child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      AnimatedTextKit(
                        displayFullTextOnTap: false,
                        repeatForever: true,
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'CLICK & PICK',
                            textStyle: colorizeTextStyle,
                            colors: colorizeColors,
                          ),
                        ],
                        isRepeatingAnimation: true,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("Term");
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.add_moderator,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Container(child: text2("Terms and Conditions".tr))
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.security,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            Container(child: text2("Privacy policy".tr))
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed("Privecy");
                        },
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.security,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            Container(child: text2("protection".tr))
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed("Protect");
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("about");
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.person_pin_sharp,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Container(child: text2("About Us".tr))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("contect");
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.mobile_friendly,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Container(child: text2("Contact Us".tr))
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          // showLoadingLang(context);
                          Navigator.of(context).pushNamed("myOrders");
                        },
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.language,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            Container(child: text2("My Order".tr))
                          ],
                        ),
                      ),
                      guest != true
                          ? InkWell(
                              onTap: () async {
                                showLoadingLogout(context);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.logout,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(child: text2("Log out".tr))
                                ],
                              ),
                            )
                          : InkWell(
                              onTap: () async {
                                Navigator.of(context)
                                    .pushReplacementNamed("startAccount");
                              },
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.login,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(child: text2('Login'.tr))
                                ],
                              ),
                            ),
                      guest != true
                          ? InkWell(
                              onTap: () async {
                                showLoadingDelet(context);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.delete_forever,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(child: text2("Delete Account".tr))
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: text1("For Help, Contact Us".tr),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  //To remove the keyboard when button is pressed
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  var whatsappUrl =
                                      "whatsapp://send?phone=${controller.whats}" +
                                          "&text=${Uri.encodeComponent(" ")}";
                                  try {
                                    launch(whatsappUrl);
                                  } catch (e) {
                                    print("Unable to open whatsapp");
                                  }
                                },
                                icon: const Icon(
                                  Icons.whatsapp,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () async {
                                  final Uri _url = Uri.parse(controller.face);
                                  if (!await launchUrl(_url)) {
                                    throw 'Could not launch $_url';
                                  }
                                },
                                icon: const Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () async {
                                  final Uri _url = Uri.parse(controller.site);
                                  if (!await launchUrl(_url)) {
                                    throw 'Could not launch $_url';
                                  }
                                },
                                icon: const Icon(
                                  Icons.web,
                                  color: Colors.white,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
  );
}
