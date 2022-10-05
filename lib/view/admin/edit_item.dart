import 'package:flutter/material.dart';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/admin/api/deletItemApi.dart';
import 'package:abood/model/admin/api/editItem.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItem extends StatefulWidget {
  final id;
  const EditItem({super.key, this.id});

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  var nameItem, priceItem, noteItem, desItem;
  ControllerAdmin controller = Get.put(ControllerAdmin());

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();

  Text text3(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText("Edit Product".tr),
            appText2("Basic operation".tr)
          ],
        ),
      ),
      body: FutureBuilder(
        future: getItemsIdApi(widget.id),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData != null
              ? ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                        key: formstate,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: appText2("Name Product:".tr)),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20, top: 0),
                                child: Container(
                                    decoration: boxd(),
                                    child: TextFormFieldFirst(
                                        controllerPro.ItemsById["itemName"]))),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: appText2("Price:".tr)),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20, top: 0),
                                child: Container(
                                    decoration: boxd(),
                                    child: TextFormFieldLast(
                                        controllerPro.ItemsById["price"]))),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: appText2("Extra Text:".tr)),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 0),
                              child: Container(
                                  decoration: boxd(),
                                  child: TextFormField1(
                                      controllerPro.ItemsById["extraText"])),
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: appText2("Description:".tr)),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 0),
                              child: Container(
                                  decoration: boxd(),
                                  child: TextFormField2(controllerPro
                                      .ItemsById["itemDescription"])),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ButtonRegister1(
                          Colors.black,
                          Colors.white,
                          "Edit Info".tr,
                          1,
                          controllerPro.ItemsById["itemName"],
                          controllerPro.ItemsById["price"],
                          controllerPro.ItemsById["extraText"],
                          controllerPro.ItemsById["itemDescription"]),
                    ),
                  ],
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }

  TextFormField TextFormFieldFirst(text) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: text,
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }

        return null;
      },
      onSaved: (string) {
        nameItem = string;
        // controller.SavenameItem(string);
      },
    );
  }

  TextFormField TextFormFieldLast(text) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: text.toString(),
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }

        return null;
      },
      onSaved: (string) {
        priceItem = string;
        // controller.SavepriceItem(string);
      },
    );
  }

  TextFormField TextFormField1(text) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.note)),
      ),
      validator: (text) {
        if (text!.length > 100) {
          return "can not enter bigest than 100";
        }

        return null;
      },
      onSaved: (string) {
        noteItem = string;
        // controller.SavenoteItem(string);
      },
    );
  }

  TextFormField TextFormField2(text) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.description)),
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Color(0xffFAB10C) : Colors.black),
      ),
      validator: (text) {
        if (text!.length > 100) {
          return "can not enter bigest than 100";
        }

        return null;
      },
      onSaved: (string) {
        desItem = string;
        // controller.SavedesItem(string);
      },
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
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

  Widget ButtonRegister1(c2, c1, text, x, n, p, ex, d) {
    return Container(
      width: 150,
      height: 65,
      child: RaisedButton(
        onPressed: () {
          print('Button Clicked.');
          var formdata = formstate.currentState;
          if (formdata!.validate()) {
            formdata.save();

            if (nameItem == null || nameItem == "") {
              nameItem = n;
            }
            if (priceItem == null || priceItem == "") {
              priceItem = p;
            }
            if (noteItem == null || noteItem == "") {
              noteItem = ex;
            }
            if (desItem == null || desItem == "") {
              desItem = d;
            }
            print("=========valid==============");
            print(nameItem);
            print(priceItem);
            print(noteItem);
            print(desItem);
            editItemApi(context, int.parse(widget.id.toString()), nameItem,
                desItem, double.parse(priceItem.toString()), noteItem);
            print("=========api==============");

            // Navigator.of(context).pushNamed("picColor");
          } else {
            print("not validddddddddddddddd");
          }
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
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

  Widget ButtonRegister2(c2, c1, text, x, id) {
    return Container(
      width: 150,
      height: 65,
      child: RaisedButton(
        onPressed: () {
          print('Button Clicked.');
          deletItemApi(context, id);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
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
