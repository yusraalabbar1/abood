import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:abood/model/admin/api/add_image_item_api.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';

class muImage extends StatefulWidget {
  final id;
  const muImage({super.key, this.id});
  @override
  State<muImage> createState() => _muImageState();
}

class _muImageState extends State<muImage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  File? imageFile;
  var pathImage;
  var nameImage;
  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  Widget ButtonRegister2(c2, c1) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      child: ElevatedButton(
        onPressed: () {
          print('Button Clicked.');
          Navigator.of(context).pushReplacementNamed("MainScreenStor");
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: c2,
            onPrimary: Colors.white,
            textStyle: TextStyle(color: c1)),
        child: Text(
          "Home".tr,
          style: TextStyle(
              color: c1,
              fontSize: 18,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget ButtonRegister1(c2, c1) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 65,
        child: ElevatedButton(
          onPressed: () {
            print('Button Clicked.');
            // openImages();
            // addImageApi(context, 50, imageFile);
            Upload(context, imageFile, nameImage, widget.id);
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              backgroundColor: c2,
              onPrimary: Colors.white,
              textStyle: TextStyle(color: c1)),
          child: Text(
            "send photo".tr,
            style: TextStyle(
                color: c1,
                fontSize: 18,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  static const colorizeColors = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'majallab',
  );
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        pathImage = pickedFile.path;
        print(pathImage);
        nameImage = pickedFile.path.split('/').last;
        print(nameImage);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        pathImage = pickedFile.path;
        print(pathImage);
        nameImage = pickedFile.path.split('/').last;
        print(nameImage);
      });
    }
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }

  Text text2(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
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
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 100,
        // centerTitle: false,

        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [appText("pick Image".tr)],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      // gradient: LinearGradient(
                      //   begin: Alignment.bottomRight,
                      //   end: Alignment.bottomLeft,
                      //   colors: [
                      //     Color.fromARGB(255, 63, 63, 64),
                      //     Color.fromARGB(255, 250, 253, 253),
                      //   ],
                      // )
                    ),
                    child: Center(child: appText2("photo \nCamera".tr)),
                  ),
                  Positioned(
                      left: 20,
                      top: 20.0,

                      // (background container size) - (circle height / 2)
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black54,
                              child: Center(
                                child: IconButton(
                                    icon: const Icon(
                                      Icons.camera_enhance,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      _getFromCamera();
                                    }),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(child: appText2("photo \nGallery".tr)),
                  ),
                  Positioned(
                      left: 20,
                      top: 20.0,

                      // (background container size) - (circle height / 2)
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black54,
                              child: Center(
                                child: IconButton(
                                    icon: const Icon(
                                      Icons.photo_library,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      _getFromGallery();
                                    }),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              )
            ],
          ),

          imageFile != null
              ? Container(
                  margin: EdgeInsets.all(20),
                  child: Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(),
          //open button ----------------
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ButtonRegister1(Colors.black, Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: ButtonRegister2(Colors.black, Colors.white),
          ),
          SizedBox(
            height: 20,
          ),

          imagefiles != null
              ? Wrap(
                  children: imagefiles!.map((imageone) {
                    return Container(
                        child: Card(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Image.file(File(imageone.path)),
                      ),
                    ));
                  }).toList(),
                )
              : Container()
        ],
      ),
    );
  }
}
