import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mylike/api/delete_like.dart';
import 'package:abood/model/user/mylike/api/mylike.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/drawer_main.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myLike extends StatefulWidget {
  myLike({Key? key}) : super(key: key);

  @override
  State<myLike> createState() => _myLikeState();
}

class _myLikeState extends State<myLike> {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  Homecontroller controller1 = Get.put(Homecontroller());

  var cc;
  var i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: text1("Favourite".tr),
      ),
      body: guest != true
          ? RefreshIndicator(
              onRefresh: () async {
                await myLikeApi(controller1.id);
              },
              child: GetBuilder<ControllerProduct>(builder: (controller) {
                return (controller.myFavorite.length > 0
                    ? Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 3 / 4.0,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemCount: controller.myFavorite.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () async {
                                      print(controller.myFavorite[index]
                                          ["itemId"]);
                                      await getItemsIdApi(controller
                                          .myFavorite[index]["itemId"]);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                particulerProduct(
                                                  id: controller
                                                          .myFavorite[index]
                                                      ["itemId"],
                                                )),
                                      );
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        //child: Text(myProducts[index]["name"]),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.2), //color of shadow
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                        decoration: box2(imageAds +
                                                            controller.myFavorite[
                                                                        index][
                                                                    "itemImages"]
                                                                [
                                                                0]["imageUrl"])),
                                                    Positioned(
                                                        left: 10,
                                                        top: 0.0,

                                                        // (background container size) - (circle height / 2)
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                              height: 35.0,
                                                              width: 35.0,
                                                              child: Center(
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    await deleteLike(
                                                                        controller1
                                                                            .id,
                                                                        controller.myFavorite[index]
                                                                            [
                                                                            "itemId"]);
                                                                    await myLikeApi(
                                                                        controller1
                                                                            .id);
                                                                    print(
                                                                        "delete");
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 30,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                  ],
                                                )),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                      // width: 50,
                                                      height: 30,
                                                      decoration: boxd2(),
                                                      child: Center(
                                                        child: textBot(controller
                                                                .myFavorite[
                                                                    index]
                                                                    ["newPrice"]
                                                                .toString() +
                                                            " JD \t "),
                                                      )),
                                                ),
                                                text3(
                                                  controller.myFavorite[index]
                                                          ["itemName"]
                                                      .toString(),
                                                ),
                                              ],
                                            )),
                                          ],
                                        )));
                              }),
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/empty.png"),
                            Text("You didn't add anything".tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Almarai')),
                            const SizedBox(
                              height: 20,
                            ),
                            ButtonRegister2(
                                Colors.black, Colors.white, "Browse Stores")
                          ],
                        ),
                      ));
              }),
            )
          : LoginGuest(),
    );
  }

  Widget ButtonRegister2(c2, c1, text) {
    return Container(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: c2,
            onPrimary: Colors.white,
            textStyle: TextStyle(color: c1)),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed("homePage");
        },
        child: Text(
          text,
          style: TextStyle(
              color: c1,
              fontSize: 15,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Text textBot(text) {
    return Text(text.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  BoxDecoration boxd2() {
    return BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(5), //border corner radius
    );
  }

  BoxDecoration box() {
    return BoxDecoration(
      color: Color.fromARGB(255, 193, 189, 189),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    );
  }

  BoxDecoration box2(img) {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(img.toString())));
  }
}
