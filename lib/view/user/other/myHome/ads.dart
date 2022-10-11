import 'dart:async';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ads extends StatefulWidget {
  const ads({super.key});

  @override
  State<ads> createState() => _adsState();
}

class _adsState extends State<ads> {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  int _pos = 0;
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        _pos = (_pos + 1) % controllerPro.saveContrilerBannerMap.length;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 6,
        child: InkWell(
          onTap: () {
            guest != true
                ? Navigator.of(context).pushNamed("offer")
                : diaGuest(context);
          },
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: sliderurl +
                controllerPro.saveContrilerBannerMap[_pos]["image"].toString(),
          ),
        )
        /*InkWell(
        onTap: () {
          guest != true
              ? Navigator.of(context).pushNamed("offer")
              : diaGuest(context);
        },
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 200),
          ),
          items: controllerPro.saveContrilerBannerMap.map((item) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: CachedNetworkImageProvider(sliderurl + item["image"]),
                fit: BoxFit.cover,
              )),
            );
          }).toList(),
        ),
      ),*/
        );
  }
}
