import 'package:flutter/material.dart';

class Barrier extends StatefulWidget {
  double height;
  Barrier(this.height, {Key? key}) : super(key: key);

  @override
  State<Barrier> createState() => _BarrierState();
}

class _BarrierState extends State<Barrier> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.green[800],
          border: Border.all(width: 10,color: Colors.lightGreen)
          ,borderRadius: BorderRadius.circular(16)
      ),
    );
  }

}