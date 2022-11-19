// ignore_for_file: avoid_print

import 'package:hive_flutter/hive_flutter.dart';

void write(String id, dynamic value) async{
  final myBox = Hive.box('user');
  switch(id){
    case "score":
      myBox.put("score", value);
      break;
    case "background":
      myBox.put("background", value);
      break;
    case "bird":
      myBox.put("bird", value);
      print("bird is Activated");
      break;
    case "level":
      myBox.put("level", value);
      break;
    case "audio":
      myBox.put("audio", value);
      break;
  }
}

dynamic read(String id){
  final myBox = Hive.box('user');
  dynamic value;
  switch(id){
    case "score":
      value = myBox.get("score");
      break;
    case "background":
      value = myBox.get("background");
      break;
    case "bird":
      value = myBox.get("bird");
      break;
    case "level":
      value = myBox.get("level");
      break;
    case "audio":
      value = myBox.get("audio");
      break;
  }
  return value;
}