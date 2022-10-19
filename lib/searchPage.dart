import 'package:flutter/material.dart';
import 'package:spotify/SongListPage.dart';
import 'package:spotify/logic/models/songs.dart';
import 'package:spotify/logic/operations/songsOperation.dart';

import 'SongPlayPage.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {

  TextEditingController name = new TextEditingController();
  late Future<List<Song>> SongFutureList ;
  bool flag = false;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }

  Widget createSongItem(Song i) {
    return Material(
      // padding: EdgeInsets.all(10),
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (_) => songPlayPage(i, i.category)));
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
                  )
                ],
              ),
            )));
  }

  List<Widget> musicList(List<Song> list_) {
    // List<Song> list = getList(list_);
    print("Hello in musicList0");
    // print(list_[0].name);
    List<Song> list =[];
    for(Song i in list_){
      if(i.name.contains(name.text)) {
        // print(i.name);
        list.add(i);
      }
    }

    List<Widget> songList=[];
    for(Song i in list){
      songList.add(createSongItem(i));

    }
    // list_.map((i){
    //   print(i.name);
    //   if(i.name.contains(name.text)){print(i.name);list.add(i);}
    // });

    // List<Widget> songList = list.map((Song i) => createSongItem(i)).toList();
    return songList;
  }

  Widget makelist(List<Song>allsongs,String name){

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

  void setFlag(){
    flag= true;
    setState(() {

    });
  }

  void unSetFlag(){
    flag=false;
    setState(() {

    });
  }
  // Widget makegrid(String name) {
  //   // List<Song>list = getList(songsOperations.getAllSongs());
  //
  //   return Container(
  //     height: 200,
  //     padding: EdgeInsets.only(top: 10),
  //
  //     child: FutureBuilder(
  //         future: songsOperations.getSongs(),
  //         builder: (context, snapshot) {
  //
  //           if (snapshot.hasData) {
  //             var list0 = snapshot.data as List<Song>;
  //             List<Widget> list = musicList(list0);
  //             return ListView.builder(
  //               scrollDirection: Axis.vertical,
  //               itemBuilder: (ctx, index) {
  //                 return list[index];
  //               },
  //               itemCount: list.length,
  //             );
  //
  //           } else {
  //             return Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           }
  //         }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: songsOperations.getSongs(),
      builder:(context, snapshot) {
        if(snapshot.hasData){
          var list_all_songs = snapshot.data as List<Song>;
          return SafeArea(
              child:Container(
                  height: 800,
                  margin: EdgeInsets.only(top: 25, left: 25, right: 25),
                  child: Column(
                    children: [
                      TextField(
                        controller: name,
                        cursorColor: Colors.grey,
                        onChanged: (name_){
                          // makegrid(name);
                          // print(name.text);
                          if(name.text!='') setFlag();
                          else unSetFlag();

                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 18
                            ),
                            prefixIcon: Container(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              width: 25,
                            )
                        ),
                      ),
                      flag ? makelist(list_all_songs,name.text) : Container(),
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
