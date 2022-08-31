// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flappy_bird/Constant/constant.dart';
import 'package:flappy_bird/Layouts/Pages/page_share_app.dart';
import 'package:flutter/material.dart';
import '../Pages/page_home.dart';
import '../Pages/page_leader_board.dart';
import '../Pages/page_settings.dart';

class Button extends StatelessWidget {
  Icon? icon;
  double width;
  double height;
  String type;
  Button({required this.width, required this.height,this.icon, required this.type,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black),
            gradient: LinearGradient(
                colors: [Colors.white,Colors.grey.shade500],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          alignment: Alignment.center,
          child: icon
      ),
      onTap: ()async{
        if (isPlaying == false)
        {
          await audioPlayer.resume();
        }
       else{
          await audioPlayer.pause();
        }
          if(type == Navigation.home.name){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          }else if(type == Navigation.settings.name){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Settings(),
              ),
            );
          }else{
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LeaderBoard(),
              ),
            );
          }
      },
    );
  }
}
