import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ekart/utils/customcolors.dart';
import 'package:ekart/view/products.dart';

import 'package:ekart/view/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List data = [
    {"image": "assets/images/Electronics.jpg"},
    {"image": "assets/images/Groceries.jpg"},
    {"image": "assets/images/slide 4.jpg"},
    {"image": "assets/images/slide3.jpg"},
  ];

  int current_index = 0;
  final List<Widget> pages = [
    // '/home': (context) => HomePage(),
    // '/cart': (context) => CartPage(),
    // '/settings': (context) => SettingsPage(),
    // '/profile': (context) => ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Row(
              //space between widgets
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    //appbar color
                    color: kBGColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  //Drawer icon
                  child: Builder(
                      builder: (context) => IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(Icons.dashboard),
                            color: KTextColor,
                          )),
                ),
                const Column(
                  children: [
                    //user name
                    Text('Ayesha'),
                    //user location
                    Text(
                      'London,UK',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                CircleAvatar(
                  backgroundColor: kPrimaryColour,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    height: 55,
                    decoration: BoxDecoration(
                        color: kBGColor,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 4.0,
                          )
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        //remove Bar
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColour, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: KTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                //Sorting button
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Products(),
                          ),
                        );
                      },
                      icon: Icon(Icons.sort),
                      color: KTextColor,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      aspectRatio: 16 / 9,
                    ),
                    items: data.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 126, 125, 124)),
                              child: Image.asset(
                                i["image"],
                                fit: BoxFit.cover,
                              ));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    'Category',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  width: 200,
                ),
                Container(
                  child: Text(
                    'See more',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                          color: kPrimaryColour,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                          color: kPrimaryColour,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                          color: kPrimaryColour,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                          color: kPrimaryColour,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ],
                ),
              )
            ]),
            Row(
              children: [
                Container(
                  child: Text(
                    'Popular Products',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column()
          ])),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CurvedNavigationBar(
            
              height: 50,
              backgroundColor: Colors.white,
              color: Colors.white,
              buttonBackgroundColor: Colors.grey.shade300,
              onTap: (int index) {
                setState(() {
                  current_index = index;
                });
              },
              
              items: <Widget>[
                Icon(Icons.home),
                Icon(Icons.shopping_cart),
                Icon(Icons.settings),
                Icon(Icons.person)
              ]),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: kPrimaryColour),
              accountName: Text(
                "Ayesha Nuhha",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "ayeshakorambayil@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
