// ignore_for_file: prefer_const_constructors

import 'package:flappy_bird/Resources/strings.dart';
import 'package:flutter/material.dart';

import '../Database/database.dart';
import 'constant.dart';

Text myText(String txt, Color? color, double size){
  return Text(
    txt,
    style: TextStyle(
        fontSize: size,
        fontFamily: "Magic4",
        color: color
    ),
  );
}

ElevatedButton gameButton(VoidCallback? onPress, String txt, Color color){
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(primary: color),
    child: myText(txt,Colors.white,20),
  );
}

BoxDecoration frame(){
  return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black, width: 2),
      color: Colors.white54,
      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.6),blurRadius: 1.0,offset: Offset(5,5))]);
}

BoxDecoration background(String y){
  return BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/pics/$y.png"),
        fit: BoxFit.fill),
  );
}

AlertDialog dialog(BuildContext context){
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
    title: myText("About Flappy Bird",Colors.black, 22),
    content: Text(Res.about, style: TextStyle(fontFamily: "Magic4"),),
    actions: [
      gameButton(() {Navigator.pop(context);}, "Okay", Colors.deepOrange),
    ],
  );
}

void initial() {
  if(read("score") != null){
    topScore = read("score");
  }else{
    write("score", topScore);
  }
  if(read("background") != null){
    im = read("background");
  }else{
    write("background", im);
  }
  if(read("bird") != null){
    bird = read("bird");
  }else{
    write("bird", bird);
  }
  if(read("level") != null){
    barrierMovement = read("level");
  }else{
    write("level", barrierMovement);
  }
}

void navigate(context,navigate){
  switch(navigate){
    case Res.gamePage:
      Navigator.pushNamed(context, Res.gamePage);
      break;
    case Res.settings:
      Navigator.pushNamed(context, Res.settings);
      break;
    case Res.rateUs:
      Navigator.pushNamed(context, Res.rateUs);
      break;
  }
}