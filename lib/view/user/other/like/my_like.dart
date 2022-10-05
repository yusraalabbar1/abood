import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mylike/api/delete_like.dart';
import 'package:abood/model/user/mylike/api/mylike.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:abood/view/user/other/particuler_product.dart';
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
      body: RefreshIndicator(
        onRefresh: () async {
          await myLikeApi(controller1.id);
        },
        child: GetBuilder<ControllerProduct>(builder: (controller) {
          return (controller.myFavorite.length > 0
              ? Container(
                  child: ListView.builder(
                      itemCount: controller.myFavorite.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  color: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: ListTile(
                                              leading: CircleAvatar(
                                                radius: 35,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                        imageAds +
                                                            controller.myFavorite[
                                                                        index][
                                                                    "itemImages"]
                                                                [
                                                                0]["imageUrl"]),
                                              ),
                                              subtitle: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          "price : ".tr +
                                                              controller
                                                                  .myFavorite[
                                                                      index][
                                                                      "newPrice"]
                                                                  .toString() +
                                                              " JOD \t ",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13,
                                                              fontFamily:
                                                                  'Almarai')),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              title: Container(
                                                  child: Text(
                                                      controller
                                                          .myFavorite[index]
                                                              ["itemName"]
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                          fontFamily:
                                                              'Almarai'))),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: const BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(15.0),
                                                  bottomLeft:
                                                      Radius.circular(15.0),
                                                  topRight:
                                                      Radius.circular(15.0),
                                                  bottomRight:
                                                      Radius.circular(15.0)),
                                            ),
                                            width: 40,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6,
                                            child: RotatedBox(
                                              quarterTurns: 0,
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child: IconButton(
                                                          onPressed: () async {
                                                            await deleteLike(
                                                                controller1.id,
                                                                controller.myFavorite[
                                                                        index]
                                                                    ["itemId"]);
                                                            await myLikeApi(
                                                                controller1.id);
                                                            print("delete");
                                                          },
                                                          icon: const Icon(
                                                            Icons.delete,
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                    Expanded(
                                                      child: IconButton(
                                                          onPressed: () async {
                                                            print(controller
                                                                    .myFavorite[
                                                                index]["itemId"]);
                                                            await getItemsIdApi(
                                                                controller.myFavorite[
                                                                        index]
                                                                    ["itemId"]);
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          particulerProduct(
                                                                            id: controller.myFavorite[index]["itemId"],
                                                                          )),
                                                            );
                                                          },
                                                          icon: Icon(
                                                            Icons.shopping_cart,
                                                            color: Colors.white,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        );
                      }),
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
      ),
    );
  }

  Widget ButtonRegister2(c2, c1, text) {
    return Container(
      width: 250,
      height: 50,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed("homePage");
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Text(
          text,
          style: TextStyle(
              color: c1,
              fontSize: 15,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold),
        ),
        textColor: c1,
        splashColor: Colors.white,
        color: c2,
      ),
    );
  }
}
