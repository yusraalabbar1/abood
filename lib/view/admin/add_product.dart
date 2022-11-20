import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/model/admin/api/add_item.dart';
import 'package:abood/view/admin/pick_color.dart';
import 'package:abood/view/admin/pick_size.dart';
import 'package:abood/view/admin/picker_mu_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatefulWidget {
  final id;
  const AddProduct({super.key, this.id});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
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

  Text appText2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  Text appText(text) {
    return Text(text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        // centerTitle: false,
        title: appText(" Add Product".tr),
      ),
      body: ListView(
        children: [
          Container(
            // margin: EdgeInsets.all(20),
            // height: 350,
            width: MediaQuery.of(context).size.width,
            // decoration: const BoxDecoration(
            //   color: Colors.black,
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            // ),
            child: Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // alignment: Alignment.center,
                    child: text1("Basic Information".tr),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Container(
                                decoration: boxd(),
                                child: TextFormFieldFirst())),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                                decoration: boxd(),
                                child: TextFormFieldLast())),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                        Container(decoration: boxd(), child: TextFormField1()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 0),
                    child:
                        Container(decoration: boxd(), child: TextFormField2()),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child:
                ButtonRegister1(Colors.black, Colors.white, "Continue".tr, 1),
          ),
        ],
      ),
    );
  }

  TextFormField TextFormFieldFirst() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Name Product".tr,
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can\'t enter bigest than ".tr + "40" + "characters".tr;
        }
        if (text.length < 1) {
          return "can\'t enter less than ".tr + "1" + "characters".tr;
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
        hintText: "Price".tr,
      ),
      validator: (text) {
        if (text!.length > 20) {
          return "can\'t enter bigest than " + "20" + "numbers".tr;
        }
        if (text.length < 1) {
          return "can\'t enter less than ".tr + "1" + "numbers".tr;
        }
        return null;
      },
      onSaved: (string) {
        priceItem = string;
        controller.SavepriceItem(string);
      },
    );
  }

  TextFormField TextFormField1() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Note".tr,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.note)),
      ),
      validator: (text) {
        if (text!.length > 100) {
          return "can\'t enter bigest than ".tr + "100" + "characters".tr;
        }
        if (text.length < 1) {
          return "can\'t enter less than ".tr + "1" + "characters".tr;
        }
        return null;
      },
      onSaved: (string) {
        noteItem = string;
        controller.SavenoteItem(string);
      },
    );
  }

  TextFormField TextFormField2() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        hintText: "Description".tr,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.description)),
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Color(0xffFAB10C) : Colors.black),
      ),
      validator: (text) {
        if (text!.length > 100) {
          return "can\'t enter bigest than ".tr + "100" + "characters".tr;
        }
        if (text.length < 1) {
          return "can\'t enter less than ".tr + "1" + "characters".tr;
        }
        return null;
      },
      onSaved: (string) {
        desItem = string;
        controller.SavedesItem(string);
      },
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
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
    return Text(text,
        style: const TextStyle(
            color: Colors.grey,
            fontSize: 21,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  Widget ButtonRegister1(c2, c1, text, x) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: c2,
            onPrimary: Colors.white,
            textStyle: TextStyle(color: c1)),
        onPressed: () {
          print('Button Clicked.');
          var formdata = formstate.currentState;
          if (formdata!.validate()) {
            formdata.save();
            print("=========valid==============");
            print(nameItem);
            print(priceItem);
            print(noteItem);
            print(desItem);
            print(myListMapColors);
            print(myListMapize);
            print("=======================");
            Navigator.of(context).pushNamed("picColor");

            print(widget.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    picColor(id: int.parse(widget.id.toString())),
              ),
            );
          } else {
            print("not validddddddddddddddd");
          }
        },
        child: Text(
          text,
          style: TextStyle(
              color: c1,
              fontSize: 18,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
