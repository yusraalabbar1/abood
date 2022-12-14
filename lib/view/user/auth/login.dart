import 'package:abood/model/user/auth/login/api/loginApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var phone, password;

  bool _isObscure = true;

  FocusNode myFocusNode = new FocusNode();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text("CLICK & PICK"),
      ),
      body: Form(
        key: formstate,
        child: ListView(
          children: [
            Container(
              // alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20, left: 20),
                  child: text1('Login'.tr)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(decoration: boxd(), child: TextFormField1()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(decoration: boxd(), child: TextFormField2()),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("forgetPasswordNumber");
              },
              child: Container(
                  margin: EdgeInsets.only(top: 20, right: 40, left: 20),
                  // alignment: Alignment.centerRight,
                  child: text2("Forget Your Password?".tr)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ButtonRegister1(Colors.black, Colors.white, 'Login'.tr, 1),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child:
                  ButtonRegister1(Colors.white, Colors.black, "SignUp".tr, 2),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField TextFormField1() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Mobile Number".tr,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
      ),
      validator: (text) {
        if (text!.length > 15) {
          return "can\'t enter bigest than ".tr + "15" + "numbers".tr;
        }
        if (text.length < 9) {
          return "can\'t enter less than ".tr + "9" + "numbers".tr;
        }
      },
      onSaved: (string) {
        phone = string;
        print(phone);
      },
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
          return "can\'t enter bigest than ".tr + "40" + "characters".tr;
        }
        if (text.length < 6) {
          return "can\'t enter less than ".tr + "6" + "characters".tr;
        }
      },
      onSaved: (string) {
        password = string;
      },
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
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

  Text text2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.grey,
            fontSize: 21,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  Widget ButtonRegister1(c2, c1, text, n) {
    return Container(
      width: 300,
      height: 53,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            backgroundColor: c2,
            onPrimary: Colors.white,
            textStyle: TextStyle(color: c1)),
        onPressed: () {
          print('Button Clicked.');
          if (n == 1) {
            var formdata = formstate.currentState;
            if (formdata!.validate()) {
              formdata.save();
              print(" validddddddddddddddd");
              print("========information input==========");
              print(phone);
              print(password);
              print("========================");
              loginApi(context, phone, password);
            }
          } else if (n == 2) {
            Navigator.of(context).pushReplacementNamed("signup");
          }
        },
        child: Text(
          text,
          style: TextStyle(
              color: c1,
              fontSize: 21,
              fontFamily: 'majallab',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
