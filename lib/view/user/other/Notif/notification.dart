import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/model/user/notification/notification_model.dart';
import 'package:abood/model/user/notification/notification_user.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/myCateg/sub2cat.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class notification extends StatefulWidget {
  notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  // int page = 1;
  int currentPage = 1;

  late int totalPages;
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  @override
  void initState() {
    super.initState();
    notificationApiUserUpdate();
  }

  List<DatumNotification> passengers = [];
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////
  Future<bool> getPassengerData({bool isRefresh = false}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? deviceId = preferences.getString("deviceId");
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
        Uri.parse(
            'https://friendly-proskuriakova.162-55-191-66.plesk.page/AboodAPI/api/notification/GetNotification?deviceId=$deviceId'));

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = NotificationModelFromJson(res.body);

      if (isRefresh) {
        passengers = result.data!;
      } else {
        passengers.addAll(result.data!);
      }
      print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      print(passengers);
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
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: text1("Notifications".tr),
        ),
        body: guest != true
            ? SmartRefresher(
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
                child: (ListView.builder(
                    shrinkWrap: true,
                    itemCount: passengers.length,
                    itemBuilder: (context, index) {
                      final passenger = passengers[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 2, bottom: 2),
                        child: ClipRRect(
                          child: InkWell(
                            onTap: () async {
                              if (passenger.target == "URL") {
                                final Uri _url =
                                    Uri.parse(passenger.value.toString());
                                if (!await launchUrl(_url)) {
                                  throw 'Could not launch $_url';
                                }
                              } else if (passenger.target == "STORE") {
                                guest != true
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Sub2cat(
                                              id: int.parse(
                                                  passenger.value.toString())),
                                        ),
                                      )
                                    : diaGuest(context);
                              } else if (passenger.target == "ITEM") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => particulerProduct(
                                        id: int.parse(
                                            passenger.value.toString())),
                                  ),
                                );
                              }
                            },
                            child: Card(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: passenger.notificationImage ==
                                                null
                                            ? const Icon(
                                                Icons.notifications,
                                                size: 30,
                                              )
                                            : CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: imageAds +
                                                    passenger.notificationImage,
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

                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(passenger.title.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Almarai')),
                                      subtitle: Text(passenger.body.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 7, 66, 73),
                                              fontSize: 11,
                                              fontFamily: 'Almarai')),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 100,
                                    child: Center(
                                      child: RotatedBox(
                                        quarterTurns: -1,
                                        child: Text(
                                            passenger.date
                                                .toString()
                                                .substring(0, 11),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                                fontFamily: 'Almarai')),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.rectangle,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        bottomLeft: Radius.circular(4.0),
                                      ),
                                    ),
                                    width: 40,
                                  ),

                                  //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
              )
            : LoginGuest());
  }
}
