import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 20),
          autoPlayAnimationDuration: const Duration(milliseconds: 200),
          // height: MediaQuery.of(context).size.height,
        ),
        items: controllerPro.saveContrilerBannerMap.map((item) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: CachedNetworkImageProvider(sliderurl + item["image"]),
              // image: CachedNetworkImageProvider(
              //     "https://img.freepik.com/free-psd/social-media-promo-template-sales_23-2149533432.jpg?w=2000"),
              fit: BoxFit.cover,
            )),
            // child: Image.network(
            //   sliderurl + item["image"],
            //   fit: BoxFit.cover,
            //   width: MediaQuery.of(context).size.width,
            // ),
            // footer: Container(
            //   padding: const EdgeInsets.all(15),
            //   color: Colors.black54,
            // ),
          );
        }).toList(),
      ),
    );
  }
}
