import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/api/check_coupon.dart';
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
                    return ListTile(
                        trailing: text2("Total: " +
                            controller.thirdMap[index][1].toString() +
                            "JD"),
                        title: Container(
                          decoration: boxd(),
                          child: TextFormField(
                            // keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: newTotal == null
                                  ? "Add Coupon Code" +
                                      controller.thirdMap[index][0].toString()
                                  : "Add Coupon Code" + newTotal.toString(),
                            ),
                            onFieldSubmitted: (Value) {
                              setState(() {
                                print(Value);
                                newTotal = checkCoponApi(
                                    context,
                                    Value,
                                    controller.thirdMap[index][0],
                                    controller.thirdMap[index][1]);
                                print("============newTotal==========");
                                print(newTotal);
                              });
                            },
                          ),
                        ));
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text2("New Price"),
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
      child: RaisedButton(
        onPressed: () {
          print('Button Clicked.');
          Navigator.of(context).pushNamed("CompletCart");
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Text(
          "Next",
          style: TextStyle(
              color: c1,
              fontSize: 21,
              fontFamily: 'majallab',
              fontWeight: FontWeight.bold),
        ),
        textColor: c1,
        splashColor: Colors.white,
        color: c2,
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
