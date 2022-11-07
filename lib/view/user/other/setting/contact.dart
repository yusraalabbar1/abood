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
      body: Center(
        child: ListView.builder(
            itemCount: controller.allSetting.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: IconButton(
                      onPressed: () async {
                        if (controller.allSetting[index]["isMedia"] == true) {
                          final Uri _url =
                              Uri.parse(controller.allSetting[index]["value"]);
                          if (!await launchUrl(_url)) {
                            throw 'Could not launch $_url';
                          } else if (controller.allSetting[index]["name"] ==
                              "setting.whatsup") {
                            FocusManager.instance.primaryFocus?.unfocus();

                            var whatsappUrl =
                                "whatsapp://send?phone=${controller.allSetting[index]["value"]}" +
                                    "&text=${Uri.encodeComponent(" ")}";
                            try {
                              launch(whatsappUrl);
                            } catch (e) {
                              print("Unable to open whatsapp");
                            }
                          }
                        }
                      },
                      icon: const Icon(Icons.navigate_before)),
                  trailing: Text(
                    controllerPro.language == "en"
                        ? controller.allSetting[index]["displayNameEn"]
                        : controller.allSetting[index]["displayName"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ));
              // title: Text(controller.allSetting[index]["displayName"]));
            }),
        //Text(controller.allSetting.toString()),
      ),
    );
  }
}
