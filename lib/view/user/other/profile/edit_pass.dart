import 'package:abood/model/user/auth/profile/change_password.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class editPassword extends StatefulWidget {
  editPassword({Key? key}) : super(key: key);

  @override
  State<editPassword> createState() => _editPasswordState();
}

class _editPasswordState extends State<editPassword> {
  var current_password;
  var new_password;
  var password_confirmation;
  bool _isObscure = true;
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  FocusNode myFocusNode = new FocusNode();

  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Form(
        key: formstate,
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Text(
                  "Change password".tr,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Text(
                  "new password".tr,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                child: Center(
                    child:
                        //   GetBuilder<homecontroller>(builder: (controller) {
                        // return (
                        TextFormField(
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (text) {
                    if (text!.length > 30) {
                      return "can not enter bigest than 30";
                    }
                    if (text.length < 2) {
                      return "can not enter less than 2";
                    }
                    return null;
                  },
                  obscureText: _isObscure1,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure1
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure1 = !_isObscure1;
                          });
                        }),
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Color(0xffFAB10C)
                            : Colors.black),
                  ),
                  onSaved: (string) {
                    new_password = string;
                    // controller.SavePassWord(string);
                  },
                )
                    //   );
                    // })
                    ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: Text(
                  "password confirmation".tr,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                child: Center(
                    child:
                        //   GetBuilder<homecontroller>(builder: (controller) {
                        // return (
                        TextFormField(
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (text) {
                    if (text!.length > 30) {
                      return "can not enter bigest than 30";
                    }
                    if (text.length < 2) {
                      return "can not enter less than 2";
                    }
                    return null;
                  },
                  obscureText: _isObscure2,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure2
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure2 = !_isObscure2;
                          });
                        }),
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Color(0xffFAB10C)
                            : Colors.black),
                  ),
                  onSaved: (string) {
                    password_confirmation = string;
                    // controller.SavePassWord(string);
                  },
                )
                    //   );
                    // })
                    ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.only(
                      bottom: 10, right: 30, left: 30, top: 10),
                  child: RaisedButton(
                    color: Colors.black,
                    elevation: 10,
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: Colors.black, width: 2)),
                    onPressed: () {
                      var formdata = formstate.currentState;
                      if (formdata!.validate()) {
                        formdata.save();
                        print("========================");
                        if (password_confirmation != new_password) {
                          diaFaildCart(
                              context, "password_confirmation!=new_password");
                        } else {
                          changPassWord(context, new_password);
                        }
                      }
                    },
                    child: Text(
                      "Ok".tr,
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontFamily: 'Almarai'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
