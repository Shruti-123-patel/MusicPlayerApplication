import 'package:spotify/logic/models/categories.dart';

class CategoryOperations{
  static getAllCategory(){
    return <Category>[
      Category("Happy Vibes","asset/images/happy_vibes_logo.jpg" ),
      Category("English Hits","asset/images/englishSongs_logo.png"),
      Category("Devotional","asset/images/devotional_logo.png"),
      Category("Bollywood Hits","asset/images/bollywood.jpg"),
      Category("Sad Songs","asset/images/love_logo.jpg"),
      Category("Party Songs","asset/images/party_logo.jpg"),
    ];
  }
}