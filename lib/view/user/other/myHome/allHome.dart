import 'package:abood/view/user/other/myHome/allStore.dart';
import 'package:abood/view/user/other/myHome/page_view_ads.dart';
import 'package:abood/view/user/other/myHome/page_view_banner.dart';
import 'package:flutter/material.dart';

class AllHome extends StatefulWidget {
  const AllHome({super.key});

  @override
  State<AllHome> createState() => _AllHomeState();
}

class _AllHomeState extends State<AllHome> {
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: box(),
                child: CarouselBanner()),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: box(),
                child: Carousel()),
            const SizedBox(
              height: 10,
            ),
            text1("المتاجر"),
            Container(
                decoration: box(),
                height: MediaQuery.of(context).size.height / 4,
                child: allStore())
          ],
        ),
      ),
    );
  }

  BoxDecoration box() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
}
