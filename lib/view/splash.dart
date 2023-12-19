import 'dart:async';
import 'package:ekart/model/provider.dart';
import 'package:ekart/view/Home.dart';
import 'package:ekart/view/Signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => splashState();
}

class splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    final savelogin = Provider.of<Savelogin>(context, listen: false);
    savelogin.getlogin();
    userlogin();
    // Timer(Duration(seconds: 2), () {
    //   if (usernameList.isEmpty && passwordList.isEmpty) {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => loginscreen()),
    //     );
    //   } else {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => HomeScreen(
    //                 score: 0,
    //               )),
    //     );
    //   }
    // });
  }

  Future<void> userlogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    await Future.delayed(Duration(seconds: 2));
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/images/ekart.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
