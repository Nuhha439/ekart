import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiConnection extends ChangeNotifier {
  List<dynamic> myProducts = [];
  int currentIndex = 0;

  Future<void> addToCart() async {
    try {
      // Check if user is logged in

      FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;
      if (user != null) {
        // Access the Firestore collection for the user

        final users =
            FirebaseFirestore.instance.collection("Users").doc(user.uid);

        // Check if the user document exists

        // This line retrieves the user's document from Firestore.
        //If the document doesn't exist, userSnap.exists will be false.
        final userSnap = await users.get();

        // If the user document exists, it calculates the new total price by adding the existing total price
        //to the price of the current product. If the document doesn't exist, it sets the total price to the
        //price of the current product.

        int totalPrice = userSnap.exists
            ? userSnap['total prize'] + myProducts[currentIndex]["price"]
            : myProducts[currentIndex]["price"];

        // Create the data to be updated in Firestore

        final data = {
          'cart': FieldValue.arrayUnion(
            [
              {
                'Item': myProducts[currentIndex]["title"],
                'price': myProducts[currentIndex]["price"],
                'thumbnail': myProducts[currentIndex]["thumbnail"],
              }
            ],
          ),
          'total prize': totalPrice,
        };

        // If the user document doesn't exist, it sets the entire document with the new data.
        //If the document exists, it updates the document with the new data,
        //using the merge option to combine the existing data with the new data.

        if (!userSnap.exists) {
          await users.set(data);
        } else {
          await users.update(data);
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('$e');
    }
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      myProducts = jsonData['products'];
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

//   Future<void> AddtoCart() async {}

//   void addwish() {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       final data = {
//         'name': '${products[currentIndex]['title']}',
//         'price': '\$${products[currentIndex]['price']}',
//         'thumbnail': '${products[currentIndex]['thumbnail']}'
//       };

//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .collection('cart')
//           .add(data);
//     }
//   }
// }
}