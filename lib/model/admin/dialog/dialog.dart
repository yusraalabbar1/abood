import 'package:abood/constant/colors.dart';
import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/model/user/auth/signup/api/generate_new_otp.dart';
import 'package:abood/view/admin/picker_mu_image.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future diaSucc(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          dialogType: DialogType.SUCCES,
          btnOkOnPress: () {},
          body: Center(
            child: Text(c.message.toString().tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          ),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

alert(context, text, tit) {
  return AlertDialog(
    title: Text(tit),
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
    actionsOverflowButtonSpacing: 20,
    actions: [
      ElevatedButton(onPressed: () {}, child: Text("Back")),
      ElevatedButton(onPressed: () {}, child: Text("Next")),
    ],
    content: Text(text),
  );
}

Future diaFaild(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          dialogType: DialogType.ERROR,
          headerAnimationLoop: true,
          btnOkOnPress: () {},
          body: Center(
            child: Text(c.message.toString().tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          ),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

Future mydiaFaild(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          dialogType: DialogType.ERROR,
          headerAnimationLoop: true,
          btnOkOnPress: () {},
          body: Center(
            child: Text(c.toString().tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          ),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

Future myDialog(context, c) {
  ControllerAdmin controller = Get.put(ControllerAdmin());
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          dialogType: DialogType.SUCCES,
          btnOkOnPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => muImage(id: controller.idProduct),
              ),
            );
          },
          body: Center(
            child: Text(c.toString().tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold)),
          ),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

Future myDialog2(context, c) {
  ControllerAdmin controller = Get.put(ControllerAdmin());
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          dialogType: DialogType.SUCCES,
          btnOkOnPress: () {
            Navigator.of(context).pushReplacementNamed("MainScreenStor");
          },
          body: Center(
            child: Text(c.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold)),
          ),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

Future myDialog3(context, c) {
  ControllerAdmin controller = Get.put(ControllerAdmin());
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          dialogType: DialogType.SUCCES,
          btnOkOnPress: () {
            Navigator.of(context).pushReplacementNamed("MainScreenStor");
          },
          body: Center(
            child: Text(c.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold)),
          ),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

Future infoDialog(context, c, mobile) {
  ControllerAdmin controller = Get.put(ControllerAdmin());
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          dialogType: DialogType.QUESTION,
          btnOkOnPress: () {
            generatnewOtp(context, mobile);
          },
          body: Center(
            child: Text(c.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold)),
          ),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}
