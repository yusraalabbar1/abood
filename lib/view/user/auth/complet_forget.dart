import 'package:flutter/material.dart';
import 'package:get/get.dart';

class completForget extends StatefulWidget {
  const completForget({super.key});

  @override
  State<completForget> createState() => _completForgetState();
}

class _completForgetState extends State<completForget> {
  var phone;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABOOD"),
      ),
      body: Form(
        key: formstate,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: text1("Forget Your Password?".tr),
            ),
            const Divider(
                // height: MediaQuery.of(context).size.height,
                color: Colors.grey,
                thickness: 1),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: text1("Mobile Number".tr)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(decoration: boxd(), child: TextFormField1()),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonRegister1(
                Colors.black, Colors.white, "Next".tr, "completForget"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget ButtonRegister1(c2, c1, text, nav) {
    return Container(
      width: 300,
      height: 53,
      child: RaisedButton(
        onPressed: () {
          print('Button Clicked.');
          Navigator.of(context).pushNamed(nav);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Text(
          text,
          style: TextStyle(
              color: c1,
              fontSize: 21,
              fontFamily: 'majallab',
              fontWeight: FontWeight.bold),
        ),
        textColor: c1,
        splashColor: Colors.white,
        color: c2,
      ),
    );
  }

  TextFormField TextFormField1() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Mobile Number".tr,
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
      ),
      validator: (text) {
        if (text!.length > 15) {
          return "can\'t enter bigest than ".tr + "15" + "characters".tr;
        }
        if (text.length < 9) {
          return "can\'t enter less than ".tr + "9" + "characters".tr;
        }
        return null;
      },
      onSaved: (string) {
        phone = string;
      },
    );
  }

  BoxDecoration boxd() {
    return BoxDecoration(
      // color: Colors.white,
      borderRadius: BorderRadius.circular(10), //border corner radius
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 201, 198, 198)
              .withOpacity(0.2), //color of shadow
          // spreadRadius: 5,
          blurRadius: 4,
          offset: Offset(1, 2),
        ),
      ],
    );
  }

  Text text1(text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'majallab'));
  }
}
