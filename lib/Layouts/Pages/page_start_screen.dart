import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flappy_bird/Layouts/Pages/page_share_app.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../constant/constant.dart';
import 'page_home.dart';
import 'page_settings.dart';


class Startscreen extends StatefulWidget {
  const Startscreen({Key? key}) : super(key: key);

  @override
  State<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends State<Startscreen> {
  @override
  void initState(){
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition ;
      });
    });

  }

  Future setAudio() async{
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    // String url ='https://www.youtube.com/watch?v=qCQOrHxktcA';
    //audioPlayer.setUrl(url);
    final  player = AudioCache(prefix: 'assets/audio/');
    final url = await player.load('Bones.mp3');

    audioPlayer.setUrl(url.path,isLocal: true);
  }



  @override

  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/pics/Flappy-Bird-1.jpg"),
                      fit: BoxFit.fill)),

            ),
          ),
          ddb2(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: () async {
                  if
                  (isPlaying)
                  {
                    await audioPlayer.pause();
                  }

                  else
                  {
                    await audioPlayer.resume();
                  }

                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  HomePage()),
                    );
                  });
                }, child: Text("PLAY"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.blueGrey)
                      )

                  ),

                ),
              ],
            ),
          ),

        ],

      ),

    );
  }
}


class ddb2 extends StatefulWidget {
  const ddb2({Key? key}) : super(key: key);

  @override
  State<ddb2> createState() => _ddb2State();
}

class _ddb2State extends State<ddb2> {
  @override
  Widget build(BuildContext context) {
    return
      DropdownButtonHideUnderline(
      child: DropdownButton2(
        //alignment: AlignmentDirectional.topStart,
        customButton: const Icon(
          Icons.list,
          size: 46,
          color: Colors.white,
        ),
        customItemsIndexes: const [3],
        customItemsHeight: 8,
        items: [
          ...MenuItems.firstItems.map(
                (item) =>
                DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
          ),
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
                (item) =>
                DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value as MenuItem);
        },
        itemHeight: 48,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 160,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color:Color.fromRGBO(78, 192, 202, 1),
        ),
        dropdownElevation: 8,
        offset: const Offset(0, 8),
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
  static const List<MenuItem> secondItems = [aboutus];

  static const play = MenuItem(text: 'PLAY', icon: Icons.start);
  static const share = MenuItem(text: 'Share', icon: Icons.share);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const aboutus = MenuItem(text: 'AboutUs', icon: Icons.info);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
            item.icon,
            color: Colors.white,
            size: 22
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
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
          MaterialPageRoute(builder: (context) =>  HomePage()),
        );
      //Do something
        break;
      case MenuItems.settings:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   Settings()),
        );
        break;
      case MenuItems.share:
      //Do something
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   ShareApp()),
        );
        break;
      case MenuItems.aboutus:
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
          title: const Text("About Flappy Bird"),
          content: const Text("The game is a side-scroller where the player"
          " controls a bird, attempting to fly between "
              " columns of green pipes without hitting them",),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.grey,
                padding: const EdgeInsets.all(14),
                child: const Text("okay"),
              ),
            ),
          ],
        ));

        break;
    }
  }
}
