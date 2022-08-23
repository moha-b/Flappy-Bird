// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, empty_statements, unused_field, avoid_print
import 'dart:async';
import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Ui/Bird.dart';
import 'package:flappy_bird/Ui/Score.dart';
import 'package:flappy_bird/Ui/barrier.dart';
import 'package:flappy_bird/Ui/cover.dart';
import 'package:flappy_bird/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Bird Variables
  static double yAxis = 0;
  double time = 0;
  double height = 0;
  double gravity = -3.9; // How strong the Gravity
  double velocity = 2.5; // How strong the jump
  double initialHeight = yAxis;
  bool gameHasStarted = false; //TODO: Make it Global
  // Barrier Variables
  static List<double> barrierX = [2, 3.4];
  List<List<double>> barrierY = [
    // TODO: list of Lists to make different height for the barrier [topHeight,bottomHeight]
    [0.6, 0.4],
    [0.4, 0.6],
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/pics/background-day.png"),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Bird(yAxis),
                  // Tap to play text
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: Text(
                      gameHasStarted ? '' : 'TAP TO START',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Barrier(barrierY[0][0], barrierX[0], true),
                  Barrier(barrierY[0][1], barrierX[0], false),
                  Barrier(barrierY[1][0], barrierX[1], true),
                  Barrier(barrierY[1][1], barrierX[1], false),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: gameHasStarted? Score() :Cover(),
          ),
        ]),
      ),
    );
  }

  // Jump Function:
  void jump() {
    setState(() {
      time = 0;
      initialHeight = yAxis;
    });
  }

  //Start Game Function:
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 35), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        yAxis = initialHeight - height;
      });
      setState(() {
        if (barrierX[0] < -1.9) {
          barrierX[0] += 3.5;
        } else {
          barrierX[0] -= 0.05;
        }
      });
      setState(() {
        if (barrierX[1] < -1.9) {
          barrierX[1] += 3.5;
        } else {
          barrierX[1] -= 0.05;
        }
      });
      if (birdIsDead()) {
        timer.cancel();
        _showDialog();
      }
      ;
      time += 0.032;
    });
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (birdIsDead()) {
        timer.cancel();
        SCORE = 0;
      } else {
        setState(() {
          if (SCORE == TOP_SCORE) {
            TOP_SCORE++;
            // TODO: add the Top score to Database
            write(1, TOP_SCORE);
          }
          SCORE++;
        });
      }
    });
  }

  /*
  * TODO: Make sure the bird doesn't go out screen
  *
  * TODO: Check if the bird hit the barrier
  */
  bool birdIsDead() {
    // Screen
    if (yAxis > 1.26 || yAxis < -1.1) {
      return true;
    }
    // Barrier hit box
    for (int i = 0; i < barrierX.length; i++) {}
    return false;
  }

  void resetGame() {
    Navigator.pop(context); // dismisses the alert dialog
    setState(() {
      yAxis = 0;
      gameHasStarted = false;
      time = 0;
      SCORE = 0;
      initialHeight = yAxis;
      barrierX[0] = 2;
      barrierX[1] = 3.4;
    });
  }

  // TODO: Alert Dialog with 2 options (try again, exit)
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: Text(
            "..Oops",
            style: TextStyle(color: Colors.blue[900], fontSize: 25),
          ),
          actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
          content: Container(
            child: Lottie.asset("assets/pics/among-us.json",
                fit: BoxFit.cover),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              child: Text("Exit",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              onPressed: () => resetGame(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text("try again",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              onPressed: () => resetGame(),
            ),
          ],
        );
      },
    );
  }
}