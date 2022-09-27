//addRate(context, idItem, idUser, rate, comment);
//dialogRate();

import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/product/item/Rate/add_rateApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

showRate(context, idItem) async {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  Homecontroller controller = Get.put(Homecontroller());
  String comment = "";
  double rate = 4;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("add Comment",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontFamily: 'majallab',
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: formstate,
                  child: Column(
                    children: [
                      Container(
                        decoration: boxd(),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Enter Comment",
                            prefixIcon: IconButton(
                                onPressed: () {}, icon: Icon(Icons.comment)),
                          ),
                          validator: (text) {
                            if (text!.length > 30) {
                              return "can not enter bigest than 30";
                            }
                            if (text.length < 1) {
                              return "can not enter less than 1";
                            }
                          },
                          onSaved: (string) {
                            comment = string!;
                            print(comment);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,

                        // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 5,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                          rate = rating;
                        },
                      )
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 53,
                child: RaisedButton(
                  onPressed: () {
                    print('Button Clicked.');

                    var formdata = formstate.currentState;
                    if (formdata!.validate()) {
                      formdata.save();
                      print(" validddddddddddddddd");
                      print("========information input==========");
                      print(comment);
                      addRate(context, idItem, controller.id, rate, comment);
                      print("========================");
                      Navigator.pop(context);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: Text(
                    "Ok",
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
