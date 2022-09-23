// // ignore_for_file: prefer_const_constructors
//
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import '../Pages/page_start_screen.dart';
//
// class GameAlert extends StatelessWidget {
//   VoidCallback reset;
//   GameAlert({required this.reset, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       shape:
//       RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//       title: Text(
//         "..Oops",
//         style: TextStyle(color: Colors.blue[900], fontSize: 35,fontFamily: "Magic4"),
//       ),
//       actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
//       content: Container(
//
//         child: Lottie.asset("assets/pics/loss.json",
//             fit: BoxFit.cover),
//
//       ),
//       actions: [
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: Colors.grey,
//           ),
//           child: Text("Exit",
//               style: TextStyle(color: Colors.white, fontSize: 17)),
//           onPressed: () => add(context),
//         ),
//         ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               primary: Colors.green,
//             ),
//             child: Text("try again",
//                 style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: "Magic4")),
//             onPressed: () => reset
//         ),
//       ],
//     );
//
//   }
//
//   void add(context){
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) => StartScreen(),));
//     reset;
//   }
// }
