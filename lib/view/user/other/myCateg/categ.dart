import 'package:abood/controller/controlProduct.dart';
import 'package:abood/view/user/other/myCateg/sub_cat.dart';
import 'package:abood/view/user/other/myCateg/sub_horiz.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cantegory extends StatefulWidget {
  const Cantegory({super.key});

  @override
  State<Cantegory> createState() => _CantegoryState();
}

class _CantegoryState extends State<Cantegory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 5,
          backgroundColor: Colors.white,
          // leading: Image.asset("assets/images/Untitled design (14).png"),
          title: Text(
            "Shop By Category",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<ControllerProduct>(builder: (controllerPro) {
                return (ListView.builder(
                  itemCount: controllerPro.saveAllCategwithout.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubCat(
                                    id: controllerPro.saveAllCategwithout[index]
                                        ["id"])),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                // alignment: Alignment.center,
                                height: 80,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/Untitled design (15).png',
                                            ),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child:
                                        // text1(
                                        //   controllerPro.saveAllCategwithout[index]["descAr"]
                                        //       .toString(),
                                        // ),
                                        AnimatedTextKit(
                                      animatedTexts: [
                                        ColorizeAnimatedText(
                                          controllerPro
                                                  .saveAllCategwithout[index]
                                              ["descEn"],
                                          textStyle: colorizeTextStyle,
                                          colors: colorizeColors,
                                        ),
                                      ],
                                      isRepeatingAnimation: true,
                                      onTap: () {
                                        print("Tap Event");
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                  // width: MediaQuery.of(context).size.width,
                                  height: 80,
                                  child: SubCatHoriz(
                                      id: controllerPro
                                          .saveAllCategwithout[index]["id"])),
                            ),
                          ],
                        ),
                      )),
                ));
              }),
            ),
            bottomButton()
          ],
        ));
  }

  Widget bottomButton() {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        // height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // height: 50,
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Our Customer assistance team is available on Social Media",
                style: TextStyle(fontSize: 17, fontFamily: 'majallab'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.whatsapp)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.facebook)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              ],
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  static const colorizeColors = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 23.0,
    fontFamily: 'majallab',
    fontWeight: FontWeight.bold,
  );
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  Widget line() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Category >>"),
        Text("sub Category  >>"),
        Text("Stors  >>"),
        Text("Product"),
      ],
    );
  }
}
