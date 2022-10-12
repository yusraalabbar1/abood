import 'package:abood/constant/urls.dart';
import 'package:abood/model/user/stor/stor_by_section_sub/stor_by_section_sub_model.dart';
import 'package:abood/view/user/other/myCateg/sub2cat.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class storeByIdSection extends StatefulWidget {
  final id;
  final idd;
  const storeByIdSection({super.key, this.id, this.idd});

  @override
  State<storeByIdSection> createState() => _storeByIdSectionState();
}

class _storeByIdSectionState extends State<storeByIdSection> {
  int currentPage = 0;

  late int totalPages;

  List<StorSectionData> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    print("=====sub section id======");
    var c1, c2;
    print(widget.id);
    print("===== section id======");

    print(widget.idd);
    if (widget.idd == null) {
      c1 = 0;
    } else {
      c1 = int.parse(widget.idd.toString());
    }
    if (widget.idd == null) {
      c2 = 0;
    } else {
      var c2 = int.parse(widget.id.toString());
    }

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
            '/api/store/sectionId/$c1/subsectionId/$c2/pageIndex/$currentPage'));

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 5,
        // shadowColor: Colors.pink,
        title: Text(
          "Store".tr,
          style: TextStyle(color: Colors.white),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sub2cat(id: passenger.id),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 5,
                    child: Container(
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

                          //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

// imageAds + passenger.image.toString()
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }
}
