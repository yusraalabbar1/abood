import 'package:abood/controller/ControlUser.dart';
import 'package:abood/model/admin/dialog/dialog.dart';
import 'package:abood/model/user/auth/signup/api/register.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var email, password, first, last, passwordConf, phone;

  bool _isObscure = true;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();
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
            child: Text(
              i['descAr'].toString(),
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
    _dropdownTestItems = buildDropdownTestItems(controller.saveallCountry);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text("ABOOD"),
        toolbarHeight: 100,
      ),
      body: Form(
        key: formstate,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: text1("أنشئ حساب ")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: Container(
                          decoration: boxd(), child: TextFormFieldFirst())),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                          decoration: boxd(), child: TextFormFieldLast())),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(decoration: boxd(), child: TextFormField1()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(decoration: boxd(), child: TextFormFieldemail()),
            ),
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                boxDecoration: boxd(),
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.black,
                ),
                hint: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'اختر المدينة',
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
                    controller.SaveaCountryId(selectedDayTime["id"]);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(decoration: boxd(), child: TextFormField2()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(decoration: boxd(), child: TextFormFieldConf()),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonRegister1(Colors.white, Colors.black, "التالي", 1),
                  ButtonRegister1(Colors.black, Colors.white, "لدي حساب", 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField TextFormFieldFirst() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "اسم الاول",
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 2) {
          return "can not enter less than 2";
        }
        return null;
      },
      onSaved: (string) {
        first = string;
        controller.SavefirstName(string);
      },
    );
  }

  TextFormField TextFormFieldLast() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "اسم الاخير",
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 2) {
          return "can not enter less than 2";
        }
        return null;
      },
      onSaved: (string) {
        last = string;
        controller.SavelastName(string);
      },
    );
  }

  TextFormField TextFormField1() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "ادخل رقم هاتف",
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 2) {
          return "can not enter less than 2";
        }
        return null;
      },
      onSaved: (string) {
        phone = string;
        controller.SavemobileNumber(string);
      },
    );
  }

  TextFormField TextFormFieldemail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "البريد الالكتروني",
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.email)),
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 2) {
          return "can not enter less than 2";
        }
        return null;
      },
      onSaved: (string) {
        email = string;
        controller.Saveemail(string);
      },
    );
  }

  TextFormField TextFormField2() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: "كلمة السر",
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.password)),
        suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Color(0xffFAB10C) : Colors.black),
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 6) {
          return "can not enter less than 6";
        }
        return null;
      },
      onSaved: (string) {
        password = string;
        controller.Savepassword(string);
      },
    );
  }

  TextFormField TextFormFieldConf() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: "تاكيد كلمة السر",
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.password)),
        suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Color(0xffFAB10C) : Colors.black),
      ),
      validator: (text) {
        if (text!.length > 40) {
          return "can not enter bigest than 40";
        }
        if (text.length < 6) {
          return "can not enter less than 6";
        }
        return null;
      },
      onSaved: (string) {
        passwordConf = string;
        controller.SavepasswordConf(string);
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

  Widget ButtonRegister1(c2, c1, text, x) {
    return Container(
      width: 118,
      height: 53,
      child: RaisedButton(
        onPressed: () {
          print('Button Clicked.');
          // Navigator.of(context).pushNamed("otpSignup");
          if (x == 1) {
            var formdata = formstate.currentState;
            if (formdata!.validate()) {
              formdata.save();
              print(" validddddddddddddddd");
              var email, password, first, last, passwordConf, phone;

              print(controller.email);
              print(controller.password);
              print(controller.firstName);
              print(controller.lastName);
              print(controller.passwordcon);
              print(controller.mobileNumber);
              print(controller.saveaCountryId);
              if (controller.password == controller.passwordcon) {
                print("success");
                register(
                    context,
                    controller.mobileNumber,
                    controller.password,
                    controller.email,
                    controller.firstName,
                    controller.lastName,
                    controller.saveaCountryId);
              } else {
                mydiaFaild(context, "كلمة المرور غير متطابقة");
              }
              // Navigator.of(context).pushNamed("otpSignup");
            } else {
              print("not validddddddddddddddd");
            }
          } else {}
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Text(
          text,
          style: TextStyle(
              color: c1,
              fontSize: 18,
              fontFamily: 'majallab',
              fontWeight: FontWeight.bold),
        ),
        textColor: c1,
        splashColor: Colors.white,
        color: c2,
      ),
    );
  }
}
