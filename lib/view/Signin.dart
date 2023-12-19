// ignore_for_file: prefer_const_constructors

import 'package:ekart/model/provider.dart';
import 'package:ekart/utils/customcolors.dart';
import 'package:ekart/view/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  final namecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  String name = 'Ayesha';
  String password = '223232';

  List<String> usernameList = [];
  List<String> passwordList = [];

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
                    hintText: "User Id",
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
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility,
                        color: const Color.fromARGB(255, 189, 192, 194),
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(210, 249, 249, 249),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (namecontroller.text == name &&
                    passwordcontroller.text == password) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                  Provider.of<Savelogin>(context, listen: false)
                  .addLogin(namecontroller.text, passwordcontroller.text);
                }
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
                    'Sign in',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 25, 40, 5),
              child: Text(
                'Forget your password?',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: KTextColor),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 75, 40, 0),
              child: Text(
                'Not a member? Sign up',
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
