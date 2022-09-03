// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flappy_bird/Database/database.dart';
import 'package:flappy_bird/Layouts/Pages/page_start_screen.dart';
import 'package:flutter/material.dart';
import '../../Constant/constant.dart';
import 'package:audioplayers/audioplayers.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: background(im),
        child: Column(
          children: [
            Expanded(flex: 1, child: Container(
              margin: EdgeInsets.only(top: 20,left: 8),
              child: Row(
                children: [

                ],
              ),
            ),),
            Expanded(
              flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.78,
                height: MediaQuery.of(context).size.height * 0.4,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.white54,boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.6),blurRadius: 1.0,offset: Offset(5,5))]),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text("Setting",style: TextStyle(fontSize: 35,fontFamily: "Magic4")),
                      Center(child: Container(margin: EdgeInsets.only(bottom: 10,top: 30),child: Text("Characters",style: TextStyle(fontSize: 20,fontFamily: "Magic4"))),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(onTap: (){bird = "assets/pics/bird.png";},child: Container(width: 75,height: 75,child: Image.asset("assets/pics/bird.png",fit: BoxFit.cover,))),
                          GestureDetector(onTap: (){bird = "assets/pics/blue.png";},child: Container(width: 75,height: 75,child: Image.asset("assets/pics/blue.png",fit: BoxFit.cover,))),
                          GestureDetector(onTap: (){bird = "assets/pics/green.png";},child: Container(width: 75,height: 75,child: Image.asset("assets/pics/green.png",fit: BoxFit.cover,))),
                        ],
                      ),
                      Center(child: Container(margin: EdgeInsets.symmetric(vertical: 10),child: Text("Themes",style: TextStyle(fontSize: 20,fontFamily: "Magic4"))),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(onTap: (){setState(() {
                            setState(() {
                              im = "0";
                              background(im);
                            });
                          });},child: Image.asset("assets/pics/0.png",width: 73,height: 70,)),
                          GestureDetector(onTap: (){setState(() {
                            setState(() {
                              im = "1";
                              background(im);
                            });
                          });},child: Image.asset("assets/pics/1.png",width: 73,height: 70,)),
                          GestureDetector(onTap: (){
                            setState(() {
                              im = "2";
                              background(im);
                            });
                          },child: Image.asset("assets/pics/2.png",width: 63,height: 66,)),
                        ],
                      ),
                      Center(child: Container(margin: EdgeInsets.only(bottom: 10,top: 20),child: Text("Music",style: TextStyle(fontSize: 20,fontFamily: "Magic4"))),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(onTap: () async
                              {
                              //TODO: play Music
                                isPlaying = false;
                              if (isPlaying == false)
                              {
                              await audioPlayer.resume();
                              }

                          },child: Icon(Icons.music_note_rounded,size: 40,)),
                          GestureDetector(onTap: () async
                          {  isPlaying = true;
                            //TODO: play Music
                            if (isPlaying == true)  {
                              await audioPlayer.pause();
                            }
                          },child: Icon(Icons.music_off_rounded,size: 40)),
                        ],
                      ),
                      Center(child: Container(margin: EdgeInsets.only(top: 20,bottom: 10),child: Text("Difficulty",style: TextStyle(fontSize: 20,fontFamily: "Magic4"))),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){
                            barrierMovement = 0.05 ;
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green.shade300,
                          ), child: Text("Easy",style: TextStyle(fontSize: 20,fontFamily: "Magic4")),),
                          ElevatedButton(onPressed: (){
                            barrierMovement = 0.08 ;
                          },style: ElevatedButton.styleFrom(
                          primary: Colors.yellow.shade700,
                          ), child: Text("Medium",style: TextStyle(fontSize: 20,fontFamily: "Magic4")),),
                          ElevatedButton(onPressed: (){
                            barrierMovement = 0.1 ;
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade300,
                          ), child: Text("Hard",style: TextStyle(fontSize: 20,fontFamily: "Magic4")),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan.shade300,
                          ),
                          onPressed: () {
                            writeBackground(im);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen(),),);
                          }, child: Text("Apply",style: TextStyle(fontFamily: "Magic4",fontSize: 30),) ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: SizedBox(),)
          ],
        ),
      ),
    );
  }
}