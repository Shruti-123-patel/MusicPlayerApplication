import 'package:flutter/material.dart';
class playlistPage extends StatefulWidget {
  const playlistPage({Key? key}) : super(key: key);

  @override
  State<playlistPage> createState() => _playlistPageState();
}

class _playlistPageState extends State<playlistPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
        "Playlist",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
