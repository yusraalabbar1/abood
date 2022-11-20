import 'package:abood/constant/colors.dart';
import 'package:abood/model/user/auth/delet_account.dart';
import 'package:abood/view/user/auth/login.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

showLoadingDelet(context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Are you sure you want to delete account?".tr,
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          backgroundColor: Colors.black,
                        ),
                        child: Text("Yes".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.setBool("isLogin", false);
                          await deletAccount(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => login()),
                            (Route<dynamic> route) => false,
                          );
                          // Navigator.of(context).pushReplacementNamed("login");
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          backgroundColor: Colors.black,
                        ),
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
