// ignore_for_file: prefer_const_constructors

import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Layouts/Pages/page_settings.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_Button.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_bird.dart';
import 'package:flappy_bird/Layouts/Pages/page_home.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_barrier.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

/// SCORE Variables calculated in function [startGame] in [HomePage]
int SCORE = 0;
int TOP_SCORE = 0;

/// [Bird] Variables
double yAxis = 0;
double birdWidth = 0.183;
double birdHeight = 0.183;

/// Variables to calculate bird movements function [startGame] in [HomePage]
double time = 0;
double height = 0;
double gravity = -3.9; // How strong the Gravity
double velocity = 2.5; // How strong the jump
double initialHeight = yAxis;
bool gameHasStarted = false;

/// [Barrier] Variables
List<double> barrierX = [2, 3.4];
double barrierWidth = 0.5;
List<List<double>> barrierHeight = [
  // TODO: list of Lists to make different height for the barrier [topHeight,bottomHeight]
  [0.6, 0.4],
  [0.4, 0.6],
];
double moveToLeft = 0.05;

/// Screen Boundary
double screenEnd = -1.9;
double screenStart = 3.5;

///[Settings] Variables
bool theme = true;
Color c = Colors.yellow;

/// Background Music
final audioPlayer = AudioPlayer();
bool isPlaying = false;
Duration duration = Duration.zero;
Duration position = Duration.zero;


///////////////////  GameOver audio
final audio2 = AudioPlayer();
bool isPlaying2 = false;
Duration duration2 = Duration.zero;
Duration position2 = Duration.zero;



////////////////////  Point audio
final audio3 = AudioPlayer();
bool isPlaying3 = false;
Duration duration3 = Duration.zero;
Duration position3 = Duration.zero;

/// to decide which page that class [Button] will navigate
enum Navigation{ home, settings, leaderBord }

//
String about = "The game is a side-scroller where the player"
    " controls a bird, attempting to fly between "
    " columns of green pipes without hitting them";
String im = "0";
BoxDecoration background(String y){
  return BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/pics/$y.png"),
        fit: BoxFit.fill),
  );
}
String bird = "assets/pics/bird.png";