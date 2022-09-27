import 'package:abood/constant/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

Future diaSuccCart(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          dialogType: DialogType.SUCCES,
          btnOkOnPress: () {},
          body: Text(c.toString(),
              style: const TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}

Future diaFaildCart(context, c) {
  return AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          dialogType: DialogType.ERROR,
          headerAnimationLoop: true,
          btnOkOnPress: () {},
          body: Text(c.toString(),
              style: const TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'Almarai')),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: Colors.black)
      .show();
}
