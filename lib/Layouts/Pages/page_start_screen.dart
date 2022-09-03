// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:flappy_bird/Constant/constant.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_alert.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_bird.dart';
import 'package:flutter/material.dart';
import '../Widgets/widget_Button.dart';
import '../Pages/page_RateUs.dart';
import 'package:rating_dialog/rating_dialog.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}
class _StartScreenState extends State<StartScreen> {

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
            Expanded(flex: 3,
                child: SizedBox()),
            Expanded(flex: 1,
                child: Text("FlappyBird", style: TextStyle(fontSize: 70,fontFamily: "Magic4",color: Colors.white,),)),
            Expanded(flex: 2, child: Bird(yAxis, birdWidth, birdHeight)),
            Expanded(flex: 2, child: Column(
              children: [
                Button(height: 60,width: 260,icon: Icon(Icons.play_arrow_rounded,size: 60,color: Colors.green,),type: Navigation.home.name,),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 11,),
                    Button(height: 60,width: 110,icon: Icon(Icons.settings,size: 40,color: Colors.grey.shade900,),type: Navigation.settings.name,),
                    Button(height: 60,width: 110,icon: Icon(Icons.star,size: 40,color: Colors.deepOrange,),type: Navigation.rateUs.name,),
                    SizedBox(width: 11,),
                  ],
                ),
              ],
            ),),
            Expanded(flex: 2, child: SizedBox()),
            Expanded(flex: 1, child: InkWell(onTap: (){
            },child: GestureDetector(onTap: (){
              showDialog(context: context, builder: (context) {
                return Alert();
              },);
            },child: Text("About Us",style: TextStyle(fontSize: 20,fontFamily: "Magic4",color: Colors.white),)))),
          ],
        ),
      ),
    );
  }
}