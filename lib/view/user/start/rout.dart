import 'dart:io';

import 'package:abood/controller/ControlUser.dart';
import 'package:abood/main.dart';
import 'package:abood/model/user/stor/items/get_items_id.dart';
import 'package:abood/model/user/stor/stor_item/stor_item_model.dart';
import 'package:abood/translation/translation.dart';
import 'package:abood/view/admin/add_offer.dart';
import 'package:abood/view/admin/add_product.dart';
import 'package:abood/view/admin/allItem.dart';
import 'package:abood/view/admin/allItemAddImage.dart';
import 'package:abood/view/admin/allItemDelete.dart';
import 'package:abood/view/admin/allItemEdit.dart';
import 'package:abood/view/admin/all_item_offer.dart';
import 'package:abood/view/admin/delet_item.dart';
import 'package:abood/view/admin/edit_item.dart';
import 'package:abood/view/admin/mainWelcom.dart';
import 'package:abood/view/admin/main_screen_stor.dart';
import 'package:abood/view/admin/notification.dart';
import 'package:abood/view/admin/pick_color.dart';
import 'package:abood/view/admin/picker_mu_image.dart';
import 'package:abood/view/admin/search_item.dart';
import 'package:abood/view/admin/start_stor.dart';
import 'package:abood/view/admin/stor_add.dart';
import 'package:abood/view/admin/stor_by_merch.dart';
import 'package:abood/view/user/auth/complet_forget.dart';
import 'package:abood/view/user/auth/forget_otp.dart';
import 'package:abood/view/user/auth/forget_password.dart';
import 'package:abood/view/user/auth/login.dart';
import 'package:abood/view/user/auth/signup.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/auth/otp_sigup.dart';
import 'package:abood/view/user/auth/new_passw.dart';
import 'package:abood/view/user/other/Notif/notification.dart';
import 'package:abood/view/user/other/home_page.dart';
import 'package:abood/view/user/other/like/my_like.dart';
import 'package:abood/view/user/other/myCart/add_copon.dart';
import 'package:abood/view/user/other/myCart/complet_cart.dart';
import 'package:abood/view/user/other/myCart/mycart.dart';
import 'package:abood/view/user/other/myCateg/offer..dart';
import 'package:abood/view/user/other/myCateg/sub2cat.dart';
import 'package:abood/view/user/other/myCateg/sub_cat.dart';
import 'package:abood/view/user/other/myHome/search_user.dart';
import 'package:abood/view/user/other/myNew/new.dart';
import 'package:abood/view/user/other/myOrders/my_order.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:abood/view/user/other/profile/edit_pass.dart';
import 'package:abood/view/user/other/setting/about.dart';
import 'package:abood/view/user/other/setting/contact.dart';
import 'package:abood/view/user/other/setting/privacy.dart';
import 'package:abood/view/user/other/setting/protect.dart';
import 'package:abood/view/user/other/setting/term.dart';
import 'package:abood/view/user/start/finish_register.dart';
import 'package:abood/view/user/start/lang.dart';
import 'package:abood/view/user/start/thems.dart';
import 'package:abood/view/user/start/welcom.dart';
import 'package:abood/view/user/start/welcom2.dart';
import 'package:abood/view/user/start/welcom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

String local = "en";

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Homecontroller controller = Get.put(Homecontroller());
  StatefulWidget pageRout = const welcom();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: language != null
          ? Locale(language!)
          : Locale(Platform.localeName.substring(0, 2)),
      translations: Translation(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        final routName = settings.name;
        if (routName != null) {
          print(routName);
          print(routName.split('=').last);
          int id = int.parse(routName.toString().split('=').last);
          setState(() {
            pageRout = particulerProduct(id: id);
          });
        }
      },
      home: pageRout,
      theme: CustomTheme.lightTheme,
      routes: {
        "welcom": ((context) => const welcom()),
        "welcomHome": ((context) => welcomHome()),
        "welcomStore": ((context) => welcomStore()),
        "OnboardingWelcom": ((context) => const OnboardingWelcom()),
        "forgetPasswordNumber": ((context) => const forgetPasswordNumber()),
        "startAccount": ((context) => const startAccount()),
        "OtpForget": ((context) => OtpForget()),
        "login": ((context) => login()),
        "StorByMerch": ((context) => StorByMerch()),
        "notificationStore": ((context) => notificationStore()),
        "signup": ((context) => signup()),
        "Term": ((context) => Term()),
        "Privecy": ((context) => Privecy()),
        "Protect": ((context) => Protect()),
        "about": ((context) => about()),
        "contect": ((context) => contect()),
        "otpSignup": ((context) => otpSignup()),
        "SubCat": ((context) => SubCat()),
        "offer": ((context) => offer()),
        "myOrders": ((context) => myOrders()),
        "searchProduct": ((context) => searchProduct()),
        "forgetPassword": ((context) => forgetPassword()),
        "New": ((context) => New()),
        "completForget": ((context) => completForget()),
        "finishRegister": ((context) => finishRegister()),
        "MyCart": ((context) => MyCart()),
        "AddCopon": ((context) => AddCopon()),
        "lang": ((context) => lang()),
        "editPassword": ((context) => editPassword()),
        "homePage": ((context) => homePage()),
        "myLike": ((context) => myLike()),
        "MainScreenStor": ((context) => MainScreenStor()),
        "StartStore": ((context) => StartStore()),
        "AllItemsStoreoffer": ((context) => AllItemsStoreoffer()),
        "particulerProduct": ((context) => particulerProduct()),
        "AddProduct": ((context) => AddProduct()),
        "StorByMerchAdd": ((context) => StorByMerchAdd()),
        "searchProductUser": ((context) => searchProductUser()),
        "CompletCart": ((context) => CompletCart()),
        "notification": ((context) => notification()),
        "EditItem": ((context) => EditItem(
              pass: StorItemsData(),
            )),
        "AddOffer": ((context) => AddOffer(
              id: null,
            )),
        "DeletItem": ((context) => DeletItem(
              pass: StorItemsData(),
            )),
        "picColor": ((context) => picColor()),
        "muImage": ((context) => muImage(
              id: null,
            )),
        "AllItemsStore": ((context) => AllItemsStore()),
        "AllItemsStoreEdit": ((context) => AllItemsStoreEdit()),
        "AllItemsStoreAddIMg": ((context) => AllItemsStoreAddIMg()),
        "AllItemsStoreDelet": ((context) => AllItemsStoreDelet()),
        "notification": ((context) => notification()),
        "Sub2cat": ((context) => Sub2cat(
              id: null,
            )),
      },
    );
  }

  monthly() {}
}
