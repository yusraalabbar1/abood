import 'package:abood/view/user/start/rout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isLogin;
int? typeUser;
String? language;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  isLogin = preferences.getBool("isLogin");
  typeUser = preferences.getInt("userType");
  language = preferences.getString("lang");
  print(preferences.getString("lang"));
  print(preferences.getBool("isLogin"));
  print(preferences.getInt("userType"));
  runApp(MyApp());
}
