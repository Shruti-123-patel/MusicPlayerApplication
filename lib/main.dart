import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async{

  // bind widget tree with flutter engine
  WidgetsFlutterBinding.ensureInitialized();

  Paint.enableDithering = true;


  //initialize firebase
  await Firebase.initializeApp();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _musicApp= Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
