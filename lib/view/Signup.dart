
import 'package:ekart/utils/customcolors.dart';
import 'package:ekart/view/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final namecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 100, top: 80, right: 100),
              child: Image(
                image: AssetImage(
                  'assets/images/ekart.png',
                ),
                height: 260,
                width: 360,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 80, top: 0, right: 60),
                height: 50,
                width: 500,
                child: TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    hintText: "Full Name",
                    hintStyle: TextStyle(),
                    filled: true,
                    fillColor: Color.fromARGB(210, 249, 249, 249),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 80, top: 10, right: 60),
                height: 50,
                width: 500,
                child: TextFormField(
                  
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    hintText: "Email",
                    hintStyle: TextStyle(),
                    filled: true,
                    fillColor: Color.fromARGB(210, 249, 249, 249),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 80, top: 10, right: 60),
                height: 50,
                width: 500,
                child: TextFormField(
                  obscureText: true,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    hintText: "Password",
                    hintStyle: TextStyle(),
                    filled: true,
                    fillColor: Color.fromARGB(210, 249, 249, 249),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
               FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: emailcontroller.text,
                      password: passwordcontroller.text)
                  .then((value) {
                print('created new account');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                ).onError((error, stackTrace) {
                  print('Error ${error.toString()}');
                });
              });
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(60, 100, 40, 5),
                  height: 55,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: kPrimaryColour),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.only(left: 70, top: 10),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 75, 40, 0),
              child: Text(
                'Already have an account?  Sign in',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColour),
              ),
            )
          ],
        ),
      ),
    );
  }

}
