// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double barrierHeight;
  final double barrierWidth;
  final bool isTop;
  final double direction;


  Barrier(this.barrierHeight, this.barrierWidth,this.direction, this.isTop);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      alignment: Alignment((2 * direction + barrierWidth) /  (2 - barrierWidth),isTop ? 1.1 : -1.1),
      duration: Duration(milliseconds: 0),
      child: Container(
        height: size.height * 3 / 4 * barrierWidth / 2,
        width: size.width * barrierWidth / 2,
        decoration: BoxDecoration(
          color: Colors.green[800],
          border: Border.all(width: 10,color: Colors.lightGreen),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}