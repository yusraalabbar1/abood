import 'package:abood/constant/colors.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/other/widget/dialog_guest.dart';
import 'package:abood/view/user/other/widget/dialogs_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          color: Colors.white, fontSize: 20, fontFamily: 'majallab'));
}

Text text3(text) {
  return Text(text,
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontFamily: 'majallab'));
}

Drawer drawermain(context) {
  return Drawer(
    child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              Center(child: text1("ABOOD")),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("Term");
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Icon(
                          Icons.add_moderator,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Container(child: text2("Terms and Conditions".tr))
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(
                        Icons.security,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    Container(child: text2("Privacy policy".tr))
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("Privecy");
                },
              ),
              InkWell(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(
                        Icons.security,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    Container(child: text2("protection".tr))
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("Protect");
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("about");
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Icon(
                          Icons.person_pin_sharp,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Container(child: text2("About Us".tr))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("contect");
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Icon(
                          Icons.mobile_friendly,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Container(child: text2("Contact Us".tr))
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  // showLoadingLang(context);
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(
                        Icons.language,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    Container(child: text2("Languages".tr))
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  guest != true
                      ? showLoadingLogout(context)
                      : diaGuest(context);
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(
                        Icons.logout,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    Container(child: text2("Log out".tr))
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  // showLoadingDelet(context);
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(
                        Icons.delete_forever,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    Container(child: text2("Delete Account"))
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}
