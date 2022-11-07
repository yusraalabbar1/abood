import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/user/mylike/api/add_like.dart';
import 'package:abood/model/user/mylike/api/delete_like.dart';
import 'package:abood/model/user/mylike/api/mylike.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:abood/model/user/stor/stor_item/stor_item_model.dart';
import 'package:abood/view/user/other/drawer_main.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class Sub2cat extends StatefulWidget {
  final id;
  const Sub2cat({super.key, this.id});

  @override
  State<Sub2cat> createState() => _Sub2catState();
}

class _Sub2catState extends State<Sub2cat> {
  int i = 0;
  double account = 2.0;
  int currentPage = 0;

  late int totalPages;

  List<StorItemsData> passengers = [];
  Homecontroller controller = Get.put(Homecontroller());
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////
  var text = "";
  Future<bool> getPassengerData({bool isRefresh = false}) async {
    print("=====store id======");
    var c2;
    var id;
    if (widget.id == null) {
      c2 = 0;
    } else {
      c2 = int.parse(widget.id.toString());
    }
    if (controller.id == null) {
      id = 0;
    } else {
      id = int.parse(controller.id.toString());
    }
    print(id);
    print(c2);
    if (isRefresh) {
      currentPage = 0;
    } else {
      print("============================");
      print("thisssssssssssssssssssss");
      print("============================");
    }
    // print(widget.id);
    var request = http.Request(
        'GET',
        Uri.parse(
            baseURL + '/api/store/$c2/items/users/$id/pageIndex/$currentPage'));

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
      if (passengers.length == 0) {
        text = "Ther are no Products in the stor".tr;
      }
      // totalPages = result.meta!.totalPages!;
      // totalPages = 0;

      print(res.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  Text text4(text) {
    return Text(text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'majallab',
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ));
  }

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 23.0,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 5,
          // shadowColor: Colors.pink,
          title: Text(
            "Product".tr,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Column(children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("offer");
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text("Click to Go See Offers".tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    AnimatedTextKit(
                      displayFullTextOnTap: false,
                      repeatForever: true,
                      animatedTexts: [
                        ColorizeAnimatedText(
                          '30% ' + "OFF".tr,
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          '50% ' + "OFF".tr,
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          '20% ' + "OFF".tr,
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          '10% ' + "OFF".tr,
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {
                        print("Tap Event");
                      },
                    )
                  ],
                )),
          ),
          Slider(
            value: account,
            max: 3,
            // divisions: 1,
            min: 1,
            activeColor: Colors.black,
            label: account.round().toString(),
            onChanged: (double value) {
              setState(() {
                account = value;
              });
            },
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
                    final result = await getPassengerData();
                    if (result) {
                      refreshController.loadComplete();
                    } else {
                      refreshController.loadFailed();
                    }
                  },
                  child: passengers.length != 0
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: account.round(),
                                      childAspectRatio: 3 / 4.0,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemCount: passengers.length,
                              itemBuilder: (context, index) {
                                final passenger = passengers[index];
                                return InkWell(
                                    onTap: () async {
                                      print(passenger.itemId);
                                      // await getItemsIdApi(passenger.itemId);
                                      // Navigator.of(context)
                                      //     .pushNamed("particularProducte");
                                      print(passenger.itemId);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              particulerProduct(
                                                  id: passenger.itemId),
                                        ),
                                      );
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        //child: Text(myProducts[index]["name"]),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                        decoration: passenger
                                                                    .itemImages!
                                                                    .length >
                                                                0
                                                            ? box2(passenger
                                                                .itemImages![0]
                                                                .imageUrl)
                                                            : box2(passenger
                                                                .image)),
                                                    Positioned(
                                                        left: 7,
                                                        top: 0.0,

                                                        // (background container size) - (circle height / 2)
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                              height: 35.0,
                                                              width: 35.0,
                                                              child: Stack(
                                                                children: [
                                                                  Center(
                                                                      child: Icon(
                                                                          Icons
                                                                              .favorite,
                                                                          color: Colors
                                                                              .white,
                                                                          size:
                                                                              25.0)),
                                                                  Center(
                                                                    child: IconButton(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .favorite_sharp,
                                                                          color: passenger.isWish == true
                                                                              ? Colors.black
                                                                              : Colors.white,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        onPressed: () async {
                                                                          if (passenger.isWish ==
                                                                              false) {
                                                                            //add and change color
                                                                            setState(() {
                                                                              i = 1;
                                                                              passenger.isWish = true;
                                                                            });
                                                                            await addLike(passenger.itemId,
                                                                                controller.id);
                                                                            await myLikeApi(controller.id);
                                                                          } else if (passenger.isWish ==
                                                                              true) {
                                                                            //delete
                                                                            setState(() {
                                                                              i = 0;
                                                                              passenger.isWish = false;
                                                                            });
                                                                            await deleteLike(controller.id,
                                                                                passenger.itemId);
                                                                            await myLikeApi(controller.id);
                                                                          }
                                                                        }),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                  ],
                                                )),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                      width: 50,
                                                      height: 30,
                                                      decoration: boxd2(),
                                                      child: Center(
                                                          child: textBot(
                                                              passenger
                                                                  .newPrice))),
                                                ),
                                                text3(
                                                  passenger.itemName.toString(),
                                                ),
                                              ],
                                            )),
                                          ],
                                        )));
                              }),
                        )
                      : Center(
                          child: Text(text,
                              style: const TextStyle(
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Almarai')),
                        )))
        ]));
  }

  Text textBot(text) {
    return Text(text.toString(),
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  BoxDecoration boxd2() {
    return BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(5), //border corner radius
    );
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
            topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(imageAds + img.toString())));
  }
}
