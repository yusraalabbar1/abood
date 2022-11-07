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
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: Text(
                    "Ok".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontFamily: 'majallab',
                        fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  color: Colors.black,
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
