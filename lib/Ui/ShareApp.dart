import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



final backgroundColors = [
  Color(0XFF8122BF),
  Color(0XFFCA32F5),
  Color(0XFFF2B634),
];

//class ShareApp extends StatefulWidget {
  //const ShareApp({Key? key}) : super(key: key);

//  @override
  //State<ShareApp> createState() => _ShareAppState();
//}

//class _ShareAppState extends State<ShareApp> {


 // whatsapp() async{
    //const url ='https://www.whatsapp.com/';
    //if(await canLaunch(url))
    //{
     // await launch(url);
   // }
    //else
    //  throw 'could not launch $url';
  //}

  //facebook() async{
    //WebView(
      //initialUrl: "https://www.facebook.com/?stype=lo&jlou=AfdQpd7bKBvRHw3DkBY7W27-aYi8Xc0f_XhUYOukOYdMFTw5hZZ4RntNCP3UpWuwtmrSmyDeAfzxa401Ocuwv0cZVlHvws4DL2_fcOrea_y_Iw&smuh=46681&lh=Ac9_B7nMZsB_cK1YP1U",
      //javascriptMode: JavascriptMode.unrestricted,
    //);
  //}
  //Email() async{
    //const url ='https://mail.google.com/mail/u/0/#inbox';
    //if(await canLaunch(url))
    //{
     // await launch(url);
    //}
    //else
     // throw 'could not launch $url';


  //}

  //instagram() async{
    //const url ='https://www.instagram.com/';
    //if(await canLaunch(url))
    //{
     // await launch(url);
    //}
    //else
      //throw 'could not launch $url';

  //}
  //@override
  //Widget build(BuildContext context) {
    //return Theme(
      //  data: ThemeData.light(),
        //child: DecoratedBox(
          //  decoration: BoxDecoration(
            //    gradient: LinearGradient(
             // colors: backgroundColors,
            //)),
            //child: Scaffold(
              //  backgroundColor: Colors.transparent,
                //body: Center(
                  //child: SocialShareButton(children: [
                    //IconButton(
                      //  onPressed: () {
                        //  print('Icon 1');
                          //whatsapp();
                       // }, icon: Icon(Icons.whatsapp)),
                    //IconButton(
                      //  onPressed: () {
                        //  print('Icon 2');
                         // Email();
                         // }, icon: Icon(Icons.email_outlined)),
                   // IconButton(
                     //   onPressed: () {
                       //   print('Icon 3');
                         // WebView(
                           // initialUrl: 'https://www.facebook.com/campaign/landing.php?&campaign_id=1653920611&extra_1=s%7Cc%7C318492920824%7Ce%7Cfacebook%20login%7C&placement=&creative=318492920824&keyword=facebook%20login&partner_id=googlesem&extra_2=campaignid%3D1653920611%26adgroupid%3D62237381223%26matchtype%3De%26network%3Dg%26source%3Dnotmobile%26search_or_content%3Ds%26device%3Dc%26devicemodel%3D%26adposition%3D%26target%3D%26targetid%3Dkwd-1409285535%26loc_physical_ms%3D9112365%26loc_interest_ms%3D%26feeditemid%3D%26param1%3D%26param2%3D&gclid=CjwKCAjwpKyYBhB7EiwAU2Hn2TEAvXw1D_q64oxpWmJPDaIDdZKFJiJC0oYqrlV2WruI7xS5jyvUoRoCg8cQAvD_BwE',
                            //javascriptMode: JavascriptMode.unrestricted,
                          //);
                       // }, icon: Icon(Icons.facebook)),
                   // IconButton(
                     //   onPressed: () {
                       //   print('Icon 4');
                         // instagram();
                       // }, icon: Icon(Icons.camera_alt))
                 // ],),
               // ))));
  //}
//}

//class SocialShareButton extends StatefulWidget {

   //SocialShareButton({Key? key, this.height = 100, required this.children, this.buttonColor = Colors.black, this.childrenColor = Colors.white, this.buttonLabel =' SHARE'}) : super(key: key);
  //final double height;
  //final List<Widget> children;
  //final Color buttonColor;
   //final Color childrenColor;
   //final String buttonLabel ;



   //final _buttonkey = GlobalKey();
  //double _buttonWidth = 0.0;

  //@override
  //State<SocialShareButton> createState() => _SocialShareButtonState();
//}

//class _SocialShareButtonState extends State<SocialShareButton> {

 // final double height =100;

  //final _buttonkey = GlobalKey();
//  double _buttonWidth = 0.0;
 // bool _expanded = false;

  //@override
  //void initState() {
    //WidgetsBinding.instance.addPostFrameCallback((_) {
      //setState(() {
        // _buttonWidth =_buttonkey.currentContext!.size!.width + 14;
      //});
    //});
    //super.initState();
  //}
 // Widget _buildBottomWidget(){
   // final  borderRadius = BorderRadius.circular(8);
    //return   Material(
      //  elevation: 5,
        //color: widget.buttonColor,
        //shape: RoundedRectangleBorder(
          //borderRadius: borderRadius ,
        //),
        //child: InkWell(
          //  onTap: (){
            //  setState(() {
              //  _expanded =! _expanded;
             // });
            //},
            //borderRadius: borderRadius,
            //child:Container(

              //  width: _buttonWidth,
               // height: widget.height/2,
                //alignment: Alignment.center,
                //child: Text( widget.buttonLabel , textAlign: TextAlign.center,style:
                  //  TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                 // )
           // )));
  //}

 //Widget _buildTopWidget(){

   // return Container(
     // decoration: BoxDecoration(
       //   color: widget.childrenColor,
         // borderRadius:  BorderRadius.vertical(top: Radius.circular(25))
      //),

      //height: height / 2,
      //child: Row(
        //mainAxisSize: MainAxisSize.min,
        //key: _buttonkey,
        //children: widget.children,

      //),
    //);
 //}


 // @override
  //Widget build(BuildContext context) {
//final movement = widget.height/4;
  //  return TweenAnimationBuilder<double>(
    //  tween:  !_expanded? Tween(begin: 0.0, end: 1.0): Tween(begin: 1.0, end: 0.0),
    //duration:  _buttonWidth ==0 ? const Duration(milliseconds: 1) :const Duration(milliseconds: 400 ),
    //builder:(context, value,_){
    //return Container(
      //height: widget.height,
      //child: Column(
        //mainAxisSize: MainAxisSize.min,
       // children: [
         //Transform.translate(offset: Offset(0.0,movement * value ),child:_buildTopWidget()),
      //Transform.translate(offset: Offset(0.0, - movement * value ),child: _buildBottomWidget()

      //) ],
      //),
    //);

      //});}
//}
