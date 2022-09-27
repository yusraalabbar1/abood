import 'dart:async';
import 'package:abood/constant/urls.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselBanner extends StatefulWidget {
  const CarouselBanner({
    Key? key,
  }) : super(key: key);

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  PageController? _pageController;
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  // List<String> images = controller.bannerImg;

  int activePage = 1;
  int _currentPage = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < controllerPro.saveContrilerBannerMapMain.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController!.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 140,
          child: PageView.builder(
              itemCount: controllerPro.saveContrilerBannerMapMain.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(context, controllerPro.saveContrilerBannerMapMain,
                    pagePosition, active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(
                controllerPro.saveContrilerBannerMapMain.length, activePage))
      ],
    );
  }
}

Widget slider(context, images, pagePosition, active) {
  double margin = active ? 5 : 10;

  return InkWell(
    onTap: () async {
      print("$sliderurl${images[pagePosition]["image"]}");
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                sliderurl + images[pagePosition]["image"]),
            // image: CachedNetworkImageProvider(
            //     "https://friendly-proskuriakova.162-55-191-66.plesk.page/AboodAPI/Images/${images[pagePosition]["image"]}"),
            fit: BoxFit.cover,
          )),
    ),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
