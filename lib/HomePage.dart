// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, empty_statements
import 'dart:async';
import 'package:flappy_bird/barrier.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Bird Variables
  static double yAxis = 0;
  static double xAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = yAxis;
  // game setting
  bool gameHasStarted = false;
  // Barriers Variables
  static double barrierX1 = 2;
  double barrierX2 = barrierX1 + 1.2;

  // Jump Function:
  void jump() {
    setState((){
      time = 0;
      initialHeight = yAxis;
    });
  }

  //Start Game Function:
  void startGame(){
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState((){
        yAxis = initialHeight - height;
      });
      setState(() {
        if(barrierX1 < -1.9){
          barrierX1 += 3.5;
        }else{
          barrierX1 -= 0.05;
        }
      });
      setState(() {
        if(barrierX2 < -1.9){
          barrierX2 += 3.5;
        }else{
          barrierX2 -= 0.05;
        }
      });
      if(yAxis > 1.109){
        timer.cancel();
        gameHasStarted = false;
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(gameHasStarted){
          jump();
        }else{
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                        alignment: Alignment(0,yAxis),
                        duration: Duration(milliseconds: 0),
                        color: Colors.blue,
                        child: bird()),

                    // Tap to play text
                    Container(
                      alignment: Alignment(0, -0.3),
                      child: gameHasStarted ? Text(" ") :Text("TAP TO START",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    buildBarrier(150, barrierX1, 1.1),
                    buildBarrier(250, barrierX1,-1.1),
                    buildBarrier(150, barrierX2, 1.1),
                    buildBarrier(100, barrierX2,-1.1),
                  ],
                ),
              ),
              Container(
                height: 15,
                color: Colors.green,
              ),
              Expanded(
                  flex: 1,
                  child: Container(color: Colors.brown,child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        // Score TEXT
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Score",style: TextStyle(color: Colors.white,fontSize: 30),),
                          SizedBox(height: 10,),
                          Text("0",style: TextStyle(color: Colors.white,fontSize: 30)),
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
                  ),)),

            ]),
      ),
    );
  }
// Build Barriers Function
  AnimatedContainer buildBarrier(double height, double Axis, double direction) {
    return AnimatedContainer(
      alignment: Alignment(Axis,direction),
      duration: Duration(milliseconds: 0),
      child: Barrier(height),);
  }

  // Bird Image
  Container bird(){
    return Container(
        height: 130,
        width: 130 ,
        child: Image.asset("assets/pics/bird.png",)
    );
  }
}