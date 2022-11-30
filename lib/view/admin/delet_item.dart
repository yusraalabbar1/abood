import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/admin/api/deletItemApi.dart';
import 'package:abood/model/admin/api/editItem.dart';
import 'package:abood/model/admin/api/get_item_det.dart';
import 'package:abood/model/user/auth/login/api/loginApi.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:abood/model/user/stor/stor_item/stor_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletItem extends StatefulWidget {
  final StorItemsData pass;
  const DeletItem({super.key, required this.pass});

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
    print(widget.pass.itemId);
  }

  Text appText2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          toolbarHeight: 100,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [appText(" Delete Product".tr)],
          ),
        ),
        body: GetBuilder<ControllerAdmin>(builder: (controller) {
          return ListView(
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
                                controller.ItemsById["itemName"])),
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
                                controller.ItemsById["price"])),
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
                                controller.ItemsById["extraText"])),
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
                            child: TextFormField2(
                                controller.ItemsById["itemDescription"])),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: text1("Delete Sub Section".tr),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    controller.ItemsById["itemColors"] != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 70,
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  // decoration: boxd(),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .ItemsById["itemColors"].length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx, index) {
                                      return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Stack(
                                            children: [
                                              CircleAvatar(
                                                // radius: 20,
                                                backgroundColor: Color(
                                                    int.parse(controller
                                                        .ItemsById["itemColors"]
                                                            [index]["value"]
                                                        .toString()
                                                        .replaceAll(
                                                            "#", "0xff"))),
                                              ),
                                              Positioned(
                                                // right: -2.0,
                                                bottom: 50.0,
                                                child: CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor: Colors.red,
                                                  child: IconButton(
                                                      onPressed: () async {
                                                        if (controller
                                                                .ItemsById[
                                                                    "itemColors"]
                                                                .length >
                                                            1) {
                                                          await deletItemColorApi(
                                                              context,
                                                              controller.ItemsById[
                                                                          "itemColors"]
                                                                      [index][
                                                                  "itemColorId"]);
                                                          await getItemDetailStore(
                                                              controller
                                                                      .ItemsById[
                                                                  "itemId"]);
                                                        } else {
                                                          print("canot");
                                                          diaFaildDelet(
                                                              context,
                                                              "Cann\'t Delete All Element in Section"
                                                                  .tr);
                                                        }
                                                      },
                                                      icon: Icon(
                                                        Icons.remove,
                                                        color: Colors.white,
                                                        size: 5,
                                                      )),
                                                ),
                                              )
                                            ],
                                          ));
                                    },
                                  ),
                                ),
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
                    controller.ItemsById["itemSizes"] != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 70,
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  // decoration: boxd(),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .ItemsById["itemSizes"].length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx, index) {
                                      return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Stack(
                                            children: [
                                              Chip(
                                                label: Text(
                                                  controller
                                                      .ItemsById["itemSizes"]
                                                          [index]
                                                          ["itemSizeDescEn"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Positioned(
                                                // right: -2.0,
                                                bottom: 50.0,
                                                child: CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor: Colors.red,
                                                  child: IconButton(
                                                      onPressed: () async {
                                                        if (controller
                                                                .ItemsById[
                                                                    "itemSizes"]
                                                                .length >
                                                            1) {
                                                          await deletItemSizeApi(
                                                              context,
                                                              controller.ItemsById[
                                                                          "itemSizes"]
                                                                      [index][
                                                                  "itemSizeId"]);
                                                          await getItemDetailStore(
                                                              controller
                                                                      .ItemsById[
                                                                  "itemId"]);
                                                        } else {
                                                          print("canot");
                                                          diaFaildDelet(
                                                              context,
                                                              "Cann\'t Delete All Element in Section"
                                                                  .tr);
                                                        }
                                                      },
                                                      icon: Icon(
                                                        Icons.remove,
                                                        color: Colors.white,
                                                        size: 5,
                                                      )),
                                                ),
                                              )
                                            ],
                                          ));
                                    },
                                  ),
                                ),
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
                    controller.ItemsById["itemImages"] != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 70,
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  // decoration: boxd(),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller
                                                .ItemsById["itemImages"]
                                                .length >
                                            0
                                        ? controller
                                            .ItemsById["itemImages"].length
                                        : 0,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Stack(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.black38,
                                                image: DecorationImage(
                                                  image: NetworkImage(imageAds +
                                                      controller.ItemsById[
                                                              "itemImages"]
                                                              [index]
                                                              ["imageUrl"]
                                                          .toString()),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                            ),
                                            Positioned(
                                              // right: -2.0,
                                              bottom: 50.0,
                                              child: CircleAvatar(
                                                radius: 10,
                                                backgroundColor: Colors.red,
                                                child: IconButton(
                                                    onPressed: () async {
                                                      if (controller
                                                              .ItemsById[
                                                                  "itemImages"]
                                                              .length >
                                                          1) {
                                                        deletItemImageApi(
                                                            context,
                                                            controller.ItemsById[
                                                                        "itemImages"]
                                                                    [index][
                                                                "itemImageId"]);
                                                        await getItemDetailStore(
                                                            controller
                                                                    .ItemsById[
                                                                "itemId"]);
                                                      } else {
                                                        print("canot");
                                                        diaFaildDelet(
                                                            context,
                                                            "Cann\'t Delete All Element in Section"
                                                                .tr);
                                                      }
                                                    },
                                                    icon: Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                      size: 5,
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
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
                    " Delete product".tr, 1, controller.ItemsById["itemId"]),
              ),
            ],
          );
        }));
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

  Widget ButtonRegister2(c2, c1, text, x, id) {
    return Container(
      width: 150,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: c2,
            onPrimary: Colors.white,
            textStyle: TextStyle(color: c1)),
        onPressed: () async {
          print('Button Clicked.');
          deletItemApi(context, id);
          // await getItemDetailStore(widget.pass.itemId);
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
