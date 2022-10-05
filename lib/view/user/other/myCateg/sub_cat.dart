import 'package:abood/constant/urls.dart';
import 'package:abood/model/user/product/subCategory/subCatModel.dart';
import 'package:abood/view/user/other/myCateg/storeByIdSection.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SubCat extends StatefulWidget {
  final id;
  const SubCat({super.key, this.id});

  @override
  State<SubCat> createState() => _SubCatState();
}

class _SubCatState extends State<SubCat> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  List<SubCatMobelData> passengers = [];
  int currentPage = 1;
  var sub;
  late int totalPages;
  Future<bool> getPassengerData({bool isRefresh = false}) async {
    var c1 = int.parse(widget.id.toString());
    if (isRefresh) {
      currentPage = 1;
      print("1===========================");
    } else {
      print("2===========================");
      print(currentPage);
      if (currentPage > totalPages) {
        print("3========================");
        refreshController.loadNoData();
        return false;
      }
    }

    var request =
        http.Request('GET', Uri.parse(baseURL + '/api/section/sub/$c1'));

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = SubCatMobelFromJson(res.body);
      if (isRefresh) {
        print("refreshhhhhhhhhhhhhhhhhhhhh");
        passengers = result.data!;
      } else {
        passengers.addAll(result.data!);
      }

      currentPage++;

      print(res.body);
      setState(() {
        passengers = result.data!;
      });
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 5,
        backgroundColor: Colors.white,
        leading: Image.asset("assets/images/Untitled design (14).png"),
        title: Text(
          "Sub Category".tr,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'majallab',
              fontSize: 25,
              fontWeight: FontWeight.bold),
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
          final result = await getPassengerData(isRefresh: true);
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child: GridView.builder(
            // shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: passengers.length,
            itemBuilder: (BuildContext ctx, index) {
              final passenger = passengers[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    print("=====section id======");
                    print(passenger.sectionId);
                    print(passenger.descAr);
                    print("=====sub section id======");
                    print(passenger.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => storeByIdSection(
                            id: passenger.id, idd: passenger.sectionId),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            //Untitled design (15).png
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //         "assets/images/Untitled design (15).png")),
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: text1(
                          passenger.descAr,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }
}
