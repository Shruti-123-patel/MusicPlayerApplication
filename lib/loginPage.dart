import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/AdminPages/CreateSong.dart';
import 'package:spotify/registerPage.dart';
import 'homePage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _passwordControl = TextEditingController();

  _login() async{
    User? user;

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailControl.text,
          password: _passwordControl.text
      );
      user = userCredential.user;
      if (user != null) {
        print(user);
        if(_emailControl.text == 'admin123@gmail.com'){
            Navigator.push(context, MaterialPageRoute(builder: (_) => CreateSong()));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (_) => SpotifyHome()));
        }

      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login and Enjoy Listening'),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body :SingleChildScrollView(
        child:Column(
          children: [
            Container(
              height: 150.0,
              width: 190.0,
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.asset('asset/images/logo.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _emailControl,
                decoration: InputDecoration(
                    // prefixText: "Email : ",
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'abc@gmail.com'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _passwordControl,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password'
                ),
              ),
            ),
            TextButton(
                onPressed: (){},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => HomePage()));
                    _login();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            SizedBox(
              height: 160,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage()));
              },
              child: Text('New User? Create Account')
            ),

          ],
      )

    ));
  }
}
