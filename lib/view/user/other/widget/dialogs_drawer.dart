import 'package:abood/constant/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

showLoadingLogout(context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Are you sure you want to log out?".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 30,
                  ),
                  // GetBuilder<homecontroller>(builder: (controller) {
                  //   return ();
                  // }),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.black, width: 2)),
                        child: Text("Yes".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.setBool("isLogin", false);
                          Navigator.of(context).pushReplacementNamed("welcom");
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.black, width: 2)),
                        child: Text("No".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
          })
      // : AwesomeDialog(
      //         context: context,
      //         animType: AnimType.RIGHSLIDE,
      //         dialogType: DialogType.ERROR,
      //         headerAnimationLoop: true,
      //         btnOkOnPress: () {},
      //         body: Text("لم تقم بتسجيل الدخول",
      //             style: TextStyle(
      //                 color: MyColors.color2,
      //                 fontSize: 14,
      //                 fontFamily: 'Almarai')),
      //         dialogBackgroundColor: MyColors.color3,
      //         btnOkColor: MyColors.color1)
      //     .show();
      ;
}
