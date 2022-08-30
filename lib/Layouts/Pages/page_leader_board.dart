// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flappy_bird/Constant/constant.dart';
import 'package:flappy_bird/Layouts/Pages/page_share_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
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
                child: Column(
                  children: [
                    Text("Leader Board",style: TextStyle(fontSize: 35,fontFamily: "Magic4")),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.57,
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                                child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Mohab",style: TextStyle(fontSize: 25,fontFamily: "Magic4")),
                                      Text("Score : $TOP_SCORE",style: TextStyle(fontSize: 25,fontFamily: "Magic4")),
                                    ],
                                ),
                            ),
                            Divider(thickness: 3,)
                          ],
                        );
                      },),
                    )
                  ],
                ),
              ),
            ),
            Expanded(flex: 1, child: Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade300,
                ),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShareApp(),),);
              }, child: Icon(Icons.share_rounded,size: 30,), ),
            )),
          ],
        ),
      ),
    );
  }
}
