import 'package:abood/constant/urls.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:abood/model/user/stor/stor_item/stor_item_model.dart';
import 'package:abood/view/user/other/drawer_main.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  int i = 0;
  double account = 2.0;
  int currentPage = 0;

  late int totalPages;

  List<StorItemsData> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    print("=====store id======");
    // var c2 = int.parse(widget.id.toString());
    if (isRefresh) {
      currentPage = 0;
      print("1");
    } else {
      print("============================");
      print(totalPages);
      print("============================");
      if (currentPage > totalPages) {
        print("2");
        refreshController.loadNoData();
        return false;
      }
    }
    var request =
        http.Request('GET', Uri.parse(baseURL + '/api/items/newItems'));

    http.StreamedResponse response = await request.send();
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
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 5,
          backgroundColor: Colors.white,
          leading: Image.asset("assets/images/Untitled design (14).png"),
          title: Text(
            "New Products",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'majallab',
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
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
              SizedBox(
                height: 10,
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
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: account.round(),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: passengers.length,
                    itemBuilder: (context, index) {
                      final passenger = passengers[index];
                      return InkWell(
                          onTap: () async {
                            await getItemsIdApi(passenger.itemId);
                            // Navigator.of(context)
                            //     .pushNamed("particularProducte");
                            print(passenger.itemId);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    particulerProduct(id: passenger.itemId),
                              ),
                            );
                          },
                          child: Container(
                              alignment: Alignment.center,
                              //child: Text(myProducts[index]["name"]),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Stack(
                                        children: [
                                          Container(
                                              decoration:
                                                  passenger.itemImages!.length >
                                                          0
                                                      ? box2(passenger
                                                          .itemImages![0]
                                                          .imageUrl)
                                                      : box2(passenger.image)),
                                          Positioned(
                                              left: 10,
                                              top: 0.0,

                                              // (background container size) - (circle height / 2)
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.red[100],
                                                    child: Center(
                                                      child: IconButton(
                                                          icon: Icon(
                                                            Icons
                                                                .favorite_sharp,
                                                            color: i == 1
                                                                ? Colors.red
                                                                : Colors.white,
                                                            size: 20,
                                                          ),
                                                          onPressed: () async {
                                                            setState(() {
                                                              i = 1;
                                                            });
                                                          }),
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
                                                    passenger.newPrice))),
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
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(imageAds + img.toString())));
  }
}
