import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/widgets/shoppingbagwidget.dart';

class ShoppingBag extends StatefulWidget {
  final DocumentSnapshot snapshot;

  ShoppingBag({this.snapshot});
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Item Cart',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    shoppingBagWidget(
                      items: 2,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Row(
//                  children: <Widget>[
//                    Text(
//                      'Your Food Cart',
//                      style: TextStyle(
//                        fontSize: 26,
//                        color: red,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
              Container(
                height: MediaQuery.of(context).size.height,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    Image.asset("images/Loader.gif"),
//                    Text('Your Cart is Empty',style: TextStyle(
//                      fontSize: 26,
//                      color: red,
//                      fontWeight: FontWeight.w500,
//                    ),)
//                  ],
//                ),
                child: widget.snapshot==null? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("images/Loader.gif"),
                    Text('Your Cart is Empty',style: TextStyle(
                      fontSize: 26,
                      color: red,
                      fontWeight: FontWeight.w500,
                    ),)
                  ],
                ):ListView(
                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//                      child: Container(
//                        height: 120,
//                        width: 100,
//                        decoration: BoxDecoration(color: white, boxShadow: [
//                          BoxShadow(
//                              color: grey, offset: Offset(2, 3), blurRadius: 15)
//                        ]),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.start,
//                          children: <Widget>[
//                            Image.network(
//                              widget.snapshot['url'],
//                              height: 140,
//                              width: 140,
//                            ),
//                            Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: <Widget>[
//                                RichText(
//                                  text: TextSpan(children: [
//                                    TextSpan(
//                                      text: widget.snapshot['name'] + '\n',
//                                      style: TextStyle(
//                                          fontSize: 25,
//                                          color: grey,
//                                          fontWeight: FontWeight.w600),
//                                    ),
//                                    TextSpan(
//                                      text: '₹ ${widget.snapshot['price']}\n',
//                                      style: TextStyle(
//                                          fontSize: 20,
//                                          color: grey,
//                                          fontWeight: FontWeight.w600),
//                                    ),
//                                  ]),
//                                ),
//                                IconButton(
//                                  icon: Icon(
//                                    Icons.delete,
//                                    color: red,
//                                  ),
//                                ),
//                              ],
//                            )
//                          ],
//                        ),
//                      ),
//                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(color: white, boxShadow: [
                          BoxShadow(
                              color: grey, offset: Offset(2, 3), blurRadius: 15)
                        ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.network(
                              widget.snapshot['url'],
                              fit: BoxFit.cover,
                              width: 120
                            ),SizedBox(width: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: widget.snapshot['name'] + '\n',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: "by " +
                                          widget.snapshot['vendor'] +
                                          '\n',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: black,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    TextSpan(
                                      text: '₹ ${widget.snapshot['price']}\n',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ]),
                                ),SizedBox(width: 10,),
                                IconButton(
                                  onPressed: (){},
                                  icon: Icon(
                                    Icons.delete,
                                    color: red,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
