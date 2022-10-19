import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/logic/models/likedSongs.dart';

import '../models/songs.dart';

class userOperations{

  static Future<List<likedSongs>> getLikedSongs(String email) async{
    final list = await FirebaseFirestore.instance.collection('liked_songs').where(
        'email', isEqualTo: email).get();
    print("inside getLikedSongs");
    print(list.docs.map((e) => likedSongs.fromJson(e.data())));
    return list.docs.map((e) => likedSongs.fromJson(e.data())).toList();
  }

  static void addToLikedSongs(Song song,String email) async{
    List<likedSongs> songs_=await getLikedSongs(email);
    likedSongs songs=new likedSongs(email, []);
    for(likedSongs i in songs_){
      songs=i;
    }
    songs.likedSong.add(song);
    for(var i in songs.likedSong){
      print("inside addLikedSongs");
      print(i.name);
    }
    final json = songs.toJson();
    print(json);
    final docUser = FirebaseFirestore.instance.collection('liked_songs').doc();
    await docUser.set(json);
  }
}