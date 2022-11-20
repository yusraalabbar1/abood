import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/auth/profile/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

showLoadingUpdate(context) {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  Homecontroller controller = Get.find();
  String First = "", last = "";
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Form(
              key: formstate,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Edit".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 30,
                  ),
                  GetBuilder<Homecontroller>(builder: (controller) {
                    return Container(
                      decoration: boxd(),
                      child: (TextFormField(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Almarai',
                            fontSize: 10),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter first name".tr,
                        ),
                        validator: (text) {
                          if (text!.length > 15) {
                            return "can not enter bigest than 15";
                          }
                          if (text.length < 2) {
                            return "can not enter less than 2";
                          }
                          return null;
                        },
                        onSaved: (string) {
                          print("on saved");
                          First = string!;
                          controller.SavefirstName(string);
                        },
                      )),
                    );
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<Homecontroller>(builder: (controller) {
                    return Container(
                      decoration: boxd(),
                      child: (TextFormField(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Almarai',
                            fontSize: 10),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter Last name".tr,
                        ),
                        validator: (text) {
                          if (text!.length > 15) {
                            return "can not enter bigest than 15";
                          }
                          if (text.length < 2) {
                            return "can not enter less than 2";
                          }
                          return null;
                        },
                        onSaved: (string) {
                          print("on saved");
                          last = string!;
                          controller.SavelastName(string);
                        },
                      )),
                    );
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Colors.black, width: 2)),
                          backgroundColor: Colors.black,
                        ),
                        child: Text("Ok".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () async {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            formdata.save();
                            print("valid");

                            await editProfil(context, First, last);
                            Navigator.of(context).pop();
                          }
                          // Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 231, 38, 64),
                                  width: 2)),
                          backgroundColor: Color.fromARGB(255, 231, 38, 64),
                        ),
                        child: Text("Cancle".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                ],
              )),
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
