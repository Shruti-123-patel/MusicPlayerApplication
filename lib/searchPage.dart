import 'package:flutter/material.dart';
class searchPage extends StatelessWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
          "Search",
          style: TextStyle(
            color: Colors.white
          )
      )
    );
  }
}
