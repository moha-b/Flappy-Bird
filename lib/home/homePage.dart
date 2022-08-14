// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  // TODO: implementation the Bird
  Container Bird(){
    return Container(
      height: 60,
      width: 60,
      child: Image.asset("assets/images/bird.png"),
    );
  }
  // TODO: implementation the Barrier
  Container Barrier(double height){
    return Container(
      width: 100,
      height: height,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(width: 10,color: Colors.lightGreenAccent,),
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}
