import 'package:flutter/material.dart';
import 'package:get/get.dart';

class startAccount extends StatefulWidget {
  const startAccount({super.key});

  @override
  State<startAccount> createState() => _startAccountState();
}

bool? guest = false;

class _startAccountState extends State<startAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABOOD"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: text1("Don't have an account?".tr),
            ),
          ),
          const Divider(
              // height: MediaQuery.of(context).size.height,
              color: Colors.grey,
              thickness: 1),
          const SizedBox(
            height: 50,
          ),
          ButtonRegister1(Colors.black, Colors.white, 'Login'.tr, "login"),
          const SizedBox(
            height: 20,
          ),
          ButtonRegister1(Colors.white, Colors.black, "SignUp".tr, "signup"),
          const SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {
                guest = true;
                Navigator.of(context).pushReplacementNamed("homePage");
              },
              child: Text(
                "Guest".tr,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontFamily: 'majallab',
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  Widget ButtonRegister1(c2, c1, text, nav) {
    return Container(
      width: 300,
      height: 53,
      child: RaisedButton(
        onPressed: () {
          print('Button Clicked.');
          Navigator.of(context).pushNamed(nav);
        },
        shape: const RoundedRectangleBorder(
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
}
