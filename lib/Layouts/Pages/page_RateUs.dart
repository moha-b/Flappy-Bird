import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flappy_bird/Constant/constant.dart';


class RateUs extends StatelessWidget {
  RateUs({Key? key}) : super(key: key);
  double rating = 4.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      return Scaffold(
          body: Container(
          width: size.width,
          height: size.height,
          decoration: background(im),
    child: RatingDialog( title: Text(" Rate Us", style: TextStyle(fontSize: 25,fontFamily: "Magic4",color: Colors.blueAccent,)),
       //   message: Text(" Tap to start Rating "),
          image: Icon(Icons.star,size: 100,color: Colors.red),
          submitButtonText:  'Submit',
          onSubmitted: (response)
          {
            print('onSubmitPressed: rating = ${response.rating}');
            print('Comment :${response.comment}');
          })));



  }
}

