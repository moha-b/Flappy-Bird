// ignore_for_file: prefer_const_constructors, unnecessary_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Layouts/Pages/page_home.dart';
import '../Layouts/Pages/page_start_screen.dart';

void main() async{

  await Hive.initFlutter();
  var box = Hive.openBox('user');
  runApp(MaterialApp(
    home: Startscreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: Force the Screen to be portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return HomePage();
  }
}


  