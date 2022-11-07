import 'package:abood/controller/ControlUser.dart';
import 'package:abood/controller/controlProduct.dart';
import 'package:abood/model/user/mycart/api/payement.dart';
import 'package:abood/model/user/mycart/json/object_payment.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class CompletCart extends StatefulWidget {
  const CompletCart({super.key});

  @override
  State<CompletCart> createState() => _CompletCartState();
}

class _CompletCartState extends State<CompletCart> {
  ControllerProduct controllerPro = Get.put(ControllerProduct());
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var name, phone, area, row, house;
  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }

  Homecontroller controller1 = Get.put(Homecontroller());
  Homecontroller controller = Get.put(Homecontroller());

  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  var selectedDayTime;
  var idCountry;
  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List dayTime) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in dayTime) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: controllerPro.language == "en"
                ? Text(
                    i['cityOt'].toString(),
                    style: TextStyle(color: Colors.black),
                  )
                : Text(
                    i['cityAr'].toString(),
                    style: TextStyle(color: Colors.black),
                  ),
          ),
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _dropdownTestItems = buildDropdownTestItems(controller.allCity);
  }

  textWidget(text) {
    return Text(text.toString(),
        style: const TextStyle(
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            fontFamily: 'Almarai'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: text1("My Cart".tr),
      ),
      body: Form(
        key: formstate,
        child: Column(
          children: [
            ListTile(
              title: Text("Estimated delivery time is 3 days".tr),
              subtitle: Text("Cannot be returned or exchanged".tr),
              leading: Image.asset("assets/images/shipped.png"),
            ),
            const Divider(
              thickness: 3,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    textWidget("Name".tr),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(decoration: boxd(), child: TextFormField2()),
                    const SizedBox(
                      height: 10,
                    ),
                    textWidget("Mobile Number".tr),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(decoration: boxd(), child: TextFormField1()),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWidget("City".tr),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                color: Colors.transparent,
                                // padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: DropdownBelow(
                                  itemWidth: MediaQuery.of(context).size.width,
                                  itemTextstyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                  boxTextstyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white54),
                                  // boxPadding: EdgeInsets.fromLTRB(13, 12, 13, 12),
                                  boxWidth: MediaQuery.of(context).size.width,
                                  boxHeight: 70,
                                  boxDecoration: boxdcity(),
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                  hint: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      "Select City".tr,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'majallab'),
                                    ),
                                  ),
                                  value: selectedDayTime,
                                  items: _dropdownTestItems,
                                  onChanged: (selectedTest) {
                                    setState(() {
                                      selectedDayTime = selectedTest;
                                      print(selectedDayTime["id"]);
                                      controller.SaveaCityId(
                                          selectedDayTime["id"]);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWidget("Region".tr),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  decoration: boxd(),
                                  child: TextFormFieldarea()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget("Apartment number".tr),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            decoration: boxd(), child: TextFormFieldHouse()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textWidget("Street name".tr),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(decoration: boxd(), child: TextFormFieldrow()),
                    const SizedBox(
                      height: 300,
                    ),
                  ],
                ),
              ),
            ),
            bottomButton()
          ],
        ),
      ),
    );
  }

  Widget bottomButton() {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FlatButton(
                    color: Colors.black,
                    onPressed: () async {
                      // Navigator.of(context).pushNamed("CompletCart");
                      var formdata = formstate.currentState;
                      if (formdata!.validate()) {
                        formdata.save();
                        print(" validddddddddddddddd");
                        print(controller1.id);
                        print(name);
                        print(phone);
                        print(controller1.idCity);
                        print(area);
                        print(row);
                        print(house);

                        paymentApi(context, name, phone, controller1.idCity,
                            area, row, house, controllerPro.listPayment);
                      }
                    },
                    child: Text(
                      "Finish".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    )),
              ),
              FlatButton(
                  color: Colors.black,
                  onPressed: () async {
                    Navigator.of(context).pushReplacementNamed("homePage");
                  },
                  child: Text(
                    "Home".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GetBuilder<ControllerProduct>(builder: (controller) {
                    return (Text(r"JD" + controllerPro.total.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20)));
                  }))
            ],
          ),
        ),
      ),
    );
  }

  TextFormField TextFormField1() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: controller1.mobileNumber,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
      ),
      validator: (text) {
        if (text!.length > 15) {
          return "can\'t enter bigest than ".tr + "15" + "numbers".tr;
        }
        if (text.length < 9) {
          return "can\'t enter less than ".tr + "9" + "numbers".tr;
        }
      },
      onSaved: (string) {
        phone = string;
        print(phone);
      },
    );
  }

  TextFormField TextFormFieldHouse() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "write here".tr,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.house)),
      ),
      validator: (text) {
        if (text!.length > 30) {
          return "can\'t enter bigest than ".tr + "30" + "numbers".tr;
        }
        if (text.length < 1) {
          return "can\'t enter less than ".tr + "1" + "numbers".tr;
        }
      },
      onSaved: (string) {
        house = string;
        print(house);
      },
    );
  }

  TextFormField TextFormField2() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: controller1.firstName + controller1.lastName,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
      ),
      validator: (text) {
        if (text!.length > 30) {
          return "can\'t enter bigest than ".tr + "30" + "characters".tr;
        }
        if (text.length < 1) {
          return "can\'t enter less than ".tr + "1" + "characters".tr;
        }
      },
      onSaved: (string) {
        name = string;
        print(name);
      },
    );
  }

  TextFormField TextFormFieldrow() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "write here".tr,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
      ),
      validator: (text) {
        if (text!.length > 30) {
          return "can\'t enter bigest than ".tr +
              "30" +
              "characters".tr +
              " - " +
              "numbers".tr;
        }
        if (text.length < 1) {
          return "can\'t enter less than ".tr +
              "1" +
              "characters".tr +
              " - " +
              "numbers".tr;
        }
      },
      onSaved: (string) {
        row = string;
        print(row);
      },
    );
  }

  TextFormField TextFormFieldarea() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "write here".tr,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
      ),
      validator: (text) {
        if (text!.length > 30) {
          return "can\'t enter bigest than ".tr + "30" + "characters".tr;
        }
        if (text.length < 1) {
          return "can\'t enter less than ".tr + "1" + "characters".tr;
        }
      },
      onSaved: (string) {
        area = string;
        print(area);
      },
    );
  }

  BoxDecoration boxdcity() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10), //border corner radius
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2), //color of shadow
          // spreadRadius: 5,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    );
  }

  BoxDecoration boxd() {
    return BoxDecoration(
      // color: Colors.white,
      borderRadius: BorderRadius.circular(10), //border corner radius
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2), //color of shadow
          // spreadRadius: 5,
          blurRadius: 4,
          offset: Offset(1, 2),
        ),
      ],
    );
  }
}
