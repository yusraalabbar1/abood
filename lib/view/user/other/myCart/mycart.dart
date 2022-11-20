import 'package:abood/constant/colors.dart';
import 'package:abood/constant/urls.dart';
import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/api/cart_qty.dart';
import 'package:abood/model/user/mycart/api/check_coupon.dart';
import 'package:abood/model/user/mycart/api/delet_cart.dart';
import 'package:abood/model/user/mycart/api/my_cart.dart';
import 'package:abood/model/user/mycart/api/update_check.dart';
import 'package:abood/model/user/mylike/api/delete_like.dart';
import 'package:abood/model/user/mylike/api/mylike.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/myCart/add_copon.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
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
  // var newTotal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: text1("My Cart".tr),
      ),
      body: guest != true
          ? RefreshIndicator(
              onRefresh: () async {
                await myCartApi();
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text("Estimated delivery time is 3 days".tr),
                    subtitle: Text("Cannot be returned or exchanged".tr),
                    leading: Image.asset("assets/images/shipped.png"),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  textWidget("Please select The Products To Order".tr),
                  Divider(
                    thickness: 3,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: GetBuilder<ControllerProduct>(builder: (controller) {
                      return (controller.myCart.length > 0
                          ? ListView.builder(
                              itemCount: controller.myCart.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Card(
                                          color: index % 2 != 0
                                              ? Colors.white
                                              : Color.fromARGB(
                                                  255, 244, 239, 239),
                                          // elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 244, 239, 239),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: index % 2 != 0
                                                  ? Colors.white
                                                  : Color.fromARGB(
                                                      255, 244, 239, 239),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(15.0),
                                                      bottomLeft:
                                                          Radius.circular(15.0),
                                                      topRight:
                                                          Radius.circular(15.0),
                                                      bottomRight:
                                                          Radius.circular(
                                                              15.0)),
                                            ),
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    color: Colors.transparent,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: (imageAds +
                                                              controller.myCart[
                                                                          index]
                                                                      [
                                                                      "itemImages"]
                                                                  [
                                                                  0]["imageUrl"]),
                                                          fit: BoxFit.cover,
                                                          height: 100,
                                                          width: 90,
                                                        )),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Center(
                                                    child: Container(
                                                      color: index % 2 != 0
                                                          ? Colors.white
                                                          : Color.fromARGB(255,
                                                              244, 239, 239),
                                                      child: ListTile(
                                                        subtitle: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            counter(
                                                                controller.myCart[
                                                                        index]
                                                                    ["id"],
                                                                controller.myCart[
                                                                        index]
                                                                    ["qty"],
                                                                controller.myCart[
                                                                            index]
                                                                        [
                                                                        "itemColors"]
                                                                    ["qty"]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                textWidget("Price:"
                                                                        .tr +
                                                                    (controller.myCart[index]["newPrice"] *
                                                                            controller.myCart[index]["qty"])
                                                                        .toString() +
                                                                    " JOD \t ")
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        title: Container(
                                                            child: textWidget(
                                                                controller.myCart[
                                                                        index][
                                                                    "itemName"])),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      decoration:
                                                          boxdeco(index),
                                                      width: 40,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              6,
                                                      child: sideWidget(
                                                          controller
                                                                  .myCart[index]
                                                              ["id"],
                                                          controller
                                                                  .myCart[index]
                                                              ["isCheck"])),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                );
                              })
                          : nothingWidget());
                    }),
                  ),
                  // bottomButtoncuopon(),
                  bottomButton()
                ],
              ))
          : LoginGuest(),
    );
  }

  Widget counter(cartId, quent, total) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          height: 30,
          decoration: boxd(),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      print(total);
                      print(quent);
                      if (quent == total) {
                        Get.snackbar(
                          "Note".tr,
                          "Only Quantity available ".tr + "$total",
                          // icon: Icon(Icons.attachment, color: Colors.white),
                          colorText: Colors.white, isDismissible: true,
                          borderRadius: 10.0,
                          backgroundColor:
                              Color.fromARGB(255, 44, 43, 43).withOpacity(0.4),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else {
                        await qtyCartApi(cartId, quent + 1);
                        await myCartApi();
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 15,
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
                      size: 15,
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

  BoxDecoration boxdeco(index) {
    return BoxDecoration(
      color: index % 2 != 0 ? Colors.white : Color.fromARGB(255, 244, 239, 239),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0)),
    );
  }

/*
  Widget bottomButtoncuopon() {
    return Expanded(
      child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: GetBuilder<ControllerProduct>(builder: (controller) {
            return (Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controllerPro.thirdMap.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            trailing: Text(
                              "Total: " +
                                  controllerPro.thirdMap[index][1].toString() +
                                  "JD",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            title: TextFormField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: newTotal == null
                                    ? "Add Coupon Code" +
                                        controller.thirdMap[index][0].toString()
                                    : "Add Coupon Code" + newTotal.toString(),
                              ),
                              onFieldSubmitted: (Value) {
                                setState(() {
                                  newTotal = checkCoponApi(
                                      context,
                                      Value,
                                      controller.thirdMap[index][0],
                                      controller.thirdMap[index][1]);
                                  print("============newTotal==========");
                                  print(newTotal);
                                });
                              },
                            ));
                      }),
                ),
                // Text("data")
              ],
            ));
          })),
    );
  }
*/
  Text text2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  Widget bottomButton() {
    List<Map<String, dynamic>> store = [];
    return guest != true
        ? Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(right: 20, bottom: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () async {
                            Navigator.of(context).pushNamed("CompletCart");
                          },
                          child: text2("Continue".tr)),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          Navigator.of(context).pushNamed("AddCopon");
                        },
                        child: text2("Add Coupon".tr)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GetBuilder<ControllerProduct>(
                            builder: (controller) {
                          return (Text(r"JD" + controllerPro.total.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20)));
                        }))
                  ],
                ),
              ),
            ),
          )
        : Container();
  }

  Widget sideWidget(idCart, isCheck) {
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
                    color: Colors.black,
                  )),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () async {
                    if (isCheck == false) {
                      await checkApi(idCart, true);
                      await myCartApi();
                    } else {
                      await checkApi(idCart, false);
                      await myCartApi();
                    }
                  },
                  icon: isCheck == true
                      ? const Icon(
                          Icons.check_box,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.black,
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
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/giphy (1).gif",
            width: 300,
            height: 300,
          ),
          Text("You didn't add anything".tr,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Nunito')),
          const SizedBox(
            height: 20,
          ),
          ButtonRegister2(Colors.black, Colors.white, "Browse Stores".tr)
        ],
      ),
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
}
