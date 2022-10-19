class Song{
  String name='';
  String image='';
  String artist='';
  String url='';
  String category='';
  Song(this.name,this.image,this.artist,this.url,this.category);

  Map<String,dynamic> toJson(){
    return {
      'name': this.name,
      'image' : this.image,
      'artist': this.artist,
      'url' : this.url,
      'category' : this.category
    };
  }

  static Song fromJson(Map<String,dynamic>json){
    return Song(json['name'],json['image'],json['artist'],json['url'],json['category']
    );
  }
}