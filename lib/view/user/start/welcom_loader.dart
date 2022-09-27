import 'dart:async';

import 'package:abood/constant/colors.dart';
import 'package:abood/model/user/mylike/api/mylike.dart';
import 'package:flutter/material.dart';

class welcomHome extends StatefulWidget {
  welcomHome({Key? key}) : super(key: key);

  @override
  State<welcomHome> createState() => _welcomHomeState();
}

class _welcomHomeState extends State<welcomHome>
    with AutomaticKeepAliveClientMixin {
  getInfo() async {}

  Timer? searchOnStoppedTyping;
  _onChangeHandler() {
    const duration = Duration(
        milliseconds:
            8000); // set the duration that you want call pop() after that.
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping?.cancel(); // clear timer
    }
    searchOnStoppedTyping = new Timer(duration, () => navigateHome());
  }

  navigateHome() {
    Navigator.of(context).pushReplacementNamed("homePage");
  }

  @override
  void initState() {
    getInfo();
    _onChangeHandler();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              child: Center(
                  child: Image.asset(
            "assets/images/loading2.gif",
            width: 130,
          ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "جميع الحقوق محفوظة لدى التطبيق ",
                style: TextStyle(
                    fontSize: 13,
                    color: MyColors.color3,
                    fontFamily: 'Almarai'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
