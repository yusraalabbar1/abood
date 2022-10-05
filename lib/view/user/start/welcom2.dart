import 'package:abood/controller/ControlUser.dart';
import 'package:abood/view/user/start/lang.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final pages = [
  const PageData(
    icon: Icons.bubble_chart,
    title: "ABOOD \nApplication \nTo Sell Products From \nSpecific Stores",
    bgColor: Colors.black,
    textColor: Colors.white,
  ),
  const PageData(
    icon: Icons.format_size,
    title: "Here There Are\nMany Beautiful & Distinctive\n Products & Offers",
    textColor: Colors.black,
    bgColor: Color.fromARGB(255, 211, 209, 209),
  ),
];
int pagel = 0;

class OnboardingWelcom extends StatefulWidget {
  const OnboardingWelcom({super.key});

  @override
  State<OnboardingWelcom> createState() => _OnboardingWelcomState();
}

class _OnboardingWelcomState extends State<OnboardingWelcom> {
  // Homecontroller controller = Get.put(Homecontroller());
//
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(body: GetBuilder<Homecontroller>(builder: (controller) {
      return (controller.page == 1
          ? lang()
          : ConcentricPageView(
              colors: pages.map((p) => p.bgColor).toList(),
              radius: screenWidth * 0.1,
              // curve: Curves.ease,
              nextButtonBuilder: (context) => Padding(
                  padding: const EdgeInsets.only(left: 3), // visual center
                  child: Icon(
                    Icons.navigate_next,
                    size: screenWidth * 0.08,
                  )),
              itemBuilder: (index) {
                final page = pages[index % pages.length];
                pagel = index;
                print("nnnnnnnnnnnnnnn $index");

                return SafeArea(
                  child: _Page(page: page),
                );
              },
            ));
    }));
  }
}

class PageData {
  final String? title;
  final IconData? icon;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

class _Page extends StatelessWidget {
  final PageData page;

  const _Page({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    space(double p) => SizedBox(height: screenHeight * p / 100);
    return Column(
      children: [
        space(10),
        _Image(
          page: page,
          size: 190,
          iconSize: 170,
        ),
        space(8),
        _Text(
          page: page,
          style: TextStyle(
              fontSize: screenHeight * 0.030, fontFamily: 'Nunito', height: 2),
        ),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.page,
    this.style,
  }) : super(key: key);

  final PageData page;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      page.title ?? '',
      style: TextStyle(
        color: page.textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Nunito',
        letterSpacing: 0.0,
        fontSize: 15,
        height: 1.2,
      ).merge(style),
      textAlign: TextAlign.center,
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.page,
    required this.size,
    required this.iconSize,
  }) : super(key: key);

  final PageData page;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final bgColor = page.bgColor
        // .withBlue(page.bgColor.blue - 40)
        .withGreen(page.bgColor.green + 20)
        .withRed(page.bgColor.red - 100)
        .withAlpha(90);

    final icon1Color =
        page.bgColor.withBlue(page.bgColor.blue - 10).withGreen(220);
    final icon2Color = page.bgColor.withGreen(66).withRed(77);
    final icon3Color = page.bgColor.withRed(111).withGreen(220);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(60.0)),
          // color: bgColor,
          color: Colors.white),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: 2,
              child: Icon(
                page.icon,
                size: iconSize + 20,
                // color: icon1Color,
                color: Colors.black,
              ),
            ),
            right: -5,
            bottom: -5,
          ),
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: 5,
              child: Icon(
                page.icon,
                size: iconSize + 20,
                // color: icon2Color,
                color: Colors.grey,
              ),
            ),
          ),
          Icon(
            page.icon,
            size: iconSize,
            // color: icon3Color,
            color: Color.fromARGB(255, 72, 71, 71),
          ),
        ],
      ),
    );
  }
}
