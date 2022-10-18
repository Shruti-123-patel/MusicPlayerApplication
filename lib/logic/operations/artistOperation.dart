import 'package:spotify/logic/models/artists.dart';

class ArtistOperations{
  static getAllArtist(){
    return <Artists>[
      Artists("Arijit Singh","asset/images/arijit.jpg"),
      Artists("Shreya Ghoshal","asset/images/shreya.jpg"),
      Artists("Armaan Malik","asset/images/arman.jpg"),
      Artists("Lata Mangeskar","asset/images/lata.jpg"),
    ];
  }
}