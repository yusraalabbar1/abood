import 'dart:async';
import 'package:abood/constant/urls.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/myCateg/sub2cat.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
          width: MediaQuery.of(context).size.width / 1.11,
          height: MediaQuery.of(context).size.height / 6,
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
      print("${images[pagePosition]["target"]}");
      if (images[pagePosition]["target"] == "LINK") {
        final Uri _url = Uri.parse(images[pagePosition]["value"]);
        if (!await launchUrl(_url)) {
          throw 'Could not launch $_url';
        }
      } else if (images[pagePosition]["target"] == "STORE") {
        guest != true
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Sub2cat(
                      id: int.parse(images[pagePosition]["value"].toString())),
                ),
              )
            : diaGuest(context);
      } else if (images[pagePosition]["target"] == "ITEM") {
        // await getItemsIdApi(
        //     int.parse(images[pagePosition]["value"].toString()));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => particulerProduct(
                id: int.parse(images[pagePosition]["value"].toString())),
          ),
        );
      }
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
