import 'package:spotify/logic/models/songs.dart';

class likedSongs{
  String email='';
  List<Song> likedSong = [];

  likedSongs(this.email,this.likedSong);

  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>>jsonSong =[];
    for(var i in this.likedSong){
      jsonSong.add(i.toJson());
    }
    return {
      'email': this.email,
      'songs': jsonSong
    };
  }

  static likedSongs fromJson(Map<String,dynamic>json){
    List<Song> favs=[];
    for(var i in json['songs']){
      favs.add(Song.fromJson(i));
    }
    return likedSongs(json['email'],favs
    );
  }

}