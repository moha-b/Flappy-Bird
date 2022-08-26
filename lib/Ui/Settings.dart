import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../constant/constant.dart';



class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 250,
            height: 200,
            child: Row(
              children: [
                Text("THEME  ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                FlutterSwitch(
                  width: 125.0,
                  height: 55.0,
                  valueFontSize: 25.0,
                  toggleSize: 45.0,
                  value: theme,
                  borderRadius: 30.0,
                  padding: 8.0,
                  showOnOff: true,
                  onToggle: (val) {
                    setState(() {
                      theme = val;
                    });
                  },
                ),
               Container(
                 width: 50,
               ),

              ],
            ),

          ),
          Row(
            children: [
              Text("Characters" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
             IconButton(
                 onPressed: (){
                   setState(() {
                     c =Colors.yellow ;
                   });
                 },
                 icon:Image.asset(
                     "assets/pics/bird.png"),
             iconSize: 100,),
              IconButton(
                onPressed: (){
                  setState(() {
                    c =Colors.blue ;
                  });
                },
                icon:Image.asset(
                    "assets/pics/bluebird.png"),
                iconSize: 100,),
              IconButton(
                onPressed: (){
                  setState(() {
                    c =Colors.red ;
                  });
                },
                icon:Image.asset(
                    "assets/pics/redbird.png"),
                iconSize: 100,)
            ],
          ),
            Row(
              children: [
                Text("Difficulity", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                ButtonBar(

                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      velocity=1.0;
                    });
                  }, child: Text("EASY"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.blueGrey)
                    )

                  ),
                    
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      velocity=2.5;
                    });
                  }, child: Text("MEDIUM"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.blueGrey)
                        )

                    ),

                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      velocity=3.0;
                    });
                  }, child: Text("HARD"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.blueGrey)
                        )

                    ),

                  ),
                ],
                )
              ],
            )

        ],
      ),
    );
  }
}

