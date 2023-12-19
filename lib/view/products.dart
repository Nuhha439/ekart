
import 'package:ekart/model/Api.dart';
import 'package:ekart/view/cart.dart';
import 'package:ekart/view/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

// ignore: camel_case_types
class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    // Padding(
    //     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40)
    //     );
    final api = Provider.of<ApiConnection>(context, listen: false);
    Provider.of<ApiConnection>(context).fetchData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Products',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // setState(() {
              //   if (cartList.contains(item)) cartList.remove(item);
              //   else{
              //     cartList.add(item);
              //   }
              // });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const CartPage()));
            },
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: api.myProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Provider.of<ApiConnection>(context, listen: false).currentIndex =
                  index;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProdutDetailPage()));
            },
            child: GridTile(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Column(children: [
                  Image.network(
                    api.myProducts[index]['thumbnail'],
                    height: 120,
                    width: 140,
                  ),
                  Text(api.myProducts[index]['title']),
                  Text(
                    'Price:\$${api.myProducts[index]['price']}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(api.myProducts[index]['brand'])
                ]),
              ),
            ),
          );
        },
     ),
);
}
}