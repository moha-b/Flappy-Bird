// ignore_for_file: avoid_print
import 'package:hive_flutter/hive_flutter.dart';

/*
* [Hive] is a quick, lightweight, NoSQL database for flutter and dart applications.
* Hive is truly helpful if you need a straightforward key-value database without numerous relations
* and is truly simple to utilize.
* It is an offline database(store data in local devices)
*/
var box = Hive.openBox('user');
final myBox = Hive.box('user');

void write(int id, int score){
  myBox.put(id, score);
  print("Write func is Activated");
}

int read(int id){
  print("Read func is Activated");
  if(myBox.get(id) == null){
    print("0 has been returned");
    return 0;
  }
  return myBox.get(id);
}

void delete(){
  print("delete func is Activated");
}