// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';

class RateUs extends StatelessWidget {
  RateUs({Key? key}) : super(key: key);
  final double rating = 4.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            decoration: background(Str.image),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  RatingDialog(
                      title: myText("Rate Us",Colors.blueAccent,25),
                      //   message: Text(" Tap to start Rating "),
                      image: Icon(Icons.star, size: 100, color: Colors.red),
                      submitButtonText: 'Submit',
                      onSubmitted: (response) {
                      }),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan.shade300,
                    ),
                    onPressed: (){
                      Share.share("https://github.com/moha-b/Flappy-Bird/releases/download/v.0.4.2/app-release.apk");
                    }, child: Icon(Icons.share_rounded,size: 30,), ),
                )
              ],
            ),
        ),
    );
  }
}