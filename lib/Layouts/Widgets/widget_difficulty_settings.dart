// ignore_for_file: prefer_const_constructors

import 'package:flappy_bird/Global/Function/functions.dart';
import 'package:flutter/material.dart';

import '../../Global/Constant/constant.dart';


class DifficultySettings extends StatelessWidget {
  const DifficultySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.026),
      child: Column(
        children: [
          Container(margin: EdgeInsets.symmetric(vertical: 10),
              child: myText("Difficulty",Colors.black,20)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              gameButton(() { barrierMovement = 0.05 ; }, "Easy", Colors.green.shade300),
              gameButton(() { barrierMovement = 0.08 ; }, "Medium", Colors.yellow.shade700),
              gameButton(() { barrierMovement = 0.01 ; }, "Hard", Colors.red.shade300),
            ],
          ),
        ],
      ),
    );
  }
}