// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Barrier extends StatefulWidget {
  final double height;
  final bool isTop;
  final double direction;
  Barrier(this.height, this.direction, this.isTop, {Key? key}) : super(key: key);

  @override
  State<Barrier> createState() => _BarrierState();
}

class _BarrierState extends State<Barrier> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      alignment: Alignment(widget.direction,widget.isTop ? 1.1 : -1.1),
      duration: Duration(milliseconds: 0),
      child: Container(
        height: widget.height * size.height - 170,
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