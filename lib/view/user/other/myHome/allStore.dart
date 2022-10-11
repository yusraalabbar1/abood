import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/stor/stor_by_section_sub/stor_by_section_sub_model.dart';
import 'package:abood/model/user/stor/stor_by_userId_main_page/stor_by_userId_main_page_model.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/myCateg/sub2cat.dart';
import 'package:abood/view/user/other/myHome/items_store.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class allStore extends StatefulWidget {
  const allStore({super.key});

  @override
  State<allStore> createState() => _allStoreState();
}

class _allStoreState extends State<allStore> {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(controllerPro.saveStorUserId);
  }

  late int totalPages;

  int currentPage = 0;
  List<StorSectionData> passengers = [];
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////
  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
    } else {
      print(totalPages);
      if (currentPage > totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    var request = http.Request(
        'GET',
        Uri.parse(baseURL +
            '/api/store/sectionId/0/subsectionId/0/pageIndex/$currentPage'));

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = StorSectionFromJson(res.body);

      if (isRefresh) {
        passengers = result.data!;
      } else {
        passengers.addAll(result.data!);
      }
      currentPage++;
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
    return SizedBox(
      // height: MediaQuery.of(context).size.height / 5,
      child: GetBuilder<ControllerProduct>(builder: (controller) {
        return SmartRefresher(
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
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final passenger = passengers[index];
                return InkWell(
                  onTap: () {
                    // if (guest == true) {
                    //   diaGuest(context);
                    // } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sub2cat(id: passenger.id),
                      ),
                    );
                    // }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Container(
                        color: Colors.white,
                        height: 120,
                        child: Container(
                          // padding: EdgeInsets.all(10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                    (imageAds + passenger.image.toString()),
                                fit: BoxFit.cover,
                              )),
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4.0),
                              bottomRight: Radius.circular(4.0),
                            ),
                          ),
                          width: MediaQuery.of(context).size.height / 6,
                          // height: 73,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      }),
    );
  }

//  Card(
//                       semanticContainer: true,
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       child: CachedNetworkImage(
//                         imageUrl: (imageAds + passenger.image.toString()),
//                         fit: BoxFit.cover,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       elevation: 5,
//                       margin: EdgeInsets.all(10),
//                     ),
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }
  /*
 Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Container(
                        color: Colors.white,
                        // height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        (imageAds + passenger.image.toString()),
                                    fit: BoxFit.cover,
                                  )),
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4.0),
                                  bottomRight: Radius.circular(4.0),
                                ),
                              ),
                              width: 70,
                              height: 73,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ListTile(
                                title: Text(passenger.descEn.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Almarai')),
                                subtitle: Text(passenger.info.toString(),
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 7, 66, 73),
                                        fontSize: 11,
                                        fontFamily: 'Almarai')),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.navigate_next),
                              width: 40,
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ),

  */
}
