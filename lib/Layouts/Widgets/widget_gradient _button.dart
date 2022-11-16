// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flappy_bird/Layouts/Pages/page_RateUs.dart';
import 'package:flutter/material.dart';
import '../../Global/Constant/constant.dart';
import '../Pages/page_game.dart';
import '../Pages/page_settings.dart';
import '../Pages/page_RateUs.dart';


class Button extends StatelessWidget {
  Icon? icon;
  double width;
  double height;
  String type;
  String buttonType;
  Button({required this.width, required this.height,this.icon, required this.type,required this.buttonType,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      child: Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black),
            gradient: LinearGradient(
                colors: [Colors.white,Colors.grey.shade500],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          alignment: Alignment.center,
          child: buttonType == "text"? Text("Play",style: TextStyle(fontFamily: "Magic4",color: Colors.green,fontSize: 35,),)
              : icon
      ),
      onTap: (){
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
                builder: (context) => RateUs(),
              ),
            );
          }
      },
    );
  }
}
