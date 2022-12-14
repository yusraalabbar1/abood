import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/product/subCategory/subCatModel.dart';
import 'package:abood/model/user/product/subCategory/subCategoryApi.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/myCateg/storeByIdSection.dart';
import 'package:abood/view/user/other/myCateg/sub2cat.dart';
import 'package:abood/view/user/other/myHome/allHome.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category>
    with SingleTickerProviderStateMixin {
  Homecontroller controller = Get.put(Homecontroller());
  int _selectedIndex = 0;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  List<SubCatMobelData> passengers = [];
  int currentPage = 1;
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  int i = 0;
  var sub;
  int totalPages = 1;

  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (sub == null) {
      sub = controllerPro.saveAllCategwithout[0]["id"];
    } else {}

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
        http.Request('GET', Uri.parse(baseURL + '/api/section/sub/$sub'));

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    print(res.statusCode);
    print(res.body);
    if (response.statusCode == 200) {
      final result = SubCatMobelFromJson(res.body);
      if (isRefresh) {
        print("refreshhhhhhhhhhhhhhhhhhhhh");
        passengers = result.data!;
      } else {
        print("addAlllllllllllllllllll");
        passengers.addAll(result.data!);
      }

      currentPage++;

      print(res.body);
      setState(() {
        passengers = result.data!;
      });
      return true;
    } else {
      print("elseeeeeeeeeeeeeeeeeeeee");
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Color.fromARGB(255, 237, 235, 235),
                  height: MediaQuery.of(context).size.height,
                  child:
                      GetBuilder<ControllerProduct>(builder: (controllerPro) {
                    return (ListView.builder(
                      shrinkWrap: true,
                      // physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: controllerPro.saveAllCategwithout.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          onTap: () async {
                            controllerPro.saveSubCateg = [];
                            setState(() {
                              i = index;
                              SubCategories(controllerPro
                                  .saveAllCategwithout[index]["id"]);
                              setState(() {
                                sub = controllerPro.saveAllCategwithout[index]
                                    ["id"];
                                print(sub);
                              });
                            });
                            final result =
                                await getPassengerData(isRefresh: true);
                            if (result) {
                              refreshController.refreshCompleted();
                            } else {
                              refreshController.refreshFailed();
                            }
                          },
                          child: Container(
                            color: i == index
                                ? Colors.black
                                : Color.fromARGB(255, 237, 235, 235),
                            child: i == index
                                ? Center(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        controllerPro.language == "en"
                                            ? controllerPro
                                                .saveAllCategwithout[index]
                                                    ["descEn"]
                                                .toString()
                                            : controllerPro
                                                .saveAllCategwithout[index]
                                                    ["descAr"]
                                                .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'majallab'),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        controllerPro.language == "en"
                                            ? controllerPro
                                                .saveAllCategwithout[index]
                                                    ["descEn"]
                                                .toString()
                                            : controllerPro
                                                .saveAllCategwithout[index]
                                                    ["descAr"]
                                                .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'majallab'),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ));
                  }),
                ),
              ),
              Expanded(
                flex: 6,
                // height: MediaQuery.of(context).size.height - 214,
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
                    final result = await getPassengerData(isRefresh: true);
                    if (result) {
                      refreshController.loadComplete();
                    } else {
                      refreshController.loadFailed();
                    }
                  },
                  child:
                      GetBuilder<ControllerProduct>(builder: (controllerPro) {
                    return (GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2.5,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: passengers.length,
                        itemBuilder: (BuildContext ctx, index) {
                          final passenger = passengers[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () async {
                                print(
                                    "=====section id======++++++++++++++++++++++++");
                                print(passenger.sectionId);
                                controller.SavrIdSec(passenger.sectionId);
                                controller.SaveIdSubSec(passenger.id);
                                print(passenger.id);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => storeByIdSection(
                                        idSec: passenger.sectionId,
                                        idSub:
                                            int.parse(passenger.id.toString())),
                                  ),
                                );
                                // }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              //Untitled design (15).png
                                              image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          imageAds +
                                                              passenger.imageUrl
                                                                  .toString()),
                                                  fit: BoxFit.cover),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(
                                                      0.2), //color of shadow
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          alignment: Alignment.center,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                      text1(
                                        controllerPro.language == "en"
                                            ? passenger.descEn
                                            : passenger.descAr,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }));
                  }),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }
}
