// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';

/// SCORE Variables calculated in function [startGame] in [GamePage]
int score = 0;
int topScore = 0;

/// [Bird] Variables
double yAxis = 0;
double birdWidth = 0.183;
double birdHeight = 0.183;

/// Variables to calculate bird movements function [startGame] in [GamePage]
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
double barrierMovement = 0.05;

/// Screen Boundary
double screenEnd = -1.9;
double screenStart = 3.5;
/// audio
final player = AudioPlayer();
bool play = true;