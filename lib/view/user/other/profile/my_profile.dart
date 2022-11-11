import 'dart:io';

import 'package:abood/constant/colors.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/view/user/other/profile/edit_profile.dart';
import 'package:abood/view/user/other/widget/change_lang.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class myProfile extends StatefulWidget {
  myProfile({Key? key}) : super(key: key);

  @override
  State<myProfile> createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  Homecontroller controller = Get.put(Homecontroller());
  PickedFile? imageFile = null;
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option".tr,
              style: TextStyle(color: Colors.black),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery".tr),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.black,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera".tr),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Text Text1(text) {
    return Text(text.toString(),
        style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  Text Text2(text) {
    return Text(text.toString(),
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  void _openGallery(BuildContext context) async {
    String fileName = "";
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) {
      print("no image");
    } else {
      setState(() {
        imageFile = pickedFile;
        fileName = imageFile!.path.split('/').last;
      });
    }

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    String fileName = "";
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile == null) {
      print("no image");
    } else {
      setState(() {
        imageFile = pickedFile;
        fileName = imageFile!.path.split('/').last;
      });
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print(
            'Backbutton pressed (device or appbar button), do whatever you want.');
        Navigator.pushReplacementNamed(context, 'homePage');
        return Future.value(false);
      },
      child: Scaffold(
          body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                // image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: AssetImage("assets/images/logoclick&pick1.jpg")),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GetBuilder<Homecontroller>(builder: (controller) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 50,
                        backgroundImage: CachedNetworkImageProvider(
                            "http://cdn.onlinewebfonts.com/svg/img_81837.png"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Container(
                            child: Text1("First Name".tr),
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.all(20),
                                child: Text2(controller.firstName),
                              ),
                            ],
                          ))
                        ],
                      ),
                      line(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Container(
                            child: Text1("Last Name".tr),
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.all(20),
                                alignment: Alignment.topLeft,
                                child: Text2(controller.lastName),
                              ),
                            ],
                          ))
                        ],
                      ),
                      line(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Container(
                            child: Text1("Mobile Number".tr),
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.all(20),
                                alignment: Alignment.topLeft,
                                child: Text2(controller.mobileNumber),
                              ),
                            ],
                          ))
                        ],
                      ),
                      line(),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          decoration: boxd1(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: text2("Edit information".tr),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showLoadingUpdate(context);
                                  },
                                  icon: const Icon(
                                    Icons.navigate_next,
                                  ),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: boxd(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: text2("Edit password".tr),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed("editPassword");
                                  },
                                  icon: const Icon(
                                    Icons.navigate_next,
                                  ),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: boxd1(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: text2("Languages".tr),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showLoadingLang(context);
                                  },
                                  icon: const Icon(
                                    Icons.navigate_next,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  );
                })),
          ),
        ],
      )),
    );
  }

  Text text2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  BoxDecoration boxd1() {
    return BoxDecoration(
      color: Color.fromARGB(255, 241, 239, 239),
      borderRadius: BorderRadius.circular(15), //border corner radius
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 60, 59, 59)
              .withOpacity(0.2), //color of shadow
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  BoxDecoration boxd() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15), //border corner radius
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2), //color of shadow
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  line() {
    return Container(
      height: 2,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color.fromARGB(255, 32, 53, 104), Color(0xff414D72)]),
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
