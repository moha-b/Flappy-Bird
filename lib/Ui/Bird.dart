// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../constant/constant.dart';

class Bird extends StatelessWidget {
  final double yAxis;
  final double birdWidth;
  final double birdHeight;

  Bird(this.yAxis, this.birdWidth, this.birdHeight);
  String setbird(){
    if(c==Colors.yellow){
      return"assets/pics/bird.png";
    }
    else if(c==Colors.blue){
      return"assets/pics/bluebird.png";
    }
    else
      return"assets/pics/redbird.png";
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      alignment: Alignment(0, (2 * yAxis + birdHeight) / (2- birdHeight)),
      duration: Duration(milliseconds: 0),
      child: Image.asset(
        setbird(),
        width: size.width * birdWidth,
        height: size.height * birdHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}