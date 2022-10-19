import 'package:flutter/material.dart';
import 'package:spotify/logic/models/songs.dart';
import 'package:spotify/logic/operations/songsOperation.dart';
import 'package:spotify/logic/operations/userOperation.dart';

import 'SongPlayPage.dart';

class SongList extends StatefulWidget {
  // const SongList({Key? key}) : super(key: key);
  String category = '';
  int index=0;
  String email='';
  SongList(int index,String name,String email) {
    this.category = name;
    this.index = index;
    this.email=email;
  }
  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  Widget createSongItem(Song i) {
    return Material(
        // padding: EdgeInsets.all(10),
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => songPlayPage(i, widget.category)));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(
                    i.image,
                    fit: BoxFit.cover,
                    height: 45,
                    width: 45,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(i.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              fontFamily: 'calibri')),
                      SizedBox(
                        height: 5,
                      ),
                      Text(i.artist,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              fontFamily: 'calibri'))
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      userOperations.addToLikedSongs(i,widget.email);
                    },
                    icon: Icon(Icons.heart_broken),

                  )
                ],
              ),
            )));
  }

  // List<Song> getList(Future<List<Song>> futureSongs) {
  //   List<Song> songList = <Song>[];
  //   futureSongs.then((songs) => songList = songs);
  //   print(songList);
  //   return songList;
  // }

  List<Widget> musicList(List<Song> list_) {
    // List<Song> list = getList(list_);
    List<Song> list = list_;

    List<Widget> songList = list.map((Song i) => createSongItem(i)).toList();
    return songList;
  }

  Widget makegrid() {
    // List<Song>list = getList(songsOperations.getAllSongs());
    return Container(
      height: 200,
      padding: EdgeInsets.only(top: 10),
      // child: ListView.builder(
      //   scrollDirection: Axis.vertical,
      //   itemBuilder: (ctx, index) {
      //     return createSongItem(list[index]);
      //   },
      //   itemCount: list.length,
      // )
      child: FutureBuilder(
          future: songsOperations.getAllSongs(widget.index,widget.category),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              var list0 = snapshot.data as List<Song>;
              List<Widget> list = musicList(list0);
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) {
                  return list[index];
                },
                itemCount: list.length,
              );

            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Container(
              height: 1000,
              child: Column(
                children: [
                  AppBar(
                    title: Text(widget.category),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  makegrid(),
                ],
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueGrey, Colors.black],

                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
            )));
  }
}
