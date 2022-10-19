import '../models/songs.dart';

class songsOperations{
  static getAllSongs(){
    return <Song>[
      Song("Ek Zindagi Meri", "asset/images/songs/1.jpg", "Sachin-Jigar","https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/5d/a1/e2/5da1e2d0-05db-31e4-0299-ce5b57036b9f/mzaf_8586522844933219189.plus.aac.p.m4a","Happy Vibes"),
      Song("Deva Deva", "asset/images/songs/2.jpeg", "Arijit Singh","https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/0c/c1/a4/0cc1a4b8-3094-7a3a-62dd-6f8f4f25d09e/mzaf_18084605159614822898.plus.aac.p.m4a","Happy Vibes")
    ];
  }
}