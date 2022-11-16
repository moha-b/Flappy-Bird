// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Global/Constant/constant.dart';
import '../../Global/Function/functions.dart';


class MusicSettings extends StatefulWidget {
  const MusicSettings({Key? key}) : super(key: key);

  @override
  State<MusicSettings> createState() => _MusicSettingsState();
}

class _MusicSettingsState extends State<MusicSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(margin: EdgeInsets.symmetric(vertical: 10),
              child: myText("Music",Colors.black,20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(onTap: () async {
                //TODO: play Music
                isPlaying = false;
                if (isPlaying == false) {
                  await audioPlayer.resume();
                }
              },child: Icon(Icons.music_note_rounded,size: 40,)),
              GestureDetector(onTap: () async {
                isPlaying = true;
                //TODO: play Music
                if (isPlaying == true)  {
                await audioPlayer.pause();
                }
              },
                  child: Icon(Icons.music_off_rounded,size: 40)),
            ],
          ),
        ],
      ),
    );
  }
}
