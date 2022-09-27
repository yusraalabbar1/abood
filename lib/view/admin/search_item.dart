import 'dart:convert';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/admin/jsonModel/SearchModel.dart';
import 'package:abood/view/admin/add_offer.dart';
import 'package:abood/view/admin/delet_item.dart';
import 'package:abood/view/admin/edit_item.dart';
import 'package:abood/view/admin/picker_mu_image.dart';
import 'package:abood/view/user/other/drawer_main.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:http/http.dart' as http;

class searchProduct extends StatefulWidget {
  searchProduct({Key? key}) : super(key: key);

  @override
  State<searchProduct> createState() => _searchProductState();
}

class _searchProductState extends State<searchProduct> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  String searchWord = "";
  String t = "asc";
  var c;
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  /////////////////////////////////////
  int currentPage = 1;

  late int totalPages;

  List<DatumSearch> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      print("1===========================");
    } else {
      print("2===========================");
      if (currentPage > totalPages) {
        print("3========================");
        refreshController.loadNoData();
        return false;
      }
      print(currentPage);
    }
    ControllerProduct controllerPro = Get.put(ControllerProduct());

    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse(baseURL + '/api/items/searchItems'));
    request.body = json
        .encode({"LowPrice": 1.5, "HighPrice": 310.5, "ItemDesc": searchWord});
    request.headers.addAll(headers);

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = SearchModelFromJson(res.body);

      if (isRefresh) {
        passengers = result.data!;
      } else {
        passengers.addAll(result.data!);
      }

      currentPage++;

      totalPages = 1;

      print(res.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: SizedBox(
                    child: Form(
                        key: formstate,
                        child: GetBuilder<ControllerProduct>(
                            builder: (controller) {
                          return (TextFormField(
                            textInputAction: TextInputAction.next,
                            // keyboardType: TextInputType.,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () async {
                                    var formdata = formstate.currentState;
                                    if (formdata!.validate()) {
                                      formdata.save();
                                      print(searchWord);
                                      // Searchproduct(searchWord, t);
                                      setState(() {
                                        currentPage = 1;
                                        print(currentPage);
                                      });
                                      final result = await getPassengerData(
                                          isRefresh: true);
                                      if (result) {
                                        refreshController.refreshCompleted();
                                      } else {
                                        refreshController.refreshFailed();
                                      }
                                    } else {
                                      print("not validddddddddddddddd");
                                    }
                                  }),
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            onSaved: (string) {
                              searchWord = string!;
                              // controller.SavePassWord(string);
                            },
                            onFieldSubmitted: (value) async {
                              print(value);
                              var formdata = formstate.currentState;
                              if (formdata!.validate()) {
                                formdata.save();
                                print(searchWord);
                                // Searchproduct(searchWord, t);
                                setState(() {
                                  currentPage = 1;
                                  print(currentPage);
                                });
                                final result =
                                    await getPassengerData(isRefresh: true);
                                if (result) {
                                  refreshController.refreshCompleted();
                                } else {
                                  refreshController.refreshFailed();
                                }
                              } else {
                                print("not validddddddddddddddd");
                              }
                            },
                          ));
                        })),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: (Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: passengers.length,
                        itemBuilder: (BuildContext ctx, index) {
                          final passenger = passengers[index];
                          return InkWell(
                              onTap: () async {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => particulerProduct(
                                //           id: passenger.itemId)),
                                // );
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  //child: Text(myProducts[index]["name"]),
                                  decoration: boxd(),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Stack(
                                            children: [
                                              Container(
                                                  decoration:
                                                      box2(passenger.image)),
                                            ],
                                          )),
                                      Expanded(
                                          child: Column(
                                        children: [
                                          // ignore: avoid_unnecessary_containers
                                          Expanded(
                                            child: text3(
                                              passenger.itemName.toString(),
                                            ),
                                          ),
                                          // Expanded(
                                          //   child: Container(
                                          //     decoration: box(),
                                          //     child: Center(
                                          //       child: text2(
                                          //         passenger.price.toString() +
                                          //             " JOD \t ",
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      )),
                                    ],
                                  )));
                        }),
                  ),
                ))),
              ],
            )));
  }
}
