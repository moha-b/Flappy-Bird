// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flappy_bird/Layouts/Pages/page_start_screen.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_bird_settings.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_difficulty_settings.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_music_settings.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_themes_settings.dart';
import 'package:flappy_bird/Resources/strings.dart';
import 'package:flutter/material.dart';
import '../../Global/functions.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: background(Str.image),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.08,left: 8,bottom: 10),
              alignment: Alignment(-1,0),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              },icon: Icon(Icons.arrow_back,size: 50,color: Colors.white,)),
            ),
            Container(
              width: size.width * 0.78,
              height: size.height * 0.75,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(10),
              decoration: frame(),
              child: Column(
                children: [
                  myText("Setting",Colors.pinkAccent,35),
                  BirdSettings(),
                  ThemesSettings(),
                  MusicSettings(),
                  DifficultySettings(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan.shade300,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen(),),);
                      }, child: myText("Apply",Colors.white,35) ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}