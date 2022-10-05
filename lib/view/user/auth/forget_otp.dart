import 'dart:async';

import 'package:abood/constant/colors.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/user/auth/signup/api/generate_otp.dart';
import 'package:abood/model/user/auth/signup/api/verify.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpForget extends StatefulWidget {
  @override
  _OtpForgetState createState() => _OtpForgetState();
}

class _OtpForgetState extends State<OtpForget> with TickerProviderStateMixin {
  // homecontroller controller = Get.put(homecontroller());
  TextEditingController textEditingController = TextEditingController();
  // homecontroller controller = Get.put(homecontroller());

  // ..text = "123456";

  // ignore: close_sinks

  Homecontroller controller = Get.put(Homecontroller());
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  late AnimationController _controller;
  int levelClock = 20;

  @override
  void initState() {
    generatOtp(context, controller.mobileNumber);
    errorController = StreamController<ErrorAnimationType>();
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  Text text2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          title: Text("ABOOD"),
        ),
        body: Stack(
          children: [
            Container(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: text1(
                            "You will receive a verification code via SMS.".tr),
                      ),
                    ),
                    const Divider(
                        // height: MediaQuery.of(context).size.height,
                        color: Colors.grey,
                        thickness: 1),
                    // GetBuilder<homecontroller>(builder: (controller) {
                    //   return (
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8),
                          child: text2("Enter the code sent to ".tr)),
                    )
                    //   );
                    // })
                    ,
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        color: Colors.transparent,
                        // margin: EdgeInsets.only(left: 10, right: 10),
                        child: PinCodeTextField(
                          backgroundColor: Colors.transparent,
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: const Color(0xff121E39),
                            fontWeight: FontWeight.bold,
                          ),
                          length: 4,
                          obscureText: true,
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 4) {
                              return "can not enter less than 4";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          // boxShadows: [
                          //   BoxShadow(
                          //     offset: Offset(0, 1),
                          //     color: Colors.black12,
                          //     blurRadius: 10,
                          //   )
                          // ],
                          onCompleted: (v) {
                            print("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        hasError
                            ? "*Please fill up all the cells properly".tr
                            : "",
                        style: TextStyle(
                            color: MyColors.color2,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              infoDialog(context, "RESEND".tr,
                                  controller.mobileNumber);
                            },
                            child:
                                text1("You haven't received the code yet?".tr)),
                        Countdown(
                          animation: StepTween(
                            begin: levelClock, // THIS IS A USER ENTERED NUMBER
                            end: 0,
                          ).animate(_controller),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonRegister1(
                              Colors.white, Colors.black, "VERIFY".tr, 1),
                          ButtonRegister1(
                              Colors.black, Colors.white, "Modify".tr, 2),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget ButtonRegister1(c2, c1, text, x) {
    return Container(
      width: 118,
      height: 53,
      child: RaisedButton(
        onPressed: () {
          print('Button Clicked.');
          // Navigator.of(context).pushNamed("otpSignup");
          if (x == 1) {
            formKey.currentState!.validate();
            // conditions for validating
            if (currentText.length != 4) {
              errorController!.add(
                  ErrorAnimationType.shake); // Triggering error shake animation
              setState(() => hasError = true);
            } else {
              print(levelClock);
              if (levelClock != 0) {
                hasError = false;
                // veryfy(context, controller.mobilControl,
                //     controller.passwordControl, currentText);
                verifyOtpForget(context, currentText);
              } else {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        headerAnimationLoop: true,
                        title: 'Error',
                        desc: 'time is over',
                        btnOkOnPress: () {},
                        btnOkIcon: Icons.cancel,
                        btnOkColor: Colors.red)
                    .show();
              }
            }
          } else {
            Navigator.of(context).pushNamed("signup");
          }
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: c1,
                fontSize: 18,
                fontFamily: 'majallab',
                fontWeight: FontWeight.bold),
          ),
        ),
        textColor: c1,
        splashColor: Colors.white,
        color: c2,
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    // print('animation.value  ${animation.value} ');
    // print('inMinutes ${clockTimer.inMinutes.toString()}');
    // print('inSeconds ${clockTimer.inSeconds.toString()}');
    // print(
    //     'inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 21,
        fontFamily: 'majallab',
        color: Colors.black,
      ),
    );
  }
}
