//addRate(context, idItem, idUser, rate, comment);
//dialogRate();

import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/product/item/Rate/add_rateApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

showRateWait(context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Waiting for review Rate".tr,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontFamily: 'majallab',
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 53,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      backgroundColor: Colors.black,
                      onPrimary: Colors.white,
                      textStyle: TextStyle(
                        color: Colors.white,
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontFamily: 'majallab',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        );
      });
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
