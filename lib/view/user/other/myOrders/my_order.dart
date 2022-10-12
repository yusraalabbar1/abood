import 'package:abood/constant/urls.dart';
import 'package:abood/model/user/myOrder/order_model.dart';
import 'package:abood/view/user/other/myOrders/details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class myOrders extends StatefulWidget {
  const myOrders({super.key});

  @override
  State<myOrders> createState() => _myOrdersState();
}

class _myOrdersState extends State<myOrders> {
  int currentPage = 0;

  late int totalPages;
  var i = 0;
  List<DatumOrders> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
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
    var request = http.Request(
        'GET',
        Uri.parse(baseURL +
            '/api/userRequest/getByUserId/22/pageIndex/$currentPage'));

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = orderFromJson(res.body);

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
      body: SmartRefresher(
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
        child: ListView.builder(
            itemCount: passengers.length,
            itemBuilder: (BuildContext context, int index) {
              final passenger = passengers[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            rowInfo("Order No: ".tr, passenger.id.toString()),
                            rowInfoStatus(
                                "Status: ".tr,
                                passenger.statusDesc.toString(),
                                passenger.statusId),
                          ],
                        ),
                        rowInfo("Date & Time: ".tr,
                            passenger.requestDate.toString()),
                        rowInfo("Total Price: ".tr, passenger.total.toString()),
                        SizedBox(
                          height: 130,
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: passenger.details!.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      return Row(
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            imageAds +
                                                                passenger
                                                                    .details![i]
                                                                    .images![0]
                                                                    .imageUrl
                                                                    .toString()),
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          )
                                        ],
                                      );
                                    }),
                              ),
                              rowInfo("Products No: ".tr,
                                  passenger.details!.length.toString()),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 3,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (i == 0) {
                                i = passenger.id!;
                              } else {
                                i = 0;
                              }
                            });
                          },
                          child: i != passenger.id
                              ? rowLink("Order Details".tr)
                              : rowLinkdeta(
                                  "Order Details".tr,
                                  passenger.fullName,
                                  passenger.mobileNo,
                                  passenger.area,
                                  passenger.streetName,
                                  passenger.buildingNo,
                                  passenger.total,
                                  passenger.discount,
                                  passenger.statusDesc),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  rowLink(text1) {
    return Row(
      children: [
        Text(text1,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'majallab')),
        const Icon(Icons.navigate_next)
      ],
    );
  }

  rowLinkdeta(text1, fullName, mobileNo, area, streetName, buildingNo, total,
      discount, statusDesc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [Textst(text1), const Icon(Icons.navigate_before)],
        ),
        Row(
          children: [
            const Icon(
              Icons.person,
              size: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Textst1(fullName),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              size: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Textst1(mobileNo),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on,
              size: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Textst1("Address: ".tr),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Textst1("$area \t $streetName \t $buildingNo \t "),
        )
      ],
    );
  }

  Textst(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  Textst1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  rowInfoStatus(text1, text2, id) {
    return Row(
      children: [
        Text(text1,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'majallab')),
        id == 1
            ? Text(text2,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'majallab',
                    color: Colors.green))
            : Text(text2,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'majallab',
                    color: Colors.orange))
      ],
    );
  }

  rowInfo(text1, text2) {
    return Row(
      children: [
        Text(text1,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'majallab')),
        Text(text2,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'majallab'))
      ],
    );
  }
}
