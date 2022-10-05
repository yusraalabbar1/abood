import 'package:flutter/material.dart';
import 'package:get/get.dart';

class pickSize extends StatefulWidget {
  const pickSize({super.key});

  @override
  State<pickSize> createState() => _pickSizeState();
}

List<Map<String, String>> myListMapize = [];

class _pickSizeState extends State<pickSize> {
  // List sizes = [];
  var arabic, english;

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  TextFormField TextFormFieldEng() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: " English",
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
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
      // onFieldSubmitted: (value) {
      //   setState(() {
      //     sizes.add(value);
      //   });
      // },
      onSaved: (string) {
        english = string;
      },
    );
  }

  TextFormField TextFormFieldArabic() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: " بالعربية",
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
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
      // onFieldSubmitted: (value) {
      //   setState(() {
      //     sizes.add(value);
      //   });
      // },
      onSaved: (string) {
        arabic = string;
      },
    );
  }

  Text text1size(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'));
  }

  Widget ButtonRegister2Size(c2, c1) {
    return Container(
      width: 200,
      height: 53,
      child: RaisedButton(
        onPressed: () {
          setState(() {
            var formdata = formstate.currentState;
            if (formdata!.validate()) {
              formdata.save();
              print(" validddddddddddddddd");
              print("========information input==========");
              print(arabic);
              print(english);
              print("========================");
              myListMapize.add(
                  {"DescAr": arabic.toString(), "DescEn": english.toString()});
              print(myListMapize);
            }
          });
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Text(
          "Pick".tr,
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        // height: 350,
        width: MediaQuery.of(context).size.width,
        // decoration: const BoxDecoration(
        //     color: Color.fromARGB(255, 46, 45, 48),
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
        //     gradient: LinearGradient(
        //       begin: Alignment.bottomRight,
        //       end: Alignment.bottomLeft,
        //       colors: [
        //         Color.fromARGB(255, 63, 63, 64),
        //         Color.fromARGB(255, 9, 138, 138),
        //       ],
        //     )),
        child: Column(
          children: [
            text1size("Add Sizes".tr),
            Divider(),
            Container(decoration: boxd(), child: TextFormFieldEng()),
            SizedBox(
              height: 15,
            ),
            Container(decoration: boxd(), child: TextFormFieldArabic()),
            Divider(),
            ButtonRegister2Size(Colors.black, Colors.white),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: myListMapize.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                      child: Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          // margin: EdgeInsets.only(top: 20.0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Center(
                                    child:
                                        text2(myListMapize[index]["DescEn"])),
                                Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                Center(
                                    child:
                                        text2(myListMapize[index]["DescAr"])),
                              ],
                            ),
                            margin: const EdgeInsets.all(5.0),
                            decoration: boxd(),
                            // decoration: const BoxDecoration(
                            //     borderRadius: BorderRadius.all(
                            //         Radius.elliptical(20.0, 20.0)),
                            //     color: Color.fromARGB(255, 99, 94, 94)),
                          ),
                        ),
                        Positioned(
                          right: -10.0,
                          bottom: 61.0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                print(index);
                                print(myListMapize);
                                myListMapize.removeAt(index);
                                print(myListMapize);
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
                })
          ],
        ),
      ),
    );
  }

  Text text2(text) {
    return Text(text.toString(),
        style: const TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.bold,
            fontFamily: 'majallab'));
  }
}
