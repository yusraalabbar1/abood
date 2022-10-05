import 'package:abood/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class notificationStore extends StatefulWidget {
  notificationStore({Key? key}) : super(key: key);

  @override
  State<notificationStore> createState() => _notificationStoreState();
}

class _notificationStoreState extends State<notificationStore> {
  // int page = 1;
  int currentPage = 1;

  late int totalPages;
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: text1("Notifications".tr),
        ),
        body: Column(
          children: [
            Expanded(
              child: (ListView.builder(
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    // final passenger = passengers[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 2, bottom: 2),
                      child: ClipRRect(
                        child: Card(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      ("https://us.123rf.com/450wm/llesia/llesia2110/llesia211000042/176329767-notification-bell-icon-3d-render-yellow-ringing-bell-with-new-notification-for-social-media-reminder.jpg?ver=6"),
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
                                  title: Text("Name Product",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Almarai')),
                                  subtitle: Text("Details  Notification",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 7, 66, 73),
                                          fontSize: 11,
                                          fontFamily: 'Almarai')),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Text("20/11/2022",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          fontFamily: 'Almarai')),
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
                                height: 80,
                              ),

                              //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            )
          ],
        ));
  }
}
