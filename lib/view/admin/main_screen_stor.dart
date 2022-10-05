import 'package:abood/constant/colors.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/view/admin/stor_add.dart';
import 'package:abood/view/admin/stor_by_merch.dart';
import 'package:abood/view/user/other/widget/dialogs_drawer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class MainScreenStor extends StatefulWidget {
  const MainScreenStor({super.key});

  @override
  State<MainScreenStor> createState() => _MainScreenStorState();
}

class _MainScreenStorState extends State<MainScreenStor> {
  Homecontroller controller = Get.put(Homecontroller());
  Widget ButtonRegister1(c2, c1, text, nav, w) {
    return Container(
      width: w,
      height: 53,
      child: RaisedButton(
        onPressed: () {
          print('Button Clicked.');
          Navigator.of(context).pushNamed(nav);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Text(
          text,
          style: TextStyle(
              color: c1,
              fontSize: 21,
              fontFamily: 'majallab',
              fontWeight: FontWeight.bold),
        ),
        textColor: c1,
        splashColor: Colors.white,
        color: c2,
      ),
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  Text text2(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  Text appText(text) {
    return Text(text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ));
  }

  Text appText3(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  Text appText2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  static const colorizeColors = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 25.0,
    fontFamily: 'majallab',
  );

  BoxDecoration box(img) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      image: DecorationImage(image: AssetImage(img)),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    );
  }

  BoxDecoration boxd() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10), //border corner radius
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

  TextFormField TextFormFieldFirst() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      enabled: false,
      decoration: InputDecoration(
        hintText: " Search",
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 1) {
          return "can not enter less than 1";
        }
        return null;
      },
      onSaved: (string) {},
    );
  }

  Widget widgetTitle(text) {
    return Center(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Center(child: appText2(text))));
  }

  Future<bool> _onwillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text('Exit the app'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Almarai')),
            ),
            content: Text('Are you sure you are going out?'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Color.fromARGB(255, 240, 245, 246),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Colors.white, width: 2)),
                      child: Text("Home".tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Almarai')),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("welcom");
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: MyColors.color1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: MyColors.color1, width: 2)),
                      child: Text("Yes".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Almarai')),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Color.fromARGB(255, 231, 38, 64),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                              color: Color.fromARGB(255, 231, 38, 64),
                              width: 2)),
                      child: Text("No".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Almarai')),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onwillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [appText(" MainScreen".tr)],
            ),
          ),
          actions: [
            Container(
              // padding: const EdgeInsets.only(right: 25.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("notificationStore");
                  },
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            Container(
              child: IconButton(
                  onPressed: () {
                    showLoadingLogout(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  decoration: boxd(),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("searchProduct");
                      },
                      child: TextFormFieldFirst())),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).pushNamed("AddProduct");StorByMerchAdd
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StorByMerchAdd(
                                  id: controller.id,
                                  typeOperation: 'addOffer')),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration:
                            box("assets/images/Untitled design (2).png"),
                        child: Column(
                          children: [
                            Expanded(flex: 3, child: Container()),
                            Expanded(child: widgetTitle("Add Product".tr)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StorByMerch(
                                  id: controller.id,
                                  typeOperation: 'addOffer')),
                        );
                        // Navigator.of(context).pushNamed("AllItemsStoreoffer");
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration:
                            box("assets/images/Untitled design (10).png"),
                        child: Column(
                          children: [
                            Expanded(flex: 3, child: Container()),
                            Expanded(child: widgetTitle("Add Offer".tr)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StorByMerch(
                                  id: controller.id, typeOperation: 'editPod')),
                        );
                        // Navigator.of(context).pushNamed("AllItemsStoreEdit");
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration:
                            box("assets/images/Untitled design (4).png"),
                        child: Column(
                          children: [
                            Expanded(flex: 3, child: Container()),
                            Expanded(child: widgetTitle("Edit Product".tr)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StorByMerch(
                                  id: controller.id,
                                  typeOperation: 'deletePro')),
                        );
                        // Navigator.of(context).pushNamed("AllItemsStoreDelet");
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration:
                            box("assets/images/Untitled design (5).png"),
                        child: Column(
                          children: [
                            Expanded(flex: 3, child: Container()),
                            Expanded(child: widgetTitle(" Delete product".tr)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "All Products".tr,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Nunito', fontSize: 20),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("AllItemsStore");
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  // gradient: LinearGradient(
                  //   begin: Alignment.bottomRight,
                  //   end: Alignment.bottomLeft,
                  //   colors: [
                  //     Color.fromARGB(255, 63, 63, 64),
                  //     Color.fromARGB(255, 238, 213, 92),
                  //   ],
                  // )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                        child: Image.asset(
                            "assets/images/Untitled design (11).png")),
                    Center(child: appText3("Click^^ \nTo see \nAll Product".tr))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Center(
            //     child: ButtonRegister1(Colors.black, Colors.white, "إضافة منتج",
            //         "AddProduct", 300.0),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Center(
            //     child: ButtonRegister1(Colors.black, Colors.white,
            //         "إضافة صور لمنتج", "AllItemsStore", 300.0),
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(20.0),
            //       child: Center(
            //           child: ButtonRegister1(Colors.black, Colors.white,
            //               "تعديل منتج", "AllItemsStore", 130.0)),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(20.0),
            //       child: Center(
            //           child: ButtonRegister1(Colors.black, Colors.white,
            //               "حذف منتج", "AllItemsStore", 130.0)),
            //     ),
            //   ],
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Center(
            //       child: ButtonRegister1(Colors.black, Colors.white, "إضافة عرض",
            //           "AllItemsStoreoffer", 300.0)),
            // ),
          ],
        ),
      ),
    );
  }
}
