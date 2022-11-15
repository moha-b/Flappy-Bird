// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Constant/constant.dart';

class BirdSettings extends StatelessWidget {
  const BirdSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(margin: EdgeInsets.symmetric(vertical: 12),child: myText("Characters",Colors.black,20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(onTap: (){bird = "assets/pics/bird.png";},child: SizedBox(width: 75,height: 75,child: Image.asset("assets/pics/bird.png",fit: BoxFit.cover,))),
            GestureDetector(onTap: (){bird = "assets/pics/blue.png";},child: SizedBox(width: 75,height: 75,child: Image.asset("assets/pics/blue.png",fit: BoxFit.cover,))),
            GestureDetector(onTap: (){bird = "assets/pics/green.png";},child: SizedBox(width: 75,height: 75,child: Image.asset("assets/pics/green.png",fit: BoxFit.cover,))),
          ],
        ),
      ],
    );
  }
}
