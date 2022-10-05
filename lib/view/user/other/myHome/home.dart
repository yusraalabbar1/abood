import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/product/subCategory/subCatModel.dart';
import 'package:abood/model/user/product/subCategory/subCategoryApi.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/myCateg/storeByIdSection.dart';
import 'package:abood/view/user/other/myCateg/sub2cat.dart';
import 'package:abood/view/user/other/myHome/allHome.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  Future<bool> _onwillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Color.fromARGB(255, 7, 44, 48),
            title: Text("Exit the App".tr,
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
            content: Text("Are you sure to get out??".tr,
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: MyColors.color1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: MyColors.color1, width: 2)),
                    child: Text("Yes".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Almarai')),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                    color: Color.fromARGB(255, 231, 38, 64),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                            color: Color.fromARGB(255, 231, 38, 64), width: 2)),
                    child: Text("No".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Almarai')),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              )
            ],
          ),
        )) ??
        false;
  }

  List<SubCatMobelData> passengers = [];
  int currentPage = 1;
  var sub;
  late int totalPages;

  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
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
  void initState() {
    super.initState();
  }

  ControllerProduct controllerPro = Get.put(ControllerProduct());
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onwillPop,
      child: Scaffold(
          body: ListView(
        children: [
          Container(
            height: 50,
            child: GetBuilder<ControllerProduct>(builder: (controllerPro) {
              return (ListView.builder(
                shrinkWrap: true,
                // physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: controllerPro.saveAllCateg.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      controllerPro.saveSubCateg = [];
                      setState(() {
                        i = index;
                        SubCategories(controllerPro.saveAllCateg[index]["id"]);
                        setState(() {
                          sub = controllerPro.saveAllCateg[index]["id"];
                          print(sub);
                        });
                      });
                      final result = await getPassengerData(isRefresh: true);
                      if (result) {
                        refreshController.refreshCompleted();
                      } else {
                        refreshController.refreshFailed();
                      }
                    },
                    child: Center(
                      child: Chip(
                        // elevation: 20,
                        padding: EdgeInsets.all(8),
                        backgroundColor:
                            i == index ? Colors.black : MyColors.color3,
                        shadowColor: Colors.black,

                        label: i == index
                            ? Text(
                                controllerPro.saveAllCateg[index]["descAr"]
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'majallab'),
                              )
                            : Text(
                                controllerPro.saveAllCateg[index]["descAr"]
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'majallab'),
                              ), //Text
                      ),
                    ),
                  ),
                ),
              ));
            }),
          ),
          i == 0
              ? AllHome()
              : SizedBox(
                  height: MediaQuery.of(context).size.height - 214,
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
                    child: GridView.builder(
                        // shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
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
                                if (guest == true) {
                                  diaGuest(context);
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => storeByIdSection(
                                          id: passenger.id,
                                          idd: passenger.sectionId),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
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
                                            Radius.circular(15))),
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
                )
          /*GetBuilder<ControllerProduct>(builder: (controllerPro) {
                  return (Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 214,
                      child: GridView.builder(
                          // shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: controllerPro.saveSubCateg.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => storeByIdSection(
                                        id: controllerPro.saveSubCateg[index]
                                            ["id"]),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: text1(
                                      controllerPro.saveSubCateg[index]
                                          ["descAr"],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ));
                })*/
        ],
      )),
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }
}
