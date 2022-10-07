import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/admin/api/deletItemApi.dart';
import 'package:abood/model/admin/api/editItem.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletItem extends StatefulWidget {
  final id;
  const DeletItem({super.key, this.id});

  @override
  State<DeletItem> createState() => _DeletItemState();
}

class _DeletItemState extends State<DeletItem> {
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
          fontSize: 25,
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
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [appText(" Delete Product".tr)],
        ),
      ),
      body: FutureBuilder(
        future: getItemsIdApi(widget.id),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData != null
              ? ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: text1("Basic Information".tr),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      // height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                        key: formstate,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                // alignment: Alignment.topLeft,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: appText2("Name:".tr)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 0),
                              child: Container(
                                  decoration: boxd(),
                                  child: TextFormFieldFirst(
                                      controllerPro.ItemsById["itemName"])),
                            ),
                            Container(
                                // alignment: Alignment.topLeft,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: appText2("Price:".tr)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 0),
                              child: Container(
                                  decoration: boxd(),
                                  child: TextFormFieldLast(
                                      controllerPro.ItemsById["price"])),
                            ),
                            Container(
                                // alignment: Alignment.topLeft,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: appText2("Extra Text:".tr)),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                  decoration: boxd(),
                                  child: TextFormField1(
                                      controllerPro.ItemsById["extraText"])),
                            ),
                            Container(
                                // alignment: Alignment.topLeft,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: appText2("Description: ".tr)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 20),
                              child: Container(
                                  decoration: boxd(),
                                  child: TextFormField2(controllerPro
                                      .ItemsById["itemDescription"])),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      // height: 450,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: text1("Delete Sub Section".tr),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          controllerPro.ItemsById["itemColors"] != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 220,
                                        // decoration: boxd(),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controllerPro
                                              .ItemsById["itemColors"].length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (ctx, index) {
                                            return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor: Color(
                                                      int.parse(controllerPro
                                                          .ItemsById[
                                                              "itemColors"]
                                                              [index]["value"]
                                                          .toString()
                                                          .replaceAll(
                                                              "#", "0xff"))),
                                                ));
                                          },
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.black38,
                                        child: IconButton(
                                            onPressed: () {
                                              deletItemColorApi(
                                                  context, widget.id);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(
                              thickness: 3,
                            ),
                          ),
                          controllerPro.ItemsById["itemSizes"] != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 220,
                                        // decoration: boxd(),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controllerPro
                                              .ItemsById["itemSizes"].length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (ctx, index) {
                                            return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Chip(
                                                  label: Text(
                                                    controllerPro
                                                        .ItemsById["itemSizes"]
                                                            [index]
                                                            ["itemSizeDescEn"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ));
                                          },
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.black38,
                                        child: IconButton(
                                            onPressed: () {
                                              deletItemSizeApi(
                                                  context, widget.id);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(
                              thickness: 3,
                            ),
                          ),
                          controllerPro.ItemsById["itemImages"] != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 220,
                                        // decoration: boxd(),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controllerPro
                                              .ItemsById["itemSizes"].length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (ctx, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.black38,
                                                  image: DecorationImage(
                                                    image: NetworkImage(imageAds +
                                                        controllerPro.ItemsById[
                                                                "itemImages"][
                                                            index]["imageUrl"]),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.black38,
                                        child: IconButton(
                                            onPressed: () {
                                              deletItemImageApi(
                                                  context, widget.id);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ButtonRegister2(Colors.black, Colors.white,
                          " Delete product".tr, 1, widget.id),
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
      enabled: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: text,
      ),
    );
  }

  TextFormField TextFormFieldLast(text) {
    return TextFormField(
      enabled: false,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: text.toString(),
      ),
    );
  }

  TextFormField TextFormField1(text) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      enabled: false,
      maxLines: null,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.note)),
      ),
    );
  }

  TextFormField TextFormField2(text) {
    return TextFormField(
      enabled: false,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.description)),
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Color(0xffFAB10C) : Colors.black),
      ),
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
      width: 150,
      height: 65,
      child: RaisedButton(
        onPressed: () {
          print('Button Clicked.');
          var formdata = formstate.currentState;
          if (formdata!.validate()) {
            formdata.save();
            print("=========valid==============");
            print(controller.nameItem);
            print(controller.priceItem);
            print(controller.noteItem);
            print(controller.desItem);
            editItemApi(
                context,
                int.parse(widget.id.toString()),
                controller.nameItem,
                controller.desItem,
                int.parse(controller.priceItem.toString()),
                controller.noteItem);
            print("=========api==============");

            // Navigator.of(context).pushNamed("picColor");
          } else {
            print("not validddddddddddddddd");
          }
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
