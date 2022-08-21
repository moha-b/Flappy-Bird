// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  final int score;
  Score(this.score, {Key? key}) : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.brown,child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          // Score TEXT
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Score",style: TextStyle(color: Colors.white,fontSize: 30),),
            SizedBox(height: 10,),
            Text(widget.score.toString(),style: TextStyle(color: Colors.white,fontSize: 30)),
          ],),
        // Best TEXT
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Best",style: TextStyle(color: Colors.white,fontSize: 30)),
            SizedBox(height: 10,),
            Text("0",style: TextStyle(color: Colors.white,fontSize: 30)),
          ],),
      ],
    ),);
  }
}