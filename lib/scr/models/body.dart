import 'package:flutter/material.dart';
import 'package:market_place/scr/models/products.dart';
import 'package:market_place/scr/screens/cart.dart';
import 'package:market_place/scr/screens/details.dart';
import 'package:market_place/scr/screens/home_page.dart';

class Body extends StatelessWidget {
  final int index;

  Body(this.index);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return HomePage();

        break;
      case 2:
        return Details(product:  Product(
            name: 'Namkeen',
            image: '1.jpg',
            price: 50,
            rating: 4.0,
            wishlist: true,
            vendor: 'haldiram'),);
        break;
      default:
        return ShoppingBag();
        break;
    }
  }
}
