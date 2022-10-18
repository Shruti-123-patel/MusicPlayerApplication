import 'package:flutter/material.dart';
import 'package:spotify/playlistPage.dart';
import 'package:spotify/searchPage.dart';

import 'Home.dart';

class SpotifyHome extends StatefulWidget {
  const SpotifyHome({Key? key}) : super(key: key);

  @override
  State<SpotifyHome> createState() => _SpotifyHomeState();
}

class _SpotifyHomeState extends State<SpotifyHome> {

  var pages=[];
  var curr_page;
  @override
  initState() {
    super.initState();
    pages=[Home(),searchPage(),playlistPage()];
    curr_page=0  ;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[curr_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curr_page,
        onTap: (currentIndex){
          curr_page=currentIndex;
          setState(() {});
        },
        backgroundColor: Colors.black54,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home_rounded,color: Colors.black),label:"Home"),
          BottomNavigationBarItem(icon:Icon(Icons.search,color: Colors.black),label: "Search"),
          BottomNavigationBarItem(icon:Icon(Icons.library_books,color: Colors.black),label: "Playlist"),
          BottomNavigationBarItem(icon:Icon(Icons.logout,color: Colors.black),label: "Logout"),
          BottomNavigationBarItem(icon:Icon(Icons.lock,color: Colors.black),label: "Change Password"),
        ],
      ),
    );
  }
}
