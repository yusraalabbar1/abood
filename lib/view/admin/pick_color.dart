import 'package:abood/constant/urls.dart';
import 'package:abood/controller/controlAdmin.dart';
import 'package:abood/model/admin/api/add_item.dart';
import 'package:abood/view/admin/add_product.dart';
import 'package:abood/view/admin/pick_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

// import 'package:string_to_color/string_to_color.dart';

class picColor extends StatefulWidget {
  final id;
  const picColor({super.key, this.id});

  @override
  State<picColor> createState() => _picColorState();
}

List<Map<String, dynamic>> myListMapColors = [];
List<Map<String, String>> myListMapColorsFinal = [];

class _picColorState extends State<picColor> {
  var c;
  String colCut = "";
  Text text3(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  Text text1size(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
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
          children: [
            appText(" Additional Info".tr),
            appText2("Pick Colors With Sizes".tr)
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          pickSize(),
          Divider(),
          Container(
            alignment: Alignment.center,
            // padding: EdgeInsets.all(20),
            // margin: EdgeInsets.all(20),
            // // height: 350,
            // width: MediaQuery.of(context).size.width,
            // decoration: const BoxDecoration(
            //     color: Color.fromARGB(255, 46, 45, 48),
            //     borderRadius: BorderRadius.all(Radius.circular(20)),
            //     gradient: LinearGradient(
            //       begin: Alignment.bottomRight,
            //       end: Alignment.bottomLeft,
            //       colors: [
            //         Color.fromARGB(255, 63, 63, 64),
            //         Color.fromARGB(255, 79, 223, 223),
            //       ],
            //     )),
            child: Column(
              children: [
                Center(child: text1size("Pick Colors".tr)),
                SizedBox(
                  height: 20,
                ),
                ColorPicker(
                  pickerColor: Colors.red,
                  onColorChanged: (Color color) {
                    print(color);
                    c = color;
                    colCut = color
                        .toString()
                        .substring(6, color.toString().length - 1);
                    print(colCut);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            child: ButtonRegister1color(Colors.black, Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: myListMapColors.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                      height: 100.0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              height: MediaQuery.of(context).size.width * 0.15,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: myListMapColors[index]["Value"],
                                  borderRadius: const BorderRadius.all(
                                      Radius.elliptical(20.0, 20.0)),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -5.0,
                              bottom: 35.0,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    print(index);
                                    print(myListMapColors);
                                    myListMapColors.removeAt(index);
                                    myListMapColorsFinal.removeAt(index);
                                    print(myListMapColors);
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ));
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ButtonNext(Colors.black, Colors.white),
          ),
        ],
      ),
    );
  }

  Widget ButtonRegister1color(c2, c1) {
    return Container(
      width: 200,
      height: 53,
      child: RaisedButton(
        onPressed: () {
          setState(() {
            myListMapColors.add({"Value": c});
            print(myListMapColors);
            myListMapColorsFinal
                .add({"Value": colCut.toString().replaceAll("0xff", "#")});
            print(myListMapColorsFinal);
          });
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Text(
          "pick".tr,
          style: TextStyle(
              color: c1,
              fontSize: 18,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold),
        ),
        textColor: c1,
        splashColor: Colors.white,
        color: c2,
      ),
    );
  }

  ControllerAdmin controller = Get.put(ControllerAdmin());
  Widget ButtonNext(c2, c1) {
    return Container(
      width: 118,
      height: 65,
      child: RaisedButton(
        onPressed: () {
          controller.SaveIdStore(int.parse(widget.id.toString()));
          addItem(
              context,
              controller.nameItem.toString(),
              controller.desItem.toString(),
              controller.priceItem,
              controller.noteItem.toString(),
              myListMapize,
              myListMapColorsFinal);
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Text(
          "Send Info Admin".tr,
          style: TextStyle(
              color: c1,
              fontSize: 18,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold),
        ),
        textColor: c1,
        splashColor: Colors.white,
        color: c2,
      ),
    );
  }
  /*


  */
}
