import 'package:abood/constant/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future diaGuest(context) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          dialogType: DialogType.INFO,
          btnOkOnPress: () {
            Navigator.of(context).pushReplacementNamed("startAccount");
          },
          body: Text("To Access Services, Pleas Login".tr,
              style: TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

class LoginGuest extends StatelessWidget {
  const LoginGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("To Access Services, Please Login".tr,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
        Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("startAccount");
            },
            child: Text("Login".tr),
          ),
        ),
      ],
    );
  }
}
