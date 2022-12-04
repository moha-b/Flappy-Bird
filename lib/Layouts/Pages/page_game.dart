// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, avoid_print
import 'dart:async';
import 'package:flappy_bird/Layouts/Pages/page_start_screen.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_bird.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_barrier.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_cover.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../Database/database.dart';
import '../../Global/constant.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);
  @override
  State<GamePage> createState() => _GamePageState();
}
class _GamePageState extends State<GamePage> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: background(Str.image),
              child: Stack(
                children: [
                  Bird(yAxis, birdWidth, birdHeight),
                  // Tap to play text
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: myText(gameHasStarted ? '' : 'TAP TO START',Colors.white,25),
                  ),
                  Barrier(barrierHeight[0][0], barrierWidth, barrierX[0], true),
                  Barrier(barrierHeight[0][1], barrierWidth, barrierX[0], false),
                  Barrier(barrierHeight[1][0], barrierWidth, barrierX[1], true),
                  Barrier(barrierHeight[1][1], barrierWidth, barrierX[1], false),
                  Positioned(
                    bottom: 1, right: 1, left: 1,
                    child: Container(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Score : $score",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "Magic4"),), // Best TEXT
                        Text("Best : $topScore",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "Magic4")),
                      ],
                    ),),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Cover(),
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
          barrierX[0] -= barrierMovement;
        }
      });
      setState(() {
        if (barrierX[1] < screenEnd) {
          barrierX[1] += screenStart;
        } else {
          barrierX[1] -= barrierMovement;
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
        // Todo : save the top score in the database  <---
        write("score", topScore);
        timer.cancel();
        score = 0;
      } else {
        setState(() {
          if (score == topScore) {
            topScore++;
          }
          score++;
        });
      }
    });
  }

  /// Make sure the [Bird] doesn't go out screen & hit the barrier
  bool birdIsDead() {
    // Screen
    if (yAxis > 1.26 || yAxis < -1.1) {
      return true;
    }
    /// Barrier hitBox
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          (barrierX[i] + (barrierWidth)) >= birdWidth &&
          (yAxis <= -1 + barrierHeight[i][0] ||
              yAxis + birdHeight >= 1 - barrierHeight[i][1])) {

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
      score = 0;
      initialHeight = yAxis;
      barrierX[0] = 2;
      barrierX[1] = 3.4;
    });
  }

  // TODO: Alert Dialog with 2 options (try again, exit)
  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: myText("..Oops", Colors.blue[900], 35),
          actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
          content: Container(
            child: Lottie.asset("assets/pics/loss.json",
                fit: BoxFit.cover),
          ),
          actions: [
            gameButton(() {
              resetGame();
              Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen(),));
            }, "Exit", Colors.grey),
            gameButton(() {
              resetGame();
            }, "try again", Colors.green),
          ],
        );
      },
    );
  }
}