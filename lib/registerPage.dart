import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/loginPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _passwordControl = TextEditingController();
  final TextEditingController _cpasswordcontrol = TextEditingController();

  late bool _success;
  late String? _userEmail;

  void _register() async{


    if(_passwordControl.text == _cpasswordcontrol.text) {
      // print("hello");
      final User? user = (
          await _auth.createUserWithEmailAndPassword(
              email: _emailControl.text, password: _passwordControl.text)
      ).user;

    //   if (user != null) {
    //     setState(() {
    //       _success = true;
    //       _userEmail = user.email;
    //     });
    //   }
    //   else {
    //     setState(() {
    //       _success = false;
    //     });
    //   }
    }
    // else {
    //   setState(() {
    //     _success = false;
    //     Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
    //   });
    // }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Account'),
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
                // Padding(
                //   padding: EdgeInsets.all(10),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       // prefixText: "Email : ",
                //         border: OutlineInputBorder(),
                //         labelText: 'Name',
                //         hintText: 'Enter Your Name'
                //     ),
                //   ),
                // ),
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
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _cpasswordcontrol,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                        hintText: 'Enter password same as above'
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => HomePage()));
                      print(_passwordControl.text);
                      print(_cpasswordcontrol.text);
                      print(_emailControl.text);
                      _register();
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                TextButton(
                    onPressed: (){},
                    child: Text('Have an account? Login')
                ),

              ],
            )

        ));
  }
}
