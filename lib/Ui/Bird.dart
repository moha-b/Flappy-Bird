// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  final double yAxis;
  final double birdWidth;
  final double birdHeight;

  Bird(this.yAxis, this.birdWidth, this.birdHeight);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      alignment: Alignment(0, (2 * yAxis + birdHeight) / (2- birdHeight)),
      duration: Duration(milliseconds: 0),
      child: Image.asset(
        "assets/pics/bird.png",
        width: size.height * birdWidth / 2,
        height: size.height * 3 / 4 * birdHeight / 2,
        fit: BoxFit.fill,
      ),
    );
  }
}