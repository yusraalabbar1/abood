import 'package:abood/constant/colors.dart';
import 'package:flutter/material.dart';

abstract class CustomTheme {
  static get lightTheme {
    //1
    return ThemeData(
        fontFamily: 'Mukta',
        useMaterial3: true,
        primaryColor: Colors.black,
// buttonTheme: const ButtonThemeData(
//       buttonColor: Colors.deepPurple,     //  <-- dark color
//       textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
//     ),
        /////////////////////////////////////

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0.2,
          centerTitle: true,
          toolbarHeight: 183,
          // iconTheme: IconThemeData(color: Colors.black),
          iconTheme: IconThemeData(
              color: Colors.black, // <-- SEE HERE
              size: 30),

          titleTextStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'Nunito',
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        ///////////////////////////////////

        inputDecorationTheme: InputDecorationTheme(
          // iconColor: const Color(0xff6268F1),
          fillColor: Colors.white,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'majallab'),

          focusColor: Colors.white,
          hoverColor: Colors.white,
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1.5,
              )),

          // // hoverColor: Colors.white,
          filled: true,
          // disabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),
          //     borderSide: const BorderSide(
          //       color: Colors.white,
          //       width: 1.5,
          //     )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1.5,
              )),
        ),
        //////////////////////////////////////
        textTheme: TextTheme(
            headline6: TextStyle(color: Colors.grey[600]),
            headline3: const TextStyle(
              color: Colors.black,
              fontFamily: 'Almarai',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            headline1: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Almarai',
                fontSize: 25),
            headline4: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Almarai',
                fontSize: 14)));
  }
}
