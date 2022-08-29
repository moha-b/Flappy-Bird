// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../Pages/page_home.dart';
import '../Pages/page_settings.dart';
import '../Pages/page_share_app.dart';


class Ddb2 extends StatefulWidget {
  Ddb2({Key? key}) : super(key: key);

  @override
  State<Ddb2> createState() => _Ddb2State();
}

class _Ddb2State extends State<Ddb2> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Icon(
          Icons.list,
          size: 46,
          color: Colors.white,
        ),
        customItemsIndexes: [3],
        customItemsHeight: 8,
        items: [
          ...MenuItems.firstItems.map(
                (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
          DropdownMenuItem<Divider>(
            enabled: false,
            child: Divider(),
          ),
          ...MenuItems.secondItems.map(
                (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value as MenuItem);
        },
        itemHeight: 48,
        itemPadding: EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 160,
        dropdownPadding: EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color.fromRGBO(78, 192, 202, 1),
        ),
        dropdownElevation: 8,
        offset: Offset(0, 8),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [play, share, settings];
  static const List<MenuItem> secondItems = [aboutUs];

  static const play = MenuItem(text: 'PLAY', icon: Icons.start);
  static const share = MenuItem(text: 'Share', icon: Icons.share);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const aboutUs = MenuItem(text: 'AboutUs', icon: Icons.info);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.play:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;

      case MenuItems.settings:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
        );
        break;

      case MenuItems.share:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShareApp()),
        );
        break;

      case MenuItems.aboutUs:
        buildAboutUs(context);
        break;
    }
  }

  static void buildAboutUs(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("About Flappy Bird"),
        content: Text(
          "The game is a side-scroller where the player"
              " controls a bird, attempting to fly between "
              " columns of green pipes without hitting them",
        ),
        actions: [
          TextButton(
            onPressed: () {
              //Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.grey,
              padding: EdgeInsets.all(14),
              child: Text("okay"),
            ),
          ),
        ],
      ),
    );
  }
}
