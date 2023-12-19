import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdSlider extends StatefulWidget {
  const AdSlider({super.key});

  @override
  State<AdSlider> createState() => _AdSliderState();
}

class _AdSliderState extends State<AdSlider> {
   final List data = [
      {"image":"assets/images/Electronics.jpg"},
      {"image":"assets/images/Groceries.jpg"},
      {"image":"assets/images/slide 2.jpg"},
      {"image":"assets/images/slide3.jpg"},
    ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            height: 400,
          ),
          items: data.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 126, 125, 124)),
                    child: Image.asset(
                      i["image"],
                      
                      fit: BoxFit.cover,
                    ));
              },
            );
          }).toList(),
        ));
  }
}