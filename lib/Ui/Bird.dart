// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class Bird extends StatefulWidget {
  double yAxis;
  Bird(this.yAxis, {Key? key}) : super(key: key);

  @override
  State<Bird> createState() => _BirdState();
}

class _BirdState extends State<Bird> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      alignment: Alignment(0,widget.yAxis),
      duration: Duration(milliseconds: 0),
      child: Image.asset("assets/pics/bird.png",width: size.width * 0.4,height: size.height * 0.2,),);
  }
}