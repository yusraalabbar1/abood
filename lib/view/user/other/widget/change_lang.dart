import 'package:abood/constant/colors.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

showLoadingLang(context) {
  var name, mobile, city, area;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Change Language".tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Almarai')),
              SizedBox(
                height: 30,
              ),
              GetBuilder<ControllerProduct>(builder: (controller) {
                return (Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.black, width: 2)),
                      ),
                      child: Text("العربية".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Almarai')),
                      onPressed: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setString("lang", 'ar');
                        print('Button Clicked.');
                        controller.SaveLang('ar');
                        preferences.setString("lang", "ar");
                        Get.updateLocale(Locale('ar'));
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.black, width: 2)),
                      ),
                      child: Text("English".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Almarai')),
                      onPressed: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setString("lang", 'en');
                        controller.SaveLang('en');
                        print('Button Clicked.');
                        preferences.setString("lang", "en");
                        Get.updateLocale(Locale('en'));
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
              }),
            ],
          ),
        );
      });
}
