import 'dart:async';

import 'package:abood/constant/colors.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/main.dart';
import 'package:abood/model/setting/settingApi.dart';
import 'package:abood/model/user/auth/signup/api/generate_city.dart';
import 'package:abood/model/user/auth/signup/api/generate_country.dart';
import 'package:abood/model/user/mycart/api/my_cart.dart';
import 'package:abood/model/user/mylike/api/mylike.dart';
import 'package:abood/model/user/notification/number_notifapi.dart';
import 'package:abood/model/user/other/banner/banneAdsrApi.dart';
import 'package:abood/model/user/other/banner/bannerMainApi.dart';
import 'package:abood/model/user/product/category/category.dart';
import 'package:abood/model/user/stor/stor_by_userId_main_page/stor_by_userId_main_page_api.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class welcom extends StatefulWidget {
  final id;
  const welcom({super.key, this.id});

  @override
  State<welcom> createState() => _welcomState();
}

class _welcomState extends State<welcom> {
  Timer? searchOnStoppedTyping;
  _onChangeHandler() {
    const duration = Duration(
        milliseconds:
            1); // set the duration that you want call pop() after that.
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping?.cancel(); // clear timer
    }
    searchOnStoppedTyping = new Timer(duration, () => navigateHome());
  }

  navigateHome() async {
    guest = false;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    ControllerProduct controllerPro = Get.put(ControllerProduct());
    Homecontroller controller = Get.put(Homecontroller());
    controller.Saveid(preferences.getInt('id'));
    controller.SavefirstName(preferences.getString('firstName'));
    controller.SavelastName(preferences.getString('lastName'));
    controller.SavemobileNumber(preferences.getString('mobileNumber'));
    controller.SavecountryId(preferences.getInt('countryId'));
    controllerPro.SaveLang(preferences.getString("lang"));
    // controller.SaveLang(preferences.getString("lang"));
    // await settingAll();
    // await Website();
    // await whatsup();
    // await facebook();
    // await term();
    // await aboutus();
    // await privacy();
    // await protection();
    await countryGen();
    await GetStorByUser();
    await AllCategories();
    await BannerApi();
    await GetStorByUser();
    await BannerMainApi();
    if (preferences.getBool("isLogin") == true) {
      guest = false;
      if (preferences.getInt("userType") == 1) {
        await numberNotificationApi();
        await myLikeApi(controller.id);
        await myCartApi();
        await cityGen();
        print(controller.id);
        Navigator.of(context).pushReplacementNamed("homePage");
      } else if (preferences.getInt("userType") == 2) {
        await numberNotificationApi();
        Navigator.of(context).pushReplacementNamed("MainScreenStor");
      } else {
        print("no thing");
      }
    } else {
      guest = true;
      Navigator.of(context).pushReplacementNamed("homePage");
    }
  }

  @override
  void dispose() {
    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }

  @override
  void initState() {
    _onChangeHandler();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 250.0,
              child: TextLiquidFill(
                text: 'CLICK & PICK',
                waveColor: Colors.white,
                boxBackgroundColor: Colors.black,
                textStyle: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
                boxHeight: 300.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "جميع الحقوق محفوظة لدى التطبيق ",
                style: TextStyle(
                    fontSize: 13, color: Colors.white, fontFamily: 'majallab'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
