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
import 'package:abood/view/admin/stor_by_merch.dart';
import 'package:abood/view/user/auth/complet_forget.dart';
import 'package:abood/view/user/auth/forget_password.dart';
import 'package:abood/view/user/auth/login.dart';
import 'package:abood/view/user/auth/signup.dart';
import 'package:abood/view/user/auth/start_account.dart';
import 'package:abood/view/user/auth/otp_sigup.dart';
import 'package:abood/view/user/other/Notif/notification.dart';
import 'package:abood/view/user/other/home_page.dart';
import 'package:abood/view/user/other/like/my_like.dart';
import 'package:abood/view/user/other/myCart/complet_cart.dart';
import 'package:abood/view/user/other/myCart/mycart.dart';
import 'package:abood/view/user/other/myCateg/offer..dart';
import 'package:abood/view/user/other/myCateg/sub2cat.dart';
import 'package:abood/view/user/other/myCateg/sub_cat.dart';
import 'package:abood/view/user/other/myNew/new.dart';
import 'package:abood/view/user/other/particuler_product.dart';
import 'package:abood/view/user/other/profile/edit_pass.dart';
import 'package:abood/view/user/start/finish_register.dart';
import 'package:abood/view/user/start/lang.dart';
import 'package:abood/view/user/start/thems.dart';
import 'package:abood/view/user/start/welcom.dart';
import 'package:abood/view/user/start/welcom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //isLogin == true ? welcomHome() :

      home: welcom(),
      theme: CustomTheme.lightTheme,
      routes: {
        "welcom": ((context) => welcom()),
        "welcomHome": ((context) => welcomHome()),
        "welcomStore": ((context) => welcomStore()),
        "startAccount": ((context) => startAccount()),
        "login": ((context) => login()),
        "StorByMerch": ((context) => StorByMerch()),
        "notificationStore": ((context) => notificationStore()),
        "signup": ((context) => signup()),
        "otpSignup": ((context) => otpSignup()),
        "SubCat": ((context) => SubCat()),
        "offer": ((context) => offer()),
        "searchProduct": ((context) => searchProduct()),
        "forgetPassword": ((context) => forgetPassword()),
        "New": ((context) => New()),
        "completForget": ((context) => completForget()),
        "finishRegister": ((context) => finishRegister()),
        "MyCart": ((context) => MyCart()),
        "lang": ((context) => lang()),
        "editPassword": ((context) => editPassword()),
        "homePage": ((context) => homePage()),
        "myLike": ((context) => myLike()),
        "MainScreenStor": ((context) => MainScreenStor()),
        "StartStore": ((context) => StartStore()),
        "AllItemsStoreoffer": ((context) => AllItemsStoreoffer()),
        "particulerProduct": ((context) => particulerProduct()),
        "AddProduct": ((context) => AddProduct()),
        "CompletCart": ((context) => CompletCart()),
        "EditItem": ((context) => EditItem(
              id: null,
            )),
        "AddOffer": ((context) => AddOffer(
              id: null,
            )),
        "DeletItem": ((context) => DeletItem(
              id: null,
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
      // locale: Locale("ar"),
      // translations: Translation(),
    );
  }

  monthly() {}
}
