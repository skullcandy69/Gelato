import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/screen_navigation.dart';
import 'package:market_place/scr/models/products.dart';
import 'package:market_place/scr/screens/cart.dart';
import 'package:market_place/scr/screens/details.dart';

import '../helpers/commons.dart';

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 270,
          child: StreamBuilder(
            stream: Firestore.instance.collection('Products').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('Loading...');
              }
              var userDocument = snapshot.data;
              return ListView.builder(
                  itemCount: userDocument.documents.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      _buildListItem(context, snapshot.data.documents[index]));
            },
          ),
        ));
  }
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
          onTap: () {
            changeScreen(
                context,
                Details(
                  product: document,
                ));
          },
          child: Container(
              height: 180,
              width: 200,
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(color: grey, offset: Offset(1, 1), blurRadius: 5)
              ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                          document["url"],
                          height: 150,
//                          width: 180,
                          fit: BoxFit.fill,
                        ) ??
                        CircularProgressIndicator(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 8.0, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            document["name"],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
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
                              child: true
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
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            document["vendor"],
                            style: TextStyle(
                                fontSize: 12,
                                color: grey,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '₹ ${document["price"]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                '${document["rating"]}',
                                style: TextStyle(color: grey, fontSize: 18),
                              ),
                              for (int i = 0; i < document["rating"]; i++)
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 15,
                                ),
                              for (int i = 0; i < 5 - document["rating"]; i++)
                                Icon(
                                  Icons.star,
                                  color: grey,
                                  size: 15,
                                ),
                            ],
                          ),
                          Container(
                            height: 28,
                            width: 80,
                            decoration:
                                BoxDecoration(border: Border.all(color: grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.remove,
                                    color: grey,
                                  ),
                                ),
                                Text(
                                  'ADD',
                                  style: TextStyle(color: red),
                                ),
                                InkWell(
                                  onTap: () {
                                    print('send');
//                                    Scaffold.of(context).showSnackBar(SnackBar(
//                                      content: Text('Account Updated!!'),backgroundColor: green,
//
//                                    ));
                                    changeScreen(
                                      context, ShoppingBag(
                                        snapshot: document,
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: grey,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]))));
}
