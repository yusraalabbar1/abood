import 'package:abood/controller/ControlUser.dart';
import 'package:abood/view/admin/add_offer.dart';
import 'package:abood/view/admin/delet_item.dart';
import 'package:abood/view/admin/edit_item.dart';
import 'package:abood/view/admin/picker_mu_image.dart';
import 'package:abood/view/user/other/drawer_main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:abood/constant/urls.dart';
import 'package:abood/model/user/stor/stor_item/stor_item_model.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class AllItemsStoreDelet extends StatefulWidget {
  final id;
  const AllItemsStoreDelet({super.key, this.id});

  @override
  State<AllItemsStoreDelet> createState() => _AllItemsStoreDeletState();
}

class _AllItemsStoreDeletState extends State<AllItemsStoreDelet> {
  int i = 0;
  double account = 2.0;
  int currentPage = 0;
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }
  // late int totalPages;

  List<StorItemsData> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    int idd = int.parse(widget.id.toString());
    Homecontroller controller = Get.put(Homecontroller());
    int id_user = controller.id;
    print(idd);
    print("============================");
    if (isRefresh) {
      currentPage = 0;
      print("1===========================");
    } else {
      print("2===========================");
      print(currentPage);
      // if (currentPage > 2) {
      //   print("3========================");
      //   refreshController.loadNoData();
      //   return false;
      // }
    }
    print("==========currentPage============");
    print(currentPage);
    var request = http.Request('GET',
        Uri.parse(baseURL + '/api/store/$idd/items/pageIndex/$currentPage'));

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = StorItemsFromJson(res.body);

      if (isRefresh) {
        passengers = result.data!;
      } else {
        passengers.addAll(result.data!);
      }

      currentPage++;

      // totalPages = result.meta!.totalPages!;

      print(res.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  static const colorizeColors = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  BoxDecoration boxd() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10), //border corner radius
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2), //color of shadow
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  BoxDecoration boxd2() {
    return BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(5), //border corner radius
    );
  }

  static const colorizeTextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'majallab',
  );
  Text appText(text) {
    return Text(text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ));
  }

  Text appText2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  Text textBot(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appText(" Delete product".tr),
              appText2("this is all product".tr)
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await getPassengerData(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  print("loading new");
                  final result = await getPassengerData();
                  print(result);
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadFailed();
                  }
                },
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: passengers.length,
                    itemBuilder: (context, index) {
                      final passenger = passengers[index];
                      return InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DeletItem(pass: passenger)),
                            );
                          },
                          child: Container(
                              alignment: Alignment.center,
                              //child: Text(myProducts[index]["name"]),
                              decoration: boxd(),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Stack(children: [
                                        Container(
                                            decoration:
                                                passenger.itemImages!.length > 0
                                                    ? box2(passenger
                                                        .itemImages![0]
                                                        .imageUrl)
                                                    : box2(passenger.image)),
                                      ])),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DeletItem(pass: passenger)),
                                          );
                                        },
                                        child: Container(
                                            width: 50,
                                            height: 30,
                                            decoration: boxd2(),
                                            child: Center(
                                                child: textBot("Delete".tr))),
                                      ),
                                      text3(
                                        passenger.itemName.toString(),
                                      ),
                                    ],
                                  )),
                                ],
                              )));
                    }),
              ))
            ])));
  }

  BoxDecoration box() {
    return BoxDecoration(
      color: Color.fromARGB(255, 193, 189, 189),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    );
  }

  BoxDecoration box2(img) {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        image: DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(
            // "https://cdn11.bigcommerce.com/s-9p889rxpkb/product_images/uploaded_images/15-ygt-690x480-min-resize.jpg"
            imageAds + img.toString())));
  }
}
