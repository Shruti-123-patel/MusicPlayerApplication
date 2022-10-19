import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/logic/models/songs.dart';

import 'homePage.dart';
class songPlayPage extends StatefulWidget {
  // const songPlayPage({Key? key}) : super(key: key);
  Song song = new Song('', '', '','','');
  String category='';
  songPlayPage(Song i,String cat){
    song = i;
    category=cat;
  }
  @override
  State<songPlayPage> createState() => _songPlayPageState();
}

class _songPlayPageState extends State<songPlayPage> {

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration length = Duration.zero;
  Duration position = Duration.zero;
  
  String formatTime(Duration time_){
    String convertTo2digits(int n)=> n.toString().padLeft(2,'0');
    final hour = convertTo2digits(time_.inHours);
    final min = convertTo2digits(time_.inMinutes);
    final sec = convertTo2digits(time_.inSeconds);
    
    return [
      if(time_.inHours >0) hour,
      min,
      sec
    ].join(':');
  }

  Future setAudio() async{
    String url=widget.song.url;
    audioPlayer.setSourceUrl(url);
    // await audioPlayer.play(url);
  }

  @override
  void initState(){
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        length = event;
      });
    });

    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.category,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: 800,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            // SpotifyHome(),
            SizedBox(
              height: 20,
            ),
            Image.asset(
                widget.song.image,
              height: 300,
              width:300,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              widget.song.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.song.artist,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Slider(
              min: 0,
              max: length.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              onChanged: (value) async{
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);

                await audioPlayer.resume();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position),style: TextStyle(color: Colors.white),),
                   IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                        color: Colors.white,
                      ),
                      iconSize: 50,
                      onPressed: () async{
                        if(isPlaying){
                          await audioPlayer.pause();
                        }
                        else{
                          await audioPlayer.resume();
                        }
                      },
                    ),
                  Text(formatTime(length),style: TextStyle(color: Colors.white),)
                ],
              ),
            ),

          ],
        ),
        decoration: BoxDecoration(
            gradient:LinearGradient(
                colors: [
                  Colors.blueGrey,
                  Colors.black
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
      ),
    );
  }
}
