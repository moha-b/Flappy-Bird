// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
   Cover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      alignment: Alignment.center,
      child: Text("Powered by Fue",style: TextStyle(color: Colors.white,fontSize: 45,fontFamily: "Magic4"),),
    );
  }
}
