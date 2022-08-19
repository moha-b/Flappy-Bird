// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers
import 'dart:async';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static double yAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = yAxis;
  bool gameHasStarted = false;

  // TODO:
  void jump() {
    setState((){
      time = 0;
      initialHeight = yAxis;

    });

  }
  // TODO:
  void startGame(){
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState((){
        yAxis = initialHeight - height;
      });
      if(yAxis > 3.5){
        timer.cancel();
        gameHasStarted = false;
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Expanded(
              flex: 2,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(gameHasStarted){
                          jump();
                        }else{
                          startGame();
                        }
                      },
                      child: AnimatedContainer(
                          alignment: Alignment(0,yAxis),
                          duration: Duration(milliseconds: 0),
                          color: Colors.blue,
                          child: bird()),
                    ),
                    // Container(
                    //   child: Text("TAP TO START"),
                    // ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Score",style: TextStyle(color: Colors.white,fontSize: 30),),
                      SizedBox(height: 10,),
                      Text("0",style: TextStyle(color: Colors.white,fontSize: 30)),
                    ],),
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
    );
  }
Container bird(){
    return Container(
        height: 130,
        width: 130 ,
        child: Image.asset("assets/pics/bird.png",)
    );;
}
  Container barrier(double size){
    return Container(
        height: 130,
        width: size,
        decoration: BoxDecoration(
          color: Colors.green,
        ),
    );
  }
}
