import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/user/stor/stor_item/stor_item_model.dart';
import 'package:flutter/material.dart';

import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/admin/api/deletItemApi.dart';
import 'package:abood/model/admin/api/editItem.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../../model/admin/api/edit_color.dart';

class EditItem extends StatefulWidget {
  final StorItemsData pass;
  const EditItem({super.key, required this.pass});

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  var nameItem, priceItem, noteItem, desItem, ar, en;
  ControllerAdmin controller = Get.put(ControllerAdmin());

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  // GlobalKey<FormState> formstate1 = new GlobalKey<FormState>();
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

  var quent = 1;
  var c;
  String colCut = "";

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
          ],
        ),
      ),
      body: FutureBuilder(
        // future: getItemsIdApi(widget.id),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData != null
              ? Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            child: Form(
                              key: formstate,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      // alignment: Alignment.topLeft,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: appText2("Name:".tr)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 20,
                                          top: 0),
                                      child: Container(
                                          decoration: boxd(),
                                          child: TextFormFieldFirst(
                                              widget.pass.itemName))),
                                  Container(
                                      // alignment: Alignment.topLeft,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: appText2("Price:".tr)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 20,
                                          top: 0),
                                      child: Container(
                                          decoration: boxd(),
                                          child: TextFormFieldLast(
                                              widget.pass.price))),
                                  Container(
                                      // alignment: Alignment.topLeft,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: appText2("Extra Text:".tr)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                        top: 0),
                                    child: Container(
                                        decoration: boxd(),
                                        child: TextFormField1(
                                            widget.pass.extraText)),
                                  ),
                                  Container(
                                      // alignment: Alignment.topLeft,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: appText2("Description: ".tr)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                        top: 0),
                                    child: Container(
                                        decoration: boxd(),
                                        child: TextFormField2(
                                            widget.pass.itemDescription)),
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
                                widget.pass.itemName,
                                widget.pass.price,
                                widget.pass.extraText,
                                widget.pass.itemDescription),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: appText2("Edit Colors".tr),
                          ),
                          widgetEditColor(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: appText2("Edit Sizes".tr),
                          ),
                          widget.pass.itemSizes != null
                              ? ListView.builder(
                                  itemCount: widget.pass.itemSizes!.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: EdgeInsets.all(10),
                                      // color: Colors.white,
                                      decoration: boxd(),
                                      child: ListTile(
                                          leading: IconButton(
                                              onPressed: () {
                                                print(ar);
                                                print(en);
                                                if (ar == null) {
                                                  ar = widget
                                                      .pass
                                                      .itemSizes![index]
                                                      .itemSizeDescAr;
                                                }
                                                if (en == null) {
                                                  en = widget
                                                      .pass
                                                      .itemSizes![index]
                                                      .itemSizeDescEn;
                                                }
                                                edit_size(
                                                    context,
                                                    widget
                                                        .pass
                                                        .itemSizes![index]
                                                        .itemSizeId,
                                                    ar,
                                                    en,
                                                    widget.pass.id);
                                              },
                                              icon:
                                                  const Icon(Icons.edit_note)),
                                          title: Form(
                                            // key: formstate1,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: TextFormFieldSizeAR(
                                                        widget
                                                            .pass
                                                            .itemSizes![index]
                                                            .itemSizeDescAr)),
                                                Expanded(
                                                    child: TextFormFieldSizeEN(
                                                        widget
                                                            .pass
                                                            .itemSizes![index]
                                                            .itemSizeDescEn)),
                                              ],
                                            ),
                                          )),
                                    );
                                  })
                              : Container(child: Text("No Thing")),
                        ],
                      ),
                    ),
                    ButtonRegister3(Colors.black, Colors.white, "Finish".tr),
                  ],
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }

  var Colorwidget1;
  widgetEditColor() {
    return widget.pass.itemColors != null
        ? GetBuilder<ControllerProduct>(builder: (controllerPro) {
            return ListView.builder(
                itemCount: widget.pass.itemColors!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var quent1 = widget.pass.itemColors![index].qty;
                  var Colorwidget = widget.pass.itemColors![index].value;
                  print("================Colorwidget==============");
                  print(Colorwidget);
                  return Container(
                    margin: EdgeInsets.all(10),
                    // color: Colors.white,
                    decoration: boxd(),
                    child: Column(
                      children: [
                        ListTile(
                            leading: IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit_note)),
                            trailing: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colorwidget != null ||
                                      Colorwidget != "" ||
                                      Colorwidget != " "
                                  ? Color(int.parse(Colorwidget.toString()
                                      .replaceAll("#", "0xff")))
                                  : Colors.black,
                            ),
                            title: appText2(
                              "Old Quantity: ".tr +
                                  quent1.toString() +
                                  "New Quantity: ".tr +
                                  quent.toString(),
                            )),
                        Column(
                          children: [
                            appText2("New Color:".tr),
                            ColorPicker(
                              pickerColor: Colors.red,
                              onColorChanged: (Color color) {
                                c = color;
                                colCut = color
                                    .toString()
                                    .substring(6, color.toString().length - 1);

                                Colorwidget1 = colCut;
                                print(Colorwidget);
                                colCut =
                                    colCut.toString().replaceAll("0xff", "#");
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                appText2("Quantity per Color".tr),
                                const SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height: 40,
                                      decoration: boxd(),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: () async {
                                                  setState(() {
                                                    quent = quent + 1;
                                                    quent1 = quent;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                )),
                                            text1(quent),
                                            IconButton(
                                                onPressed: () async {
                                                  if (quent > 1) {
                                                    setState(() {
                                                      quent = quent - 1;
                                                      quent1 = quent;
                                                    });
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
                                )
                              ],
                            ),
                            FlatButton(
                              child: const Text("OK"),
                              onPressed: () {
                                colCut != ""
                                    ? edit_color(
                                        context,
                                        widget.pass.itemColors![index]
                                            .itemColorId,
                                        quent,
                                        colCut,
                                        widget.pass.id)
                                    : mydiaFaild(context, "pick color");
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                });
          })
        : Container(child: Text("No Thing"));
  }

  TextFormField TextFormFieldSizeEN(text) {
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
      // onSaved: (string) {
      //   en = string;
      //   // controller.SavenameItem(string);
      // },
      onChanged: (string) {
        en = string;
        // controller.SavenameItem(string);
      },
    );
  }

  TextFormField TextFormFieldSizeAR(text) {
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
      // onSaved: (string) {
      //   ar = string;
      //   // controller.SavenameItem(string);
      // },
      onChanged: (string) {
        ar = string;
        // controller.SavenameItem(string);
      },
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
    return Text(text.toString(),
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
            editItemApi(context, int.parse(widget.pass.id.toString()), nameItem,
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

  Widget ButtonRegister3(c2, c1, text) {
    return Container(
      width: 200,
      height: 50,
      margin: EdgeInsets.all(5),
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("MainScreenStor");
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
