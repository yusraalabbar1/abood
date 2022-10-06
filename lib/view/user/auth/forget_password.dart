import 'package:abood/model/user/auth/profile/change_password.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({super.key});

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  var email, password, first, last, passwordConf, phone;

  bool _isObscure = true;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABOOD"),
      ),
      body: Form(
        key: formstate,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: text1("Reset Password".tr)),
            ),
            const Divider(
                // height: MediaQuery.of(context).size.height,
                color: Colors.grey,
                thickness: 1),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: Center(child: text1("Enter the new password".tr))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(decoration: boxd(), child: TextFormField2()),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(decoration: boxd(), child: TextFormFieldConf()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ButtonRegister1(
                  Colors.black, Colors.white, "Next".tr, "login"),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
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

  Widget ButtonRegister1(c2, c1, text, nav) {
    return Container(
      width: 300,
      height: 53,
      child: RaisedButton(
        onPressed: () {
          print('Button Clicked.');
          var formdata = formstate.currentState;
          if (formdata!.validate()) {
            formdata.save();
            print("========================");
            if (passwordConf != password) {
              diaFaildCart(context, "password_confirmation!=new_password");
            } else {
              changPassWordForget(context, password);
            }
          }
          // Navigator.of(context).pushNamed(nav);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Text(
          text,
          style: TextStyle(
              color: c1,
              fontSize: 21,
              fontFamily: 'majallab',
              fontWeight: FontWeight.bold),
        ),
        textColor: c1,
        splashColor: Colors.white,
        color: c2,
      ),
    );
  }

  TextFormField TextFormField2() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: "Password".tr,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.password)),
        suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Color(0xffFAB10C) : Colors.black),
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 6) {
          return "can not enter less than 6";
        }
        return null;
      },
      onSaved: (string) {
        password = string;
      },
    );
  }

  TextFormField TextFormFieldConf() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: "Confirm Password".tr,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.password)),
        suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Color(0xffFAB10C) : Colors.black),
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 6) {
          return "can not enter less than 6";
        }
        return null;
      },
      onSaved: (string) {
        passwordConf = string;
      },
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }
}
