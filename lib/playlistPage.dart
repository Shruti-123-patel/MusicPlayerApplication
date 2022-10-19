import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:spotify/logic/models/likedSongs.dart';
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




class playlistPage extends StatefulWidget {
  // const playlistPage({Key? key}) : super(key: key);
  String email='';
  playlistPage(String email){
    this.email=email;
  }
  @override
  State<playlistPage> createState() => _playlistPageState();
}

class _playlistPageState extends State<playlistPage> {

  Widget createSongItem(Song i) {
    return Material(
      // padding: EdgeInsets.all(10),
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => songPlayPage(i, i.category)));
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

                ],
              ),
            )));
  }

  List<Widget> musicList(List<Song> list_) {
    // List<Song> list = getList(list_);
    List<Song> list = list_;
    List<Widget> songList=[];
    if(list!=null)
      songList = list.map((Song i) => createSongItem(i)).toList();
    return songList;
  }

  Widget makelist(List<Song>allsongs){

    // print(allsongs);

    List<Widget> songList = musicList(allsongs);
    // print("Hello in makelist");
    return Container(
        height: 200,
        padding: EdgeInsets.only(top: 10),
        child:ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return songList[index];
          },
          itemCount: songList.length,
        )


    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userOperations.getLikedSongs(widget.email),
        builder:(context, snapshot) {
          if(snapshot.hasData){
            var objoflikedSongsList = snapshot.data as List<likedSongs>;
            var objSong;
            for(likedSongs i in objoflikedSongsList)
              objSong = i;


            var list_all_songs = objSong?.likedSong;
            return SafeArea(
                child:Container(
                    height: 800,
                    margin: EdgeInsets.only(top: 25, left: 25, right: 25),
                    child: Column(
                      children: [
                        AppBar(
                          title: Text("Favourite Songs"),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        makelist(list_all_songs),
                      ],
                    )
                ));
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}


