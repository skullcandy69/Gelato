import 'package:flutter/material.dart';
import 'package:market_place/scr/models/category.dart';

import '../helpers/commons.dart';

List<Category> categoriesList = [
  Category(name: 'Salad', image: 'salad.png'),
  Category(name: 'Ice Cream', image: 'ice-cream.png'),
  Category(name: 'Pint', image: 'pint.png'),
  Category(name: 'Sandwich', image: 'sandwich.png'),
  Category(name: 'Steak', image: 'steak.png'),
  Category(name: 'Sea Food', image: 'fish.png'),

];

class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: white, boxShadow: [
                    BoxShadow(color: grey, offset: Offset(1, 2), blurRadius: 10)
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'images/${categoriesList[index].image}',
                      width: 53,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  categoriesList[index].name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
