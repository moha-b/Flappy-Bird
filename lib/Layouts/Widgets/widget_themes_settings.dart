// ignore_for_file: prefer_const_constructors

import 'package:flappy_bird/Database/database.dart';
import 'package:flutter/material.dart';
import '../../Global/constant.dart';
import '../../Global/functions.dart';


class ThemesSettings extends StatefulWidget {
  const ThemesSettings({Key? key}) : super(key: key);

  @override
  State<ThemesSettings> createState() => _ThemesSettingsState();
}

class _ThemesSettingsState extends State<ThemesSettings> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Center(child: Container(margin: EdgeInsets.symmetric(vertical: 10),child: Text("Themes",style: TextStyle(fontSize: 20,fontFamily: "Magic4"))),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(onTap: (){
                setState(() {
                  im = "0";
                  write("background", im);
                  background(im);
                });
              },child: Image.asset("assets/pics/0.png",width: 73,height: 70,)),
              GestureDetector(onTap: (){
                setState(() {
                  im = "1";
                  write("background", im);
                  background(im);
                });
              },child: Image.asset("assets/pics/1.png",width: 73,height: 70,)),
              GestureDetector(onTap: (){
                setState(() {
                  im = "2";
                  write("background", im);
                  background(im);
                });
              },child: Image.asset("assets/pics/2.png",width: 63,height: 66,)),
            ],
          ),
        ],
      ),
    );
  }
}
