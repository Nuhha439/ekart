import 'package:carousel_slider/carousel_slider.dart';
import 'package:ekart/model/Api.dart';
import 'package:ekart/utils/customcolors.dart';
import 'package:ekart/view/cart.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ProdutDetailPage extends StatefulWidget {
  const ProdutDetailPage({super.key});

  @override
  State<ProdutDetailPage> createState() => _ProdutDetailPageState();
}

class _ProdutDetailPageState extends State<ProdutDetailPage> {
  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiConnection>(context, listen: false);
    List<dynamic> images = [];
    images = api.myProducts[api.currentIndex]['images'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kBGColor,
        title: Text(
          "Products",
          style: TextStyle(color: KTextColor),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              height: 400.0,
            ),
            items: [
              for (int i = 0; i < images.length; i++)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Image(image: NetworkImage(images[i])),
                )
            ],
          ),
          Text(
            api.myProducts[api.currentIndex]['title'],
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          // Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Text(api.products[api.currentIndex]['category'])),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              api.myProducts[api.currentIndex]['description'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    },
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: KTextColor),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
