import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/api/addcart.dart';
import 'package:abood/model/user/mycart/api/my_cart.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:abood/model/user/product/item/Rate/get_rateModel.dart';
import 'package:abood/view/user/other/widget/MyColorPicker.dart';
import 'package:abood/view/user/other/widget/SizeSelector.dart';
import 'package:abood/view/user/other/widget/dialog_rate.dart';
import 'package:abood/view/user/other/widget_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

  ControllerProduct controller = Get.put(ControllerProduct());
  List<Color> colors = [Colors.blue, Colors.green, Colors.yellow, Colors.pink];
  String select = '30';
  Color _color = Colors.blue;
  String color = "";
  String size = "";
  int sizescelect = 0;
  int colorselect = 0;
  int? tappedIndex;
  int? tappedIndexColor;
  List<String> imagePath = [
    "assets/images/shoe_blue.png",
    "assets/images/shoe_green.png",
    "assets/images/shoe_yellow.png",
    "assets/images/shoe_pink.png"
  ];
  var selectedColor = Colors.blue;
  var isFavourite = false;
  int currentPage = 0;

  late int totalPages;

  List<DatumRate> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

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
        passengers = result.data!;
      } else {
        passengers.addAll(result.data!);
      }

      currentPage++;

      // totalPages = result.meta!.totalPages!;
      totalPages = 0;

      print(res.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          title: Text(controller.ItemsById["itemName"].toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'majallab',
                  fontSize: 24,
                  color: Colors.black)),
          elevation: 5,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.2,
              child: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    child: Expanded(
                      child: controller.ItemsById["itemImages"].length > 0
                          ? ListView.builder(
                              itemCount:
                                  controller.ItemsById["itemImages"].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int i) {
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                                imageAds +
                                                    controller.ItemsById[
                                                            "itemImages"][i]
                                                        ["imageUrl"]))),
                                  ),
                                );
                              })
                          : const Center(child: Text("Not found Image")),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      stars(),
                      Text("255",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'majallab',
                              fontSize: 24,
                              color: Colors.black)),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Center(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In "
                        "rutrum at ex non eleifend. Aenean sed eros a purus "
                        "gravida scelerisque id in orci. Mauris elementum id "
                        "nibh et dapibus. Maecenas lacinia volutpat magna",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.bodyColor,
                            fontSize: 14,
                            height: 1.5),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: const Text("Colors",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'majallab',
                            fontSize: 24,
                            color: Colors.black)),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: property()),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: const Text("Sizes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'majallab',
                            fontSize: 24,
                            color: Colors.black)),
                  ),
                  controller.ItemsById["itemSizes"].length > 0
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount:
                                    controller.ItemsById["itemSizes"].length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int i) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          tappedIndex = i;
                                          size =
                                              controller.ItemsById["itemSizes"]
                                                  [i]["itemSizeDescEn"];
                                          sizescelect =
                                              controller.ItemsById["itemSizes"]
                                                  [i]["itemSizeId"];
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          // shape: BoxShape.circle,

                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: tappedIndex == i
                                                ? Colors.black
                                                : Colors.grey,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            controller.ItemsById["itemSizes"][i]
                                                ["itemSizeDescEn"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                fontFamily: 'Almarai'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        )
                      : Container(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Row(
                      children: [
                        const Text("Comments",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'majallab',
                                fontSize: 24,
                                color: Colors.black)),
                        IconButton(
                            onPressed: () {
                              showRate(
                                  context, int.parse(widget.id.toString()));
                            },
                            icon: Icon(Icons.add_box))
                      ],
                    ),
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
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
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: passengers.length,
                            itemBuilder: (context, index) {
                              final passenger = passengers[index];
                              return ListTile(
                                  trailing: rating(passenger.rate),
                                  subtitle: Text(
                                    passenger.fullName.toString(),
                                  ),
                                  title: Text(
                                    passenger.rateText.toString(),
                                  ));
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomButton(
                int.parse(widget.id.toString()), sizescelect, colorselect)
          ],
        ));
  }

  Widget rating(num) {
    return RatingBar.builder(
      initialRating: double.parse(num.toString()),
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
      },
    );
  }

  Widget stars() {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star_rounded,
        color: Colors.amber,
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
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: controller.ItemsById["itemColors"].length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: InkWell(
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
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(int.parse(controller
                                .ItemsById["itemColors"][i]["value"]
                                .replaceAll("#", "0xff"))),
                            border: Border.all(
                              color: tappedIndexColor == i
                                  ? Colors.black
                                  : Colors.grey,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ))
        : Container();
  }

  Widget bottomButton(itemId, itemSizeId, itemColorId) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FlatButton(
                    color: Colors.black,
                    onPressed: () async {
                      print(itemId);
                      print(itemSizeId);
                      print(itemColorId);
                      if (itemSizeId != 0 && itemColorId != 0) {
                        await addCartApi(
                            context, itemId, itemSizeId, itemColorId);
                        await myCartApi();
                      } else if (itemSizeId == 0 && itemColorId != 0) {
                        diaFaildCart(context, "Choose Size");
                      } else if (itemSizeId != 0 && itemColorId == 0) {
                        diaFaildCart(context, "Choose Color");
                      } else if (itemSizeId == 0 && itemColorId == 0) {
                        diaFaildCart(context, "Choose Size & Color");
                      }
                    },
                    child: Text(
                      "Add to Bag +",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(r"$" + controller.ItemsById["newPrice"].toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 28)),
              )
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
