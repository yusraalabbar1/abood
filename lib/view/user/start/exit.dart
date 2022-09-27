import 'package:abood/constant/colors.dart';
import 'package:flutter/material.dart';

// onwillPop(context) async {
//   return (await showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           backgroundColor: Colors.black,
//           title: Center(
//             child: Text('الخروج من التطبيق',
//                 style: TextStyle(
//                     color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
//           ),
//           content: Text(' هل أنت متأكد من الخروج',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
//           actions: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: RaisedButton(
//                     color: Color.fromARGB(255, 240, 245, 246),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         side: BorderSide(color: Colors.white, width: 2)),
//                     child: Text("الرئيسية",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 13,
//                             fontFamily: 'Almarai')),
//                     onPressed: () {
//                       Navigator.of(context).pushReplacementNamed("welcom");
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: RaisedButton(
//                     color: MyColors.color1,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         side: BorderSide(color: MyColors.color1, width: 2)),
//                     child: Text("نعم",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 13,
//                             fontFamily: 'Almarai')),
//                     onPressed: () {
//                       Navigator.of(context).pop(true);
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: RaisedButton(
//                     color: Color.fromARGB(255, 231, 38, 64),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         side: BorderSide(
//                             color: Color.fromARGB(255, 231, 38, 64), width: 2)),
//                     child: Text("لا",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 13,
//                             fontFamily: 'Almarai')),
//                     onPressed: () {
//                       Navigator.of(context).pop(false);
//                     },
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       )) ??
//       false;
// }
