import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class contect extends StatefulWidget {
  const contect({super.key});

  @override
  State<contect> createState() => _contectState();
}

class _contectState extends State<contect> {
  Homecontroller controller = Get.put(Homecontroller());
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us".tr),
        toolbarHeight: 60,
      ),
      body: Column(
        children: [
          Center(
            child: Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.allSetting.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        index != 0
                            ? const Divider(
                                thickness: 1.5,
                              )
                            : Container(),
                        ListTile(
                            leading: IconButton(
                                onPressed: () async {
                                  if (controller.allSetting[index]["name"] ==
                                      "setting.whatsup") {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();

                                    var whatsappUrl =
                                        "whatsapp://send?phone=${controller.allSetting[index]["value"]}" +
                                            "&text=${Uri.encodeComponent(" ")}";
                                    try {
                                      launch(whatsappUrl);
                                    } catch (e) {
                                      print("Unable to open whatsapp");
                                    }
                                  } else if (controller.allSetting[index]
                                          ["isMedia"] ==
                                      true) {
                                    final Uri _url = Uri.parse(
                                        controller.allSetting[index]["value"]);
                                    if (!await launchUrl(_url)) {
                                      throw 'Could not launch $_url';
                                    }
                                  }
                                },
                                icon: const Icon(Icons.navigate_before)),
                            trailing: Text(
                              controllerPro.language == "en"
                                  ? controller.allSetting[index]
                                      ["displayNameEn"]
                                  : controller.allSetting[index]["displayName"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'majallab'),
                            )),
                      ],
                    );
                    // title: Text(controller.allSetting[index]["displayName"]));
                  }),
            ),
            //Text(controller.allSetting.toString()),
          ),
          const Divider(
            thickness: 1.5,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: text1("For Help, Contact Us".tr),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () async {
                              //To remove the keyboard when button is pressed
                              FocusManager.instance.primaryFocus?.unfocus();

                              var whatsappUrl =
                                  "whatsapp://send?phone=${controller.whats}" +
                                      "&text=${Uri.encodeComponent(" ")}";
                              try {
                                launch(whatsappUrl);
                              } catch (e) {
                                print("Unable to open whatsapp");
                              }
                            },
                            icon: const Icon(
                              Icons.whatsapp,
                              color: Colors.black,
                            )),
                        IconButton(
                            onPressed: () async {
                              final Uri _url = Uri.parse(controller.face);
                              if (!await launchUrl(_url)) {
                                throw 'Could not launch $_url';
                              }
                            },
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.black,
                            )),
                        IconButton(
                            onPressed: () async {
                              final Uri _url = Uri.parse(controller.site);
                              if (!await launchUrl(_url)) {
                                throw 'Could not launch $_url';
                              }
                            },
                            icon: const Icon(
                              Icons.web,
                              color: Colors.black,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }
}
