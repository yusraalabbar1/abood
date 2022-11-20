import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/api/check_coupon.dart';
import 'package:abood/model/user/mycart/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCopon extends StatefulWidget {
  // final priceOld;
  const AddCopon({super.key});

  @override
  State<AddCopon> createState() => _AddCoponState();
}

class _AddCoponState extends State<AddCopon> {
  var newTotal;
  var copon = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Add Coupon"),
      ),
      body: GetBuilder<ControllerProduct>(builder: (controller) {
        return (Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.thirdMap.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    controller.language == "en"
                                        ? text2(controller.thirdMap[index][2]
                                            .toString())
                                        : text2(controller.thirdMap[index][3]
                                            .toString()),
                                    text2("Total: ".tr +
                                        controller.thirdMap[index][1]
                                            .toString() +
                                        "JD"),
                                  ],
                                ),
                              ),
                              ListTile(
                                  trailing: Container(
                                    decoration: boxd(),
                                    child: IconButton(
                                        onPressed: () {
                                          if (controller.thirdMap[index][4] !=
                                              1) {
                                            setState(() {
                                              newTotal = checkCoponApi(
                                                  context,
                                                  copon,
                                                  controller.thirdMap[index][0],
                                                  controller.thirdMap[index]
                                                      [1]);
                                              print(
                                                  "============newTotal==========");
                                              print(newTotal);
                                            });
                                          } else {
                                            diaFaildCart(
                                                context, "Using Coupon");
                                          }
                                        },
                                        icon: Icon(Icons.send)),
                                  ),
                                  title: Container(
                                    decoration: boxd(),
                                    child: TextFormField(
                                      // keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          hintText: "Add Coupon Code".tr),
                                      onChanged: (Value) {
                                        copon = Value;
                                      },
                                      onFieldSubmitted: (Value) {
                                        setState(() {
                                          print(Value);
                                          newTotal = checkCoponApi(
                                              context,
                                              Value,
                                              controller.thirdMap[index][0],
                                              controller.thirdMap[index][1]);
                                          print(
                                              "============newTotal==========");
                                          print(newTotal);
                                        });
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text2("New Price".tr),
                const SizedBox(
                  width: 20,
                ),
                text2(controller.total.toString()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ButtonRegister1(Colors.black, Colors.white),
            ),
          ],
        ));
      }),
    );
  }

  BoxDecoration boxd() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10), //border corner radius
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

  Widget ButtonRegister1(c2, c1) {
    return Container(
      width: 300,
      height: 53,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            backgroundColor: c2,
            onPrimary: Colors.white,
            textStyle: TextStyle(color: c1)),
        onPressed: () {
          print('Button Clicked.');
          Navigator.of(context).pushNamed("CompletCart");
        },
        child: Text(
          "Next".tr,
          style: TextStyle(
              color: c1,
              fontSize: 21,
              fontFamily: 'majallab',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Text text2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }
}
