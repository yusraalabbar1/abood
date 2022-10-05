import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/stor/stor_by_section_sub/stor_by_section_sub_model.dart';
import 'package:abood/model/user/stor/stor_by_userId_main_page/stor_by_userId_main_page_model.dart';
import 'package:abood/view/admin/allItemDelete.dart';
import 'package:abood/view/admin/allItemEdit.dart';
import 'package:abood/view/admin/all_item_offer.dart';
import 'package:abood/view/user/other/myCateg/sub2cat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StorByMerch extends StatefulWidget {
  final id;
  final typeOperation;
  const StorByMerch({super.key, this.id, this.typeOperation});

  @override
  State<StorByMerch> createState() => _StorByMerchState();
}

class _StorByMerchState extends State<StorByMerch> {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(controllerPro.saveStorUserId);
  }

  int currentPage = 0;

  late int totalPages;

  List<StorSectionData> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    print("============================");
    int idd = int.parse(widget.id.toString());
    print(idd);
    print("============================");
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
        http.Request('GET', Uri.parse(baseURL + '/api/store/users/$idd'));

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

      // totalPages = result.meta!.totalPages!;
      totalPages = 0;

      print(res.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  Text appText(text) {
    return Text(text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
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
            appText(" All Stors".tr),
          ],
        ),
      ),
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
              itemBuilder: (context, index) {
                final passenger = passengers[index];
                return InkWell(
                  onTap: () {
                    print(widget.typeOperation.toString());
                    if (widget.typeOperation.toString() == "deletePro") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllItemsStoreDelet(id: passenger.id),
                        ),
                      );
                    } else if (widget.typeOperation.toString() == "editPod") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllItemsStoreEdit(id: passenger.id),
                        ),
                      );
                    } else if (widget.typeOperation.toString() == "addOffer") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllItemsStoreoffer(id: passenger.id),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        // height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
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
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Almarai')),
                                subtitle: Text(passenger.info.toString(),
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 7, 66, 73),
                                        fontSize: 11,
                                        fontFamily: 'Almarai')),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: const RotatedBox(
                                quarterTurns: -1,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  bottomLeft: Radius.circular(4.0),
                                ),
                              ),
                              width: 40,
                              height: 80,
                            ),

                            //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }
}
