// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'dart:async';
import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Layouts/Pages/page_start_screen.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_bird.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_barrier.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_cover.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../Constant/constant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition ;
      });
    });

//////////////////// audio2
    setAudio2();
    audio2.onAudioPositionChanged.listen((state) {
      setState(() {
        isPlaying2 = state == PlayerState.PLAYING;
      });
    });

    audio2.onDurationChanged.listen((newDuration) {
      setState(() {
        duration2 = newDuration;
      });
    });

    audio2.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position2 = newPosition ;
      });
    });

    ///////////////
    //////////////////// audio3
    setAudio3();
    audio3.onAudioPositionChanged.listen((state) {
      setState(() {
        isPlaying3 = state == PlayerState.PLAYING;
      });
    });

    audio3.onDurationChanged.listen((newDuration) {
      setState(() {
        duration3 = newDuration;
      });
    });

    audio3.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position3 = newPosition ;
      });
    });
  }

  Future setAudio() async{
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    final  player = AudioCache(prefix: 'assets/audio/');
    final url = await player.load('backgroundAudio.mp3');

    audioPlayer.setUrl(url.path,isLocal: true);
  }
  Future setAudio2() async{
    audio2.setReleaseMode(ReleaseMode.RELEASE);
    final  p2 = AudioCache(prefix: 'assets/audio/');
    final url2 = await p2.load('gameover.wav');

    audio2.setUrl(url2.path,isLocal: true);
  }

  Future setAudio3() async{
    audio3.setReleaseMode(ReleaseMode.RELEASE);
    final  p3 = AudioCache(prefix: 'assets/audio/');
    final url3 = await p3.load('point.mp3');

    audio3.setUrl(url3.path,isLocal: true);
  }

  @override

  void dispose(){
    audioPlayer.dispose();
    audio2.dispose();
    audio3.dispose();
    super.dispose();
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
              decoration: background(im),
              child: Stack(
                children: [
                  Bird(yAxis, birdWidth, birdHeight),
                  // Tap to play text
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: Text(
                      gameHasStarted ? '' : 'TAP TO START',
                      style: TextStyle(color: Colors.white, fontSize: 25,fontFamily: "Magic4"),
                    ),
                  ),
                  Barrier(barrierHeight[0][0], barrierWidth, barrierX[0], true),
                  Barrier(
                      barrierHeight[0][1], barrierWidth, barrierX[0], false),
                  Barrier(barrierHeight[1][0], barrierWidth, barrierX[1], true),
                  Barrier(barrierHeight[1][1], barrierWidth, barrierX[1], false),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    left: 1,
                    child: Container(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Score : $SCORE",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "Magic4"),), // Best TEXT
                        Text("Best : $TOP_SCORE",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "Magic4")),
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
            if (isPlaying3 == false)
            {
              audio3.resume();
            }
            TOP_SCORE++;
            // TODO: add the Top score to Database
            write(1, TOP_SCORE);
          }
          SCORE++;
          // print("Score : $SCORE, Best: $TOP_SCORE");
        });
      }
    });
  }

  ///TODO: Make sure the [Bird] doesn't go out screen & hit the barrier
  bool birdIsDead() {
    // Screen
    if (yAxis > 1.26 || yAxis < -1.1) {
   /// Game Over Audio Plays in case bird dies
      if (isPlaying2 == false)
      {
        audio2.resume();
      }
      return true;
    }

    /// Barrier hitBox
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          (barrierX[i] + (barrierWidth)) >= birdWidth &&
          (yAxis <= -1 + barrierHeight[i][0] ||
              yAxis + birdHeight >= 1 - barrierHeight[i][1])) {
        if (isPlaying2== false)
        {
          audio2.resume();
        }
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
            style: TextStyle(color: Colors.blue[900], fontSize: 35,fontFamily: "Magic4"),
          ),
          actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
          content: Container(

            child: Lottie.asset("assets/pics/loss.json",
                fit: BoxFit.cover),

          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              child: Text("Exit",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              onPressed: () async {
        if (isPlaying == true)  {
        await audioPlayer.pause();
        }
                resetGame();
                Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen(),));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text("try again",
                  style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: "Magic4")),
              onPressed: () => resetGame()
            ),
          ],
        );
      },
    );
  }
}