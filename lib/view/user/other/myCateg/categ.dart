import 'package:abood/controller/controlProduct.dart';
import 'package:abood/view/user/other/myCateg/sub_cat.dart';
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
        leading: Image.asset("assets/images/Untitled design (14).png"),
        title: Text(
          "Category",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'majallab',
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<ControllerProduct>(builder: (controllerPro) {
        return (GridView.builder(
          // shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
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
                child: Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: text1(
                        controllerPro.saveAllCategwithout[index]["descAr"]
                            .toString(),
                      ),
                    ),
                  ),
                ),
              )),
        ));
      }),
    );
  }

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
