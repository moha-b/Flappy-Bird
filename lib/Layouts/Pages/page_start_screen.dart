// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:flappy_bird/Layouts/Widgets/widget_bird.dart';
import 'package:flappy_bird/Resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../Global/constant.dart';
import '../../Global/functions.dart';
import '../Widgets/widget_gradient _button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);
  @override
  State<StartScreen> createState() => _StartScreenState();
}
class _StartScreenState extends State<StartScreen> {

  final myBox = Hive.box('user');

  @override
  void initState() {
    // Todo : initialize the database  <---
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: background(im),
        child: Column(
          children: [
            // Flappy bird text
            Container(
              margin: EdgeInsets.only(top: size.height * 0.25),
                child: Text("FlappyBird", style: TextStyle(fontSize: 70,fontFamily: "Magic4",color: Colors.white,),)),
            Bird(yAxis, birdWidth, birdHeight),
            _buttons(),
            AboutUs(size: size,)
          ],
        ),
      ),
    );
  }
}

// three buttons
Column _buttons(){
  return Column(
    children: [
      Button(buttonType: "text",height: 60,width: 278,icon: Icon(Icons.play_arrow_rounded,size: 60,color: Colors.green,),page: Res.gamePage,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Button(buttonType: "icon",height: 60,width: 110,icon: Icon(Icons.settings,size: 40,color: Colors.grey.shade900,),page: Res.settings,),
          Button(buttonType: "icon",height: 60,width: 110,icon: Icon(Icons.star,size: 40,color: Colors.deepOrange,),page: Res.rateUs,),
        ],
      ),
    ],
  );
}

class AboutUs extends StatelessWidget {
  final Size size;
  AboutUs({required this.size,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: size.height * 0.2),
      child: GestureDetector(onTap: (){
        showDialog(context: context, builder: (context) {
          return dialog(context);
        },);
      },child: Text("About Us",style: TextStyle(fontSize: 20,fontFamily: "Magic4",color: Colors.white),)),
    );
  }
}
