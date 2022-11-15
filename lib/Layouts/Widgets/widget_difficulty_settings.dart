// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Constant/constant.dart';

class DifficultySettings extends StatelessWidget {
  const DifficultySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Container(margin: EdgeInsets.only(top: 20,bottom: 10),child: Text("Difficulty",style: TextStyle(fontSize: 20,fontFamily: "Magic4"))),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              barrierMovement = 0.05 ;
            },
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade300,
              ), child: Text("Easy",style: TextStyle(fontSize: 20,fontFamily: "Magic4")),),
            ElevatedButton(onPressed: (){
              barrierMovement = 0.08 ;
            },style: ElevatedButton.styleFrom(
              primary: Colors.yellow.shade700,
            ), child: Text("Medium",style: TextStyle(fontSize: 20,fontFamily: "Magic4")),),
            ElevatedButton(onPressed: (){
              barrierMovement = 0.1 ;
            },
              style: ElevatedButton.styleFrom(
                primary: Colors.red.shade300,
              ), child: Text("Hard",style: TextStyle(fontSize: 20,fontFamily: "Magic4")),),
          ],
        ),
      ],
    );
  }
}
