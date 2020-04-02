import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_place/scr/models/products.dart';
import 'package:market_place/scr/helpers/commons.dart';

class Details extends StatefulWidget {
  final DocumentSnapshot product;

  Details({ this.product});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    widget.product['url'],
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            'images/shopping-bag.png',
                            scale: 18,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 17,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: grey,
                                        offset: Offset(2, 3),
                                        blurRadius: 3)
                                  ]),
                              child: Center(
                                child: Text(
                                  '12',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: red,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.product['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 26),
                      ),
                      Text(
                        '₹ ${widget.product['price']}',
                        style: TextStyle(
                            color: red,
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'by ${widget.product['vendor']}',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 18),
                      ),
                    ],
                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Text(
//                       'Rating',
//                        style: TextStyle(
//                            fontWeight: FontWeight.w200, fontSize: 18),
//                      ),
//                      Text(
//                        ' ${widget.product.rating}',
//                        style: TextStyle(
//                            color: red,
//                            fontWeight: FontWeight.w300,
//                            fontSize: 20),
//                      ),
//                    ],
//                  ),

                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: (){},
                    icon: Icon(
                      Icons.remove,
                      color: black,
                      size: 30,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(color: red),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                      child: Text(
                        'Add To Bag',
                        style: TextStyle(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: (){},
                    icon: Icon(
                      Icons.add,
                      color: black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text(widget.product['desc']),
              ),
            )
          ],
        ),
      ),
    );
  }
}
