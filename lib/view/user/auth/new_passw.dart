import 'package:abood/model/user/auth/forget_pass/api/forget_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgetPasswordNumber extends StatefulWidget {
  const forgetPasswordNumber({super.key});

  @override
  State<forgetPasswordNumber> createState() => _forgetPasswordNumberState();
}

class _forgetPasswordNumberState extends State<forgetPasswordNumber> {
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
              child: Center(child: text1("welcome back".tr)),
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
                  child: Center(child: text1("Mobile Number".tr))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(decoration: boxd(), child: TextFormField2()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ButtonRegister1(
                  Colors.black, Colors.white, "Next".tr, "forgetPassword"),
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
      // color: Colors.white,
      borderRadius: BorderRadius.circular(10), //border corner radius
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 201, 198, 198)
              .withOpacity(0.2), //color of shadow
          // spreadRadius: 5,
          blurRadius: 4,
          offset: Offset(1, 2),
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
          var formdata = formstate.currentState;
          if (formdata!.validate()) {
            formdata.save();
            print(" validddddddddddddddd");

            print('Button Clicked.');
            print(phone);
            forgetApi(context, phone);
          }
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
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: "Mobile Number".tr,
        prefixIcon:
            IconButton(onPressed: () {}, icon: Icon(Icons.mobile_friendly)),
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Color(0xffFAB10C) : Colors.black),
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can\'t enter bigest than ".tr + "40" + "characters".tr;
        }
        if (text.length < 6) {
          return "can\'t enter less than ".tr + "6" + "characters".tr;
        }
        return null;
      },
      onSaved: (string) {
        phone = string;
      },
    );
  }

  TextFormField TextFormFieldConf() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: "Confirme PassWord".tr,
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
          return "can\'t enter bigest than ".tr + "40" + "characters".tr;
        }
        if (text.length < 6) {
          return "can\'t enter less than ".tr + "6" + "characters".tr;
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
