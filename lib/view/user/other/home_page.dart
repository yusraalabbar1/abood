import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/mylike/api/mylike.dart';
import 'package:abood/view/user/other/drawer_main.dart';
import 'package:abood/view/user/other/myCateg/categ.dart';
import 'package:abood/view/user/other/myHome/home.dart';
import 'package:abood/view/user/other/myNew/new.dart';
import 'package:abood/view/user/other/profile/my_profile.dart';
import 'package:abood/view/user/other/widget_appbar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

final List<Widget> widgetOptions = <Widget>[
  Home(),
  New(),
  category(),
  myProfile(),
];

class _homePageState extends State<homePage> {
  Homecontroller controller = Get.put(Homecontroller());
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // myLikeApi(controller.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      extendBody: true,
      appBar: appbarmain(_key, context),
      drawer: drawermain(context),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          InkWell(
              child: Icon(
            Icons.home,
            size: 25,
            color: Colors.white,
          )),
          InkWell(
            child: Icon(
              Icons.new_releases,
              size: 25,
              color: Colors.white,
            ),
          ),
          InkWell(
              child: Icon(
            Icons.category,
            size: 25,
            color: Colors.white,
          )),
          InkWell(
              child: Icon(
            Icons.person,
            size: 25,
            color: Colors.white,
          )),
        ],
        color: Colors.black,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: _onItemTapped,
        letIndexChange: (index) => true,
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
