import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:market_place/scr/models/carouselclass.dart';

import '../helpers/commons.dart';

List<Carousel> carouselList = [
  Carousel('discount3.jpg'),
  Carousel('discount1.jpg'),
  Carousel('discount2.jpg'),
  Carousel('discount4.jpg'),
  Carousel('discount5.jpg'),
];

class Coupons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselList.length,
      autoPlay: true,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // shape: BoxShape.circle,
              color: white,
              boxShadow: [
                BoxShadow(color: grey, offset: Offset(1, 2), blurRadius: 10),
              ]),
          child: Image.asset(
            'images/${carouselList[index].image}',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
