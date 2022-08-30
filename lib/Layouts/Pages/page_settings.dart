// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flappy_bird/Layouts/Pages/page_share_app.dart';
import 'package:flutter/material.dart';

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
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/pics/background-day.png"),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Expanded(flex: 1, child: Container(
              margin: EdgeInsets.only(top: 20,left: 8),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,))
                ],
              ),
            ),),
            Expanded(
              flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.78,
                height: MediaQuery.of(context).size.height * 0.3,
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
                      SizedBox(height: 50,),
                      Center(child:  Text("Characters",style: TextStyle(fontSize: 20,fontFamily: "Magic4")),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/pics/bluebird.png",width: 63,height: 60,),
                          Image.asset("assets/pics/bluebird.png",width: 63,height: 60,),
                          Image.asset("assets/pics/redbird.png",width: 63,height: 60,),
                        ],
                      ),
                      Center(child: Text("Themes",style: TextStyle(fontSize: 20,fontFamily: "Magic4")),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/pics/background-day.png",width: 73,height: 70,),
                          Image.asset("assets/pics/background-night.png",width: 73,height: 70,),
                          Image.asset("assets/pics/background-after-night.png",width: 63,height: 66,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Center(child: Text("Music",style: TextStyle(fontSize: 20,fontFamily: "Magic4")),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.music_note_rounded,size: 40,),
                          Icon(Icons.music_off_rounded,size: 40),
                        ],
                      ),
                      SizedBox(height: 40,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan.shade300,
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ShareApp(),),);
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