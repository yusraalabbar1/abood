import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/model/admin/api/add_item_offer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOffer extends StatefulWidget {
  final id;
  final text;
  final price;
  final isoffer;
  final image;
  const AddOffer(
      {super.key, this.id, this.text, this.price, this.isoffer, this.image});

  @override
  State<AddOffer> createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  bool _isObscure = true;
  var nameItem, priceItem, noteItem, desItem;
  ControllerAdmin controller = Get.put(ControllerAdmin());

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();

  Text text3(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  Text appText4(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            // fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  Text appText3(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            // fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  Text appText2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  Text appText(text) {
    return Text(text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 80,
          // centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [appText(" Add Offer".tr)],
          ),
        ),
        body: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        // shape: BoxShape.rectangle,

                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: widget.image.toString() != ""
                                ? CachedNetworkImageProvider(
                                    imageAds + widget.image.toString())
                                : CachedNetworkImageProvider(
                                    "https://www.drupal.org/files/project-images/Nothing.jpg"))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      thickness: 3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                // margin: EdgeInsets.symmetric(horizontal: 30),
                                child: appText4("Price:".tr)),
                            Container(
                                alignment: Alignment.topLeft,
                                // margin: EdgeInsets.symmetric(horizontal: 30),
                                child: text2(" " + widget.price.toString())),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                // margin: EdgeInsets.symmetric(horizontal: 30),
                                child: appText4("Name:".tr)),
                            Container(
                                alignment: Alignment.topLeft,
                                // margin: EdgeInsets.symmetric(horizontal: 30),
                                child: text2(widget.text))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      thickness: 3,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      // alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: appText4("Price:".tr)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                        decoration: boxd(), child: TextFormFieldLast()),
                  ),
                  Container(
                      // alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: appText4("Name offer:".tr)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                        decoration: boxd(), child: TextFormFieldFirst()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: ButtonRegister2(Colors.black, Colors.white,
                          "Add Offer".tr, widget.id),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            widget.isoffer == false
                ? Center(child: appText4("There is no previous offer".tr))
                : Container(),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  BoxDecoration box2(img) {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        image: DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(
            // "https://cdn11.bigcommerce.com/s-9p889rxpkb/product_images/uploaded_images/15-ygt-690x480-min-resize.jpg"
            imageAds + img.toString())));
  }

  TextFormField TextFormFieldFirst() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Name offer".tr,
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 1) {
          return "can not enter less than 1";
        }
        return null;
      },
      onSaved: (string) {
        nameItem = string;
        controller.SavenameItem(string);
      },
    );
  }

  TextFormField TextFormFieldLast() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "New Price".tr,
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 1) {
          return "can not enter less than 1";
        }
        return null;
      },
      onSaved: (string) {
        priceItem = string;
        controller.SavepriceItem(string);
      },
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
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

  Text text2(text) {
    return Text(text.toString(),
        style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  Widget ButtonRegister2(c2, c1, text, x) {
    return Container(
      width: 250,
      height: 65,
      child: ElevatedButton(
        onPressed: () {
          print('Button Clicked.');
          var formdata = formstate.currentState;
          if (formdata!.validate()) {
            formdata.save();
            print("=========valid==============");
            print(nameItem);
            print(priceItem);
            print("=======================");
            addItemRate(context, widget.id, priceItem, nameItem);
          } else {
            print("not validddddddddddddddd");
          }
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: c2,
            onPrimary: Colors.white,
            textStyle: TextStyle(color: c1)),
        child: Text(
          text,
          style: TextStyle(
              color: c1,
              fontSize: 15,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold),
        ),
        // textColor: c1,
        // splashColor: Colors.white,
        // color: c2,
      ),
    );
  }

  // Widget ButtonRegister2(c2, c1, text, x) {
  //   return Container(
  //     width: 118,
  //     height: 53,
  //     child: RaisedButton(
  //       onPressed: () {
  //         print('Button Clicked.');
  //         // Navigator.of(context).pushNamed("otpSignup");
  //         // if (x == 1) {
  //         //   var formdata = formstate.currentState;
  //         //   if (formdata!.validate()) {
  //         //     formdata.save();
  //         //     print(" validddddddddddddddd");
  //         //     Navigator.of(context).pushNamed("otpSignup");
  //         //   } else {
  //         //     print("not validddddddddddddddd");
  //         //   }
  //         // } else {}
  //       },
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(25.0))),
  //       child: Text(
  //         text,
  //         style: TextStyle(
  //             color: c1,
  //             fontSize: 18,
  //             fontFamily: 'majallab',
  //             fontWeight: FontWeight.bold),
  //       ),
  //       textColor: c1,
  //       splashColor: Colors.white,
  //       color: c2,
  //     ),
  //   );
  // }
}
