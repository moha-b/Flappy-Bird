// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Barrier extends StatefulWidget {
  double height;
  double Axis;
  double direction;
  Barrier(this.height, this.Axis, this.direction, {Key? key}) : super(key: key);

  @override
  State<Barrier> createState() => _BarrierState();
}

class _BarrierState extends State<Barrier> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment(widget.Axis,widget.direction),
      duration: Duration(milliseconds: 0),
      child: Container(
        height: widget.height,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.green[800],
          border: Border.all(width: 10,color: Colors.lightGreen),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}