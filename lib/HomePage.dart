import 'dart:async';

import 'package:flutter/material.dart';

import 'bird.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdy=0;
  double time=0;
  double height=0;
  double startheight=birdy;
  bool gamehasStarted=false;
  void jump(){
    setState(() {
      time=0;
      startheight=birdy;
    });

  }
  void startgame(){
    gamehasStarted=true;
    Timer.periodic(Duration(microseconds:60 ), (timer) {
      time+=0.05;
      height=-4.9*time*time+2.8*time;
      setState(() {
        birdy=startheight-height;
      });
      if(birdy>1){
        timer.cancel();
        gamehasStarted=false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          GestureDetector(
            onTap: (){
              if(gamehasStarted){
                jump();
              }
              else{
                startgame();
              }
            },
            child: AnimatedContainer(
              alignment: Alignment(0,birdy),
              duration: Duration(microseconds: 0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage("pics/background-day.png"))),
              child: bird(),

            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Score",style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 20), ),
                    Text("0",style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 20), ),
                  ],
                ),
                Column(
                  children: [
                    Text("Best",style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 20), ),
                    Text("10",style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 20), ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),

    );
  }
}
