import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/models/products.dart';


class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  Product product=Product(
  name: 'Namkeen',
  image: '1.jpg',
  price: 50,
  rating: 4.0,
  wishlist: true,
  vendor: 'haldiram',
  desc: "Namkeen (Devanāgarī: नमकीन, English: Salty), is a 1982 Hindi film, directed by Gulzar, with Sharmila Tagore, Sanjeev Kumar, Shabana Azmi and Waheeda Rehman as leads. It was yet another movie by Gulzar made on some very sensitive but untouched aspects of Indian society especially in rural areas."
  );
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
                    Text('Item Cart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
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
                                  '1',
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
                ),
              ),
              SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text('Your Food Cart', style: TextStyle(
                      fontSize: 26,
                      color: red,
                      fontWeight: FontWeight.bold,),),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.fromLTRB(10,5,10,5),
//                    child: Container(
//                      height: 120,
//                      width: 100,
//                      decoration: BoxDecoration(
//                        color: white,
//                        boxShadow: [
//                          BoxShadow(
//                              color: grey,
//                              offset: Offset(2, 3),
//                              blurRadius: 15)
//                        ]
//                      ),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          Image.asset('images/${product.image}',
//                          height: 140,
//                          width: 140,),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              RichText(text: TextSpan(
//                                children: [
//                                  TextSpan(text: product.name+'\n', style: TextStyle(
//                                  fontSize: 25,
//                                  color: grey                                  ,
//                                  fontWeight: FontWeight.w600),),
//                                  TextSpan(text:'₹ ${product.price}\n', style: TextStyle(
//                                      fontSize: 20,
//                                      color: grey                                  ,
//                                      fontWeight: FontWeight.w600),),
//
//                                ]
//                              ),
//                              ),
//                              IconButton(icon: Icon(Icons.delete,color: red,),),
//                            ],
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,5,10,5),
                    child: Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: grey,
                                offset: Offset(2, 3),
                                blurRadius: 15)
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('images/${product.image}',
                            height: 140,
                            width: 140,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RichText(text: TextSpan(
                                  children: [
                                    TextSpan(text: product.name+'\n', style: TextStyle(
                                        fontSize: 25,
                                        color: black                                  ,
                                        fontWeight: FontWeight.w600),),
                                    TextSpan(text: "by "+product.vendor+'\n', style: TextStyle(
                                        fontSize: 15,
                                        color: black                                  ,
                                        fontWeight: FontWeight.w300),),
                                    TextSpan(text:'₹ ${product.price}\n', style: TextStyle(
                                        fontSize: 20,
                                        color: black                                  ,
                                        fontWeight: FontWeight.w600),),

                                  ]
                              ),
                              ),
                              IconButton(icon: Icon(Icons.delete,color: red,),),
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
