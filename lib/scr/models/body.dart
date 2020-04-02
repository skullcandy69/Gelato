import 'package:flutter/material.dart';
import 'package:market_place/scr/screens/cart.dart';
import 'package:market_place/scr/screens/details.dart';
import 'package:market_place/scr/screens/home_page.dart';
import 'package:market_place/scr/screens/profile.dart';

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
        return Profile();
        break;
      default:
        return ShoppingBag();
        break;
    }
  }
}
