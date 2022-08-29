import 'dart:async';

import 'package:flappy_bird/Layouts/web/web_email.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import '../web/web_facebook.dart';
import '../web/web_email.dart';
import '../web/web_instagram.dart';
import '../web/web_whatsapp.dart';

final backgroundColors = [
  Color(0XFF8122BF),
  Color(0XFFCA32F5),
  Color(0XFFF2B634),
];

class ShareApp extends StatefulWidget {
  const ShareApp({Key? key}) : super(key: key);

  @override
  State<ShareApp> createState() => _ShareAppState();
}

class _ShareAppState extends State<ShareApp> {

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.light(),
        child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: backgroundColors,
            )),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: SocialShareButton(children: [
                    IconButton(
                        onPressed: () {
                          print('Icon 1');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  whatsapp()),
                          );
                        }, icon: Icon(Icons.whatsapp)),
                    IconButton(
                        onPressed: () {
                          print('Icon 2');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  email()),
                          );
                          }, icon: Icon(Icons.email_outlined)),
                    IconButton(
                        onPressed: () {
                          print('Icon 3');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  facebook()),
                          );
                        }, icon: Icon(Icons.facebook)),
                    IconButton(
                        onPressed: () {
                          print('Icon 4');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  instagram()),
                          );
                        }, icon: Icon(Icons.camera_alt))
                  ],),
               ))));
  }
}

class SocialShareButton extends StatefulWidget {

   SocialShareButton({Key? key, this.height = 100, required this.children, this.buttonColor = Colors.black, this.childrenColor = Colors.white, this.buttonLabel =' SHARE'}) : super(key: key);
  final double height;
  final List<Widget> children;
  final Color buttonColor;
   final Color childrenColor;
   final String buttonLabel ;



   final _buttonkey = GlobalKey();
  double _buttonWidth = 0.0;

  @override
  State<SocialShareButton> createState() => _SocialShareButtonState();
}

class _SocialShareButtonState extends State<SocialShareButton> {

  final double height =100;

  final _buttonkey = GlobalKey();
  double _buttonWidth = 0.0;
  bool _expanded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
         _buttonWidth =_buttonkey.currentContext!.size!.width + 14;
      });
    });
    super.initState();
  }
  Widget _buildBottomWidget(){
    final  borderRadius = BorderRadius.circular(8);
    return   Material(
        elevation: 5,
        color: widget.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ,
        ),
        child: InkWell(
            onTap: (){
              setState(() {
                _expanded =! _expanded;
             });
            },
            borderRadius: borderRadius,
            child:Container(

                width: _buttonWidth,
                height: widget.height/2,
                alignment: Alignment.center,
                child: Text( widget.buttonLabel , textAlign: TextAlign.center,style:
                    TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                  )
            )));
  }

 Widget _buildTopWidget(){

    return Container(
      decoration: BoxDecoration(
          color: widget.childrenColor,
          borderRadius:  BorderRadius.vertical(top: Radius.circular(25))
      ),

      height: height / 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        key: _buttonkey,
        children: widget.children,

      ),
    );
 }


  @override
  Widget build(BuildContext context) {
final movement = widget.height/4;
    return TweenAnimationBuilder<double>(
      tween:  !_expanded? Tween(begin: 0.0, end: 1.0): Tween(begin: 1.0, end: 0.0),
    duration:  _buttonWidth ==0 ? const Duration(milliseconds: 1) :const Duration(milliseconds: 400 ),
    builder:(context, value,_){
    return Container(
      height: widget.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Transform.translate(offset: Offset(0.0,movement * value ),child:_buildTopWidget()),
      Transform.translate(offset: Offset(0.0, - movement * value ),child: _buildBottomWidget()

      ) ],
      ),
    );

      });}
}
