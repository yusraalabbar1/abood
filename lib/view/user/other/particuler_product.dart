import 'dart:async';

import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/api/addcart.dart';
import 'package:abood/model/user/mycart/api/cart_qty.dart';
import 'package:abood/model/user/mycart/api/my_cart.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:abood/model/user/mylike/api/add_like.dart';
import 'package:abood/model/user/mylike/api/delete_like.dart';
import 'package:abood/model/user/mylike/api/mylike.dart';
import 'package:abood/model/user/product/item/Rate/get_rateModel.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/widget/MyColorPicker.dart';
import 'package:abood/view/user/other/widget/SizeSelector.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
import 'package:abood/view/user/other/widget/dialog_rate.dart';
import 'package:abood/view/user/other/widget_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:http/http.dart' as http;

import '../../../model/user/product/item/Rate/get_Rateapi.dart';

class particulerProduct extends StatefulWidget {
  final id;
  const particulerProduct({super.key, this.id});

  @override
  State<particulerProduct> createState() => _particulerProductState();
}

class _particulerProductState extends State<particulerProduct> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("====================");
    print(controller.ItemsById["itemImages"]);
  }

  Future<void> share(id) async {
    await FlutterShare.share(
        title: 'Share Link ',
        text: 'Share Link Product in Abood Application',
        linkUrl: 'http://flutterbooksampleMyAbood.com/product=$id',
        chooserTitle: 'Share Link Product');
  }

  ControllerProduct controller = Get.put(ControllerProduct());
  Homecontroller controllerPro = Get.put(Homecontroller());
  List<Color> colors = [Colors.blue, Colors.green, Colors.yellow, Colors.pink];
  String select = '30';
  Color _color = Colors.blue;
  String color = "";
  String size = "";
  int sizescelect = 0;
  int colorselect = 0;
  int? tappedIndex;
  int? tappedIndexColor;
  String _enteredText = '';
  List<String> imagePath = [
    "assets/images/shoe_blue.png",
    "assets/images/shoe_green.png",
    "assets/images/shoe_yellow.png",
    "assets/images/shoe_pink.png"
  ];
  var selectedColor = Colors.blue;
  var isFavourite = false;
  int currentPage = 0;

  int totalPages = 0;

  List<ItemRate> passengers = [];
  double totalRate = 5.0;
  int numberRate = 0;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  int rateNum = 0;
  /////////////////////////////////////
  var text = "";
  Future<bool> getPassengerData({bool isRefresh = false}) async {
    int idd = int.parse(widget.id.toString());
    if (isRefresh) {
      currentPage = 0;
      // print("1");
    } else {
      // print("============================");
      print(totalPages);
      // print("============================");
      if (currentPage > totalPages) {
        // print("2");
        refreshController.loadNoData();
        return false;
      }
    }
    var request =
        http.Request('GET', Uri.parse(baseURL + '/api/items/$idd/rate'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = RateFromJson(res.body);

      if (isRefresh) {
        totalRate = result.data!.rate;
        numberRate = result.data!.totalOfRate;
        passengers = result.data!.itemRates!;
      } else {
        passengers.addAll(result.data!.itemRates!);
      }

      currentPage++;
      int rateNum = 0;
      // totalPages = result.meta!.totalPages!;
      // totalPages = 0;

      print(res.body);
      setState(() {
        if (passengers.length == 0) {
          text = "Ther are no comments".tr;
        }
      });
      return true;
    } else {
      return false;
    }
  }

  Homecontroller controller1 = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        elevation: 5,
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.of(context).pushNamed("MyCart");
              },
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () async {
                Navigator.of(context).pushNamed("myLike");
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: FutureBuilder(
        future: getItemsIdApi(widget.id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: ListView(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            child: controller.ItemsById["itemImages"].length > 0
                                ? PageView.builder(
                                    // shrinkWrap: true,
                                    itemCount: controller
                                        .ItemsById["itemImages"].length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, int i) {
                                      return InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: CachedNetworkImageProvider(
                                                      imageAds +
                                                          controller.ItemsById[
                                                                  "itemImages"][
                                                              i]["imageUrl"]))),
                                        ),
                                      );
                                    })
                                : const Center(child: Text("Not found Image")),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Text(controller.ItemsById["itemName"].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      fontFamily: 'majallab')),
                              const SizedBox(width: 15),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 5,
                                child: Center(
                                  child: Text(
                                    controller.ItemsById["itemDescription"]
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.bodyColor,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 13,
                                        height: 1.5),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      share(controller.ItemsById["itemId"]);
                                    },
                                    icon: const Icon(Icons.share)),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(width: 10),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                      "JD ${controller.ItemsById["newPrice"]}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          fontFamily: 'majallab'))),
                              Expanded(
                                  flex: 2,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(flex: 3, child: stars()),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                      "(" +
                                                          numberRate
                                                              .toString() +
                                                          ")",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'majallab',
                                                          fontSize: 15,
                                                          color: Colors.black)),
                                                ),
                                                Expanded(
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                          Icons.navigate_next)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                        ],
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 20,
                                        color: Colors.transparent,
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text("Colors:".tr,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'majallab')),
                          ),
                          const SizedBox(height: 10),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: property()),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text("Sizes:".tr,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: 'majallab')),
                          ),
                          const SizedBox(height: 10),
                          controller.ItemsById["itemSizes"].length > 0
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    height: 30,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller
                                            .ItemsById["itemSizes"].length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int i) {
                                          return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  tappedIndex = i;
                                                  size = controller.ItemsById[
                                                          "itemSizes"][i]
                                                      ["itemSizeDescEn"];
                                                  sizescelect =
                                                      controller.ItemsById[
                                                              "itemSizes"][i]
                                                          ["itemSizeId"];
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Chip(
                                                    backgroundColor:
                                                        tappedIndex == i
                                                            ? Colors.black
                                                            : Colors.grey,
                                                    shadowColor: Colors.black,

                                                    label: Text(
                                                      controller.ItemsById[
                                                              "itemSizes"][i]
                                                              ["itemSizeDescEn"]
                                                          .toString()
                                                          .toUpperCase(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ), //Text
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              ));
                                        }),
                                  ),
                                )
                              : Container(),
                          const SizedBox(height: 10),
                          // counter(controller.ItemsById["itemId"], 1),
                          const Divider(
                            thickness: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text("Comments".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'majallab',
                                        fontSize: 24,
                                        color: Colors.black)),
                                IconButton(
                                    onPressed: () async {
                                      if (guest == true) {
                                        diaGuest(context);
                                      } else {
                                        await showRate(context,
                                            int.parse(widget.id.toString()));
                                        if (rateNum == 1) {
                                          Timer(Duration(seconds: 2), () {
                                            showRateWait(context);
                                          });
                                          setState(() {
                                            rateNum = 0;
                                          });
                                        }
                                      }
                                    },
                                    icon: Icon(Icons.add_box))
                              ],
                            ),
                          ),
                          // passengers.length != 0
                          //     ?
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SmartRefresher(
                              controller: refreshController,
                              enablePullUp: true,
                              onRefresh: () async {
                                final result =
                                    await getPassengerData(isRefresh: true);
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
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: passengers.length,
                                      itemBuilder: (context, index) {
                                        final passenger = passengers[index];
                                        return Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Card(
                                              elevation: 5,
                                              color: Colors.white,
                                              child: ListTile(
                                                  trailing:
                                                      rating(passenger.rate),
                                                  subtitle: Text(
                                                    passenger.fullName
                                                        .toString(),
                                                  ),
                                                  title: Text(
                                                    passenger.rateText
                                                        .toString(),
                                                  )),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 20,
                                              color: Colors.transparent,
                                            )
                                          ],
                                        );
                                      })
                                  : Center(
                                      child: Text("Ther are no comments".tr,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              overflow: TextOverflow.ellipsis,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: 'Almarai')),
                                    ),
                            ),
                          )
                          // : Container()
                        ],
                      ),
                    ),
                    // bottomButton(int.parse(widget.id.toString()), sizescelect,
                    //     colorselect, controller.ItemsById["isWish"])
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          // padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 6,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    onPressed: () async {
                                      if (guest == true) {
                                        diaGuest(context);
                                      } else {
                                        print(int.parse(widget.id.toString()));
                                        print(sizescelect);
                                        print(colorselect);
                                        if (sizescelect != 0 &&
                                            colorselect != 0) {
                                          await addCartApi(
                                              context,
                                              int.parse(widget.id.toString()),
                                              sizescelect,
                                              colorselect);
                                          await myCartApi();
                                        } else if (sizescelect == 0 &&
                                            colorselect != 0) {
                                          Get.snackbar(
                                            "Note".tr,
                                            "Choose Size".tr,
                                            colorText: Colors.white,
                                            isDismissible: true,
                                            borderRadius: 10.0,
                                            backgroundColor:
                                                Color.fromARGB(255, 44, 43, 43)
                                                    .withOpacity(0.4),
                                            // icon: Icon(Icons.attachment, color: Colors.white),
                                            snackPosition: SnackPosition.BOTTOM,
                                          );
                                          // diaFaildCart(
                                          //     context, "Choose Size".tr);
                                        } else if (sizescelect != 0 &&
                                            colorselect == 0) {
                                          Get.snackbar(
                                            "Note".tr,
                                            "Choose Color".tr,
                                            colorText: Colors.white,
                                            isDismissible: true,
                                            borderRadius: 10.0,
                                            backgroundColor:
                                                Color.fromARGB(255, 44, 43, 43)
                                                    .withOpacity(0.4),
                                            // icon: Icon(Icons.attachment, color: Colors.white),
                                            snackPosition: SnackPosition.BOTTOM,
                                          );
                                          // diaFaildCart(
                                          //     context, "Choose Color".tr);
                                        } else if (sizescelect == 0 &&
                                            colorselect == 0) {
                                          Get.snackbar(
                                            "Note".tr,
                                            "Choose Size & Color".tr,
                                            colorText: Colors.white,
                                            backgroundColor:
                                                Color.fromARGB(255, 44, 43, 43)
                                                    .withOpacity(0.4),
                                            isDismissible: true,
                                            borderRadius: 10.0,
                                            snackPosition: SnackPosition.BOTTOM,
                                          );
                                          // diaFaildCart(context,
                                          //     "Choose Size & Color".tr);
                                        }
                                      }
                                    },
                                    child: Text(
                                      "Add to Bag ".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white),
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: IconButton(
                                      onPressed: () async {
                                        if (guest == true) {
                                          diaGuest(context);
                                        } else {
                                          if (controller.ItemsById["isWish"] ==
                                              false) {
                                            //add and change color
                                            setState(() {
                                              // i = 1;
                                              controller.ItemsById["isWish"] =
                                                  true;
                                            });
                                            await addLike(
                                                int.parse(widget.id.toString()),
                                                controller1.id);

                                            await myLikeApi(controller1.id);
                                          } else if (controller
                                                  .ItemsById["isWish"] ==
                                              true) {
                                            //delete
                                            setState(() {
                                              // i = 0;
                                              controller.ItemsById["isWish"] =
                                                  false;
                                            });
                                            await deleteLike(
                                                controller1.id,
                                                int.parse(
                                                    widget.id.toString()));
                                            await myLikeApi(controller1.id);
                                          }
                                        }
                                      },
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: controller.ItemsById["isWish"] ==
                                                true
                                            ? Colors.black
                                            : Colors.grey,
                                        size: 30,
                                      )))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  showRate(context, idItem) async {
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    Homecontroller controller = Get.put(Homecontroller());
    String comment = "";
    double rate = 4;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("add Comment".tr,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontFamily: 'majallab',
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: formstate,
                    child: Column(
                      children: [
                        Container(
                          decoration: boxd(),
                          child: TextFormField(
                            maxLength: 30,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Enter Comment".tr,
                              prefixIcon: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.comment)),
                            ),
                            validator: (text) {
                              if (text!.length > 30) {
                                return "can not enter bigest than 30";
                              }
                              if (text.length < 1) {
                                return "can not enter less than 1";
                              }
                            },
                            onSaved: (string) {
                              comment = string!;
                              print(comment);
                              setState(() {
                                rateNum = 1;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,

                          // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 5,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                            rate = rating;
                          },
                        )
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 53,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        backgroundColor: Colors.black,
                        onPrimary: Colors.white,
                        textStyle: TextStyle(color: Colors.white)),
                    onPressed: () {
                      print('Button Clicked.');

                      var formdata = formstate.currentState;
                      if (formdata!.validate()) {
                        formdata.save();
                        print(" validddddddddddddddd");
                        print("========information input==========");
                        print(comment);
                        addRate(context, idItem, controller.id, rate, comment);
                        print("========================");
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Ok".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontFamily: 'majallab',
                          fontWeight: FontWeight.bold),
                    ),
                    // textColor: Colors.white,
                    // splashColor: Colors.white,
                    // color: Colors.black,
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget counter(cartId, quent) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  await qtyCartApi(cartId, quent + 1);
                  await myCartApi();
                },
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.black,
                )),
            text1(quent.toString()),
            IconButton(
                onPressed: () async {
                  if (quent > 1) {
                    await qtyCartApi(cartId, quent - 1);
                    await myCartApi();
                  }
                },
                icon: const Icon(
                  Icons.remove_circle,
                  color: Colors.black,
                ))
          ],
        ),
      ],
    );
  }

  Widget rating(num) {
    return RatingBar.builder(
      initialRating: double.parse(num.toString()),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      itemBuilder: (context, _) => const Icon(
        Icons.star_rounded,
        color: Colors.amber,
        // size: 20,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Widget stars() {
    return RatingBar.builder(
      initialRating: totalRate,
      minRating: 1,
      direction: Axis.horizontal,
      // allowHalfRating: true,

      itemCount: 5,
      itemSize: 20,
      // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Container(
        // width: 2,
        // height: 2,
        child: Icon(
          Icons.star_rounded,
          color: Colors.amber,
          size: 2,
        ),
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image.asset("assets/images/back_button.png"),
          BackButton(),
          Column(
            children: [
              //ItemsById
              Text(controller.ItemsById["descEn"].toString(),
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16)),
              Text(controller.ItemsById["itemName"].toString(),
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24))
            ],
          ),
          Image.asset(
            "assets/images/bag_button.png",
            height: 34,
            width: 34,
          ),
        ],
      ),
    );
  }

  Widget hero() {
    return Container(
      child: Stack(
        children: [
          // Image.asset(imagePath[0]),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: imagePath.length,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(imagePath[index]);
              },
            ),
          ),
          Positioned(
              bottom: 10,
              right: 20,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    isFavourite = !isFavourite;
                  });
                },
                child: Image.asset(
                  isFavourite
                      ? "assets/images/heart_icon.png"
                      : "assets/images/heart_icon_disabled.png",
                  height: 34,
                  width: 34,
                ),
              ))
        ],
      ),
    );
  }

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

  Widget property() {
    return controller.ItemsById["itemColors"].length > 0
        ? Container(
            // height: MediaQuery.of(context).size.,
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              height: 25,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.ItemsById["itemColors"].length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          tappedIndexColor = i;
                          color =
                              controller.ItemsById["itemColors"][i]["value"];
                          colorselect = controller.ItemsById["itemColors"][i]
                              ["itemColorId"];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(int.parse(controller
                              .ItemsById["itemColors"][i]["value"]
                              .replaceAll("#", "0xff"))),
                          border: Border.all(
                            color: tappedIndexColor == i
                                ? Colors.black
                                : Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                    );
                  }),
            ))
        : Container();
  }

  Widget bottomButton(itemId, itemSizeId, itemColorId, isWish) {
    Homecontroller controller1 = Get.put(Homecontroller());
    var i;
    bool iswish = isWish;
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 6,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    // height: 70,
                    onPressed: () async {
                      print(itemId);
                      print(itemSizeId);
                      print(itemColorId);
                      if (itemSizeId != 0 && itemColorId != 0) {
                        await addCartApi(
                            context, itemId, itemSizeId, itemColorId);
                        await myCartApi();
                      } else if (itemSizeId == 0 && itemColorId != 0) {
                        diaFaildCart(context, "Choose Size".tr);
                      } else if (itemSizeId != 0 && itemColorId == 0) {
                        diaFaildCart(context, "Choose Color".tr);
                      } else if (itemSizeId == 0 && itemColorId == 0) {
                        diaFaildCart(context, "Choose Size & Color".tr);
                      }
                    },
                    child: Text(
                      "Add to Bag ".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: IconButton(
                      onPressed: () async {
                        if (iswish == false) {
                          //add and change color
                          setState(() {
                            i = 1;
                            iswish = true;
                          });
                          await addLike(itemId, controller1.id);
                          await myLikeApi(controller1.id);
                        } else if (iswish == true) {
                          //delete
                          setState(() {
                            i = 0;
                            iswish = false;
                          });
                          await deleteLike(controller1.id, itemId);
                          await myLikeApi(controller1.id);
                        }
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: iswish == true ? Colors.black : Colors.grey,
                        size: 30,
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Map<int, Color> getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;

    /// if [500] is the default color, there are at LEAST five
    /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
    /// divisor of 5 would mean [50] is a lightness of 1.0 or
    /// a color of #ffffff. A value of six would be near white
    /// but not quite.
    final lowDivisor = 6;

    /// if [500] is the default color, there are at LEAST four
    /// steps above [500]. A divisor of 4 would mean [900] is
    /// a lightness of 0.0 or color of #000000
    final highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }
}
