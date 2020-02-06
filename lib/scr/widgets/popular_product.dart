import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/screen_navigation.dart';
import 'package:market_place/scr/models/products.dart';
import 'package:market_place/scr/screens/details.dart';

import '../helpers/commons.dart';

List<Product> productlist = [
  Product(
      name: 'Namkeen',
      image: '1.jpg',
      price: 50,
      rating: 4.0,
      wishlist: true,
      vendor: 'haldiram',
      desc:
          "Namkeen (Devanāgarī: नमकीन, English: Salty), is a 1982 Hindi film, directed by Gulzar, with Sharmila Tagore, Sanjeev Kumar, Shabana Azmi and Waheeda Rehman as leads. It was yet another movie by Gulzar made on some very sensitive but untouched aspects of Indian society especially in rural areas."),
  Product(
      name: 'Momos',
      image: '2.jpg',
      price: 70,
      rating: 3.0,
      wishlist: false,
      vendor: 'Dolma Aunty',
      desc: 'sdfscsdcs'),
  Product(
      name: 'Bhalle Papdi',
      image: '3.jpg',
      price: 120,
      rating: 5.0,
      wishlist: true,
      vendor: 'haldiram',
      desc: 'adsdas'),
  Product(
      name: 'PanCakes',
      image: 'food.jpg',
      price: 200,
      rating: 5.0,
      wishlist: true,
      vendor: 'Eat Fit',
      desc: 'dddsdsds'),
  Product(
      name: 'Tortia',
      image: '4.jpeg',
      price: 250,
      rating: 4.0,
      wishlist: false,
      vendor: 'Taco Bell',
      desc: 'dsdsds'),
  Product(
      name: 'Roll',
      image: '5.jpg',
      price: 150,
      rating: 4.0,
      wishlist: false,
      vendor: 'Roll Club',
      desc: 'dsds'),
];

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 270,
          child: ListView.builder(
              itemCount: productlist.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      changeScreen(
                          context,
                          Details(
                            product: productlist[index],
                          ));
                    },
                    child: Container(
                      height: 180,
                      width: 200,
                      decoration: BoxDecoration(color: white, boxShadow: [
                        BoxShadow(
                            color: grey, offset: Offset(1, 1), blurRadius: 5)
                      ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/${productlist[index].image}',
                              height: 150,
                              width: 180,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  productlist[index].name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: grey,
                                            offset: Offset(1, 1),
                                            blurRadius: 4)
                                      ],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: productlist[index].wishlist
                                        ? Icon(
                                            Icons.favorite,
                                            color: red,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            color: red,
                                            size: 20,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${productlist[index].rating}',
                                      style:
                                          TextStyle(color: grey, fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: red,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: red,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: red,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: red,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: grey,
                                      size: 15,
                                    ),
                                  ],
                                ),
                                Text(
                                  '₹ ${productlist[index].price}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
