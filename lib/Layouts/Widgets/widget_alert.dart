// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import '../../Constant/constant.dart';

class Alert extends StatelessWidget {
  Alert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
      title: Text(
        "About Flappy Bird",
        style: TextStyle(fontSize: 22,fontFamily: "Magic4"),
      ),
      content: Text(
        about,
        style: TextStyle(fontFamily: "Magic4"),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
          ),
          child: Text(
            "okay",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Magic4",
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
//AlertDialog(
//           backgroundColor: Colors.white,
//           shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           title: Text(
//             "..Oops",
//             style: TextStyle(color: Colors.blue[900], fontSize: 25),
//           ),
//           actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
//           content: Container(
//             child: Lottie.asset("assets/pics/among-us.json",
//                 fit: BoxFit.cover),
//           ),
//           actions: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.grey,
//               ),
//               child: Text("Exit",
//                   style: TextStyle(color: Colors.white, fontSize: 17)),
//               onPressed: () => resetGame(),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.green,
//               ),
//               child: Text("try again",
//                   style: TextStyle(color: Colors.white, fontSize: 17)),
//               onPressed: (){
//                 Navigator.pop(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => StartScreen(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         );
