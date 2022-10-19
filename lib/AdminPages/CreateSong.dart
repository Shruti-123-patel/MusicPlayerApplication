import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spotify/logic/models/songs.dart';

class CreateSong extends StatefulWidget {
  const CreateSong({Key? key}) : super(key: key);

  @override
  State<CreateSong> createState() => _CreateSongState();
}

class _CreateSongState extends State<CreateSong> {

  TextEditingController name = new TextEditingController();
  TextEditingController artist = new TextEditingController();
  TextEditingController image = new TextEditingController();
  TextEditingController url = new TextEditingController();
  TextEditingController category = new TextEditingController();

  _create() async{
    Song song = new Song(name.text,image.text,artist.text,url.text,category.text);
    final json = song.toJson();
    final docUser = FirebaseFirestore.instance.collection('Songs').doc();
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child:SafeArea(
        child: Container(
          child:Column(
            children: [
              AppBar(
                title: Text("Add Songs",style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  // prefixText: "Email : ",
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'name'
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: artist,
                decoration: InputDecoration(
                  // prefixText: "Email : ",
                    border: OutlineInputBorder(),
                    labelText: 'Artist',
                    hintText: 'artist name'
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: image,
                decoration: InputDecoration(
                  // prefixText: "Email : ",
                    border: OutlineInputBorder(),
                    labelText: 'Image',
                    hintText: 'image'
                ),
              ),
              SizedBox(
                height: 10,
              ),

              TextField(
                controller: url,
                decoration: InputDecoration(
                  // prefixText: "Email : ",
                    border: OutlineInputBorder(),
                    labelText: 'Url',
                    hintText: 'url'
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: category,
                decoration: InputDecoration(
                  // prefixText: "Email : ",
                    border: OutlineInputBorder(),
                    labelText: 'Category',
                    hintText: 'category',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: ()=>_create(),
                  child: Text('Add Song'),
              )
            ],
          ),
        )
    ));
  }
}
