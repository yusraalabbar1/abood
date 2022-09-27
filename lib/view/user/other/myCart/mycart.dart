import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/api/cart_qty.dart';
import 'package:abood/model/user/mycart/api/delet_cart.dart';
import 'package:abood/model/user/mycart/api/my_cart.dart';
import 'package:abood/model/user/mylike/api/delete_like.dart';
import 'package:abood/model/user/mylike/api/mylike.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCart extends StatefulWidget {
  MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
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
        title: text1("My Cart"),
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            await myCartApi();
          },
          child: Column(
            children: [
              ListTile(
                title: const Text("Estimated delivery time is 3 days"),
                subtitle: const Text("Cannot be returned or exchanged"),
                leading: Image.asset("assets/images/shipped.png"),
              ),
              Divider(
                thickness: 3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: GetBuilder<ControllerProduct>(builder: (controller) {
                  return (controller.myCart.length > 0
                      ? Container(
                          child: ListView.builder(
                              itemCount: controller.myCart.length,
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
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: ListTile(
                                                  leading: CircleAvatar(
                                                    radius: 35,
                                                    backgroundImage:
                                                        CachedNetworkImageProvider(imageAds +
                                                            controller.myCart[
                                                                        index][
                                                                    "itemImages"]
                                                                [
                                                                0]["imageUrl"]),
                                                  ),
                                                  subtitle: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                              child: textWidget(
                                                                  controller.myCart[
                                                                          index]
                                                                      [
                                                                      "info"])),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      counter(
                                                          controller
                                                                  .myCart[index]
                                                              ["id"],
                                                          controller
                                                                  .myCart[index]
                                                              ["qty"]),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          textWidget("price : "
                                                                  .tr +
                                                              (controller.myCart[
                                                                              index]
                                                                          [
                                                                          "newPrice"] *
                                                                      controller
                                                                              .myCart[index]
                                                                          [
                                                                          "qty"])
                                                                  .toString() +
                                                              " JOD \t ")
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  title: Container(
                                                      child: textWidget(
                                                          controller
                                                                  .myCart[index]
                                                              ["itemName"])),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    decoration: boxdeco(),
                                                    width: 40,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            6,
                                                    child: sideWidget(controller
                                                        .myCart[index]["id"])),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                );
                              }),
                        )
                      : nothingWidget());
                }),
              ),
              bottomButton()
            ],
          )),
    );
  }

  Widget counter(cartId, quent) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: 40,
          decoration: boxd(),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      await qtyCartApi(cartId, quent + 1);
                      await myCartApi();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    )),
                text1(quent.toString()),
                IconButton(
                    onPressed: () async {
                      if (quent > 1) {
                        await qtyCartApi(cartId, quent - 1);
                        await myCartApi();
                      }
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration boxd() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30), //border corner radius
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2), //color of shadow
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  textWidget(text) {
    return Text(text.toString(),
        style: const TextStyle(
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            fontFamily: 'Almarai'));
  }

  BoxDecoration boxdeco() {
    return const BoxDecoration(
      color: Colors.black,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0)),
    );
  }

  Widget bottomButton() {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FlatButton(
                    color: Colors.black,
                    onPressed: () async {},
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    )),
              ),
              FlatButton(
                  color: Colors.black,
                  onPressed: () async {},
                  child: Text(
                    "Add coupon ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GetBuilder<ControllerProduct>(builder: (controller) {
                    return (Text(r"JD" + controllerPro.total.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20)));
                  }))
            ],
          ),
        ),
      ),
    );
  }

  Widget sideWidget(idCart) {
    return RotatedBox(
      quarterTurns: 0,
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: IconButton(
                  onPressed: () async {
                    await deleteCartApi(context, idCart);
                    await myCartApi();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  )),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () async {},
                  icon: const Icon(
                    Icons.check_box,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget nothingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/empty.png"),
          const Text("لم تضف أي شيئ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Almarai')),
          const SizedBox(
            height: 20,
          ),
          ButtonRegister2(Colors.black, Colors.white, "تصفح المتاجر")
        ],
      ),
    );
  }

  Widget ButtonRegister2(c2, c1, text) {
    return Container(
      width: 250,
      height: 50,
      child: RaisedButton(
        onPressed: () {},
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
