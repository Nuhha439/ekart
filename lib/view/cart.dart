import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekart/model/Api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final api = Provider.of<ApiConnection>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Cart'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .collection('cart')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!.docs;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                              child: Text(
                                users[index]['name'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _showDialog(context, users[index].reference);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  subtitle: Text(users[index]['price']),
                  leading: Image.network(users[index]['thumbnail']),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () {
                // api.addwish();
                api.addToCart();
              },
              style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
                minimumSize: Size(
                  MediaQuery.of(context).size.width /
                      2, // Set width based on screen width
                  50, // Set a fixed height
                ),

                // Set a minimum size for the button

                backgroundColor: (Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(Icons.payment),
                  SizedBox(width: 5),
                  Text('Total Price'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
                minimumSize: Size(
                  MediaQuery.of(context).size.width /
                      2, // Set width based on screen width
                  50, // Set a fixed height
                ),
                backgroundColor: (Colors.blue),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.double_arrow_outlined),
                  SizedBox(width: 5),
                  Text('Buy Now'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, DocumentReference productRef) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hey,'),
          content: Text('Do you want to delete'),
          actions: [
            TextButton(
              onPressed: () {
                // Delete the product from the cart
                productRef.delete().then((_) {
                  Navigator.of(context).pop();
                }).catchError((error) {
                  // ignore: avoid_print
                  print('Error deleting product: $error');
                  // Handle the error as needed
                });
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
