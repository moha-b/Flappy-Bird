// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, empty_statements, unused_field, avoid_print, prefer_const_constructors_in_immutables
import 'dart:async';
import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Ui/Bird.dart';
import 'package:flappy_bird/Ui/Score.dart';
import 'package:flappy_bird/Ui/barrier.dart';
import 'package:flappy_bird/Ui/cover.dart';
import 'package:flappy_bird/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String settheme(){
    if(theme ==true){
      return"assets/pics/background-day.png";
    }
    else
      return"assets/pics/background-night.png";
  }
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
                      image: AssetImage(settheme()),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Bird(yAxis, birdWidth, birdHeight),
                  // Tap to play text
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: Text(
                      gameHasStarted ? '' : 'TAP TO START',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Barrier(barrierHeight[0][0], barrierWidth, barrierX[0], true),
                  Barrier(barrierHeight[0][1], barrierWidth, barrierX[0], false),
                  Barrier(barrierHeight[1][0], barrierWidth, barrierX[1], true),
                  Barrier(barrierHeight[1][1], barrierWidth, barrierX[1], false),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: gameHasStarted ? Score() : Cover(),
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
      /* <  Barriers Movements  > */
      setState(() {
        if (barrierX[0] < screenEnd) {
          barrierX[0] += screenStart;
        } else {
          barrierX[0] -= moveToLeft;
        }
      });
      setState(() {
        if (barrierX[1] < screenEnd) {
          barrierX[1] += screenStart;
        } else {
          barrierX[1] -= moveToLeft;
        }
      });
      if (birdIsDead()) {
        timer.cancel();
        _showDialog();
      }
      time += 0.032;
    });
    /* <  Calculate Score  > */
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

  ///TODO: Make sure the [Bird] doesn't go out screen & hit the barrier
  bool birdIsDead() {
    // Screen
    if (yAxis > 1.26 || yAxis < -1.1) {
      return true;
    }
    /// Barrier hitBox
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          (barrierX[i] + (barrierWidth)) >= birdWidth &&
          (yAxis <= -1 + barrierHeight[i][0] || yAxis + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }
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