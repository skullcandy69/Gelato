import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/models/products.dart';
import 'package:market_place/scr/widgets/shoppingbagwidget.dart';
import 'package:provider/provider.dart';

class ShoppingBag extends StatefulWidget {
  final DocumentSnapshot snapshot;

  ShoppingBag({this.snapshot});
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductModel>(
      builder: (context, pro, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: white,
            title: Text(
              'Item Cart',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: black),
            ),
            actions: <Widget>[
              shoppingBagWidget(
                items: pro.productlist.length,
              ),
            ],
          ),
          body: SafeArea(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .7,
                    child: pro.productlist.length == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset("images/Loader.gif"),
                              Text(
                                'Your Cart is Empty',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: red,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )
                        : ListView.builder(
                            itemCount: pro.getProductList().length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: pro.getProductList()[index].name +
                                            '\n',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      TextSpan(
                                        text: "by " +
                                            pro.getProductList()[index].vendor +
                                            '\n',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      TextSpan(
                                        text:
                                            '₹ ${pro.getProductList()[index].price} X${pro.getQuanity(pro.getProductList()[index].name, pro.getProductList()[index].vendor).toString()}\n',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: grey,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ]),
                                  ),
                                  leading: Container(
                                    width: 70,
                                    decoration: new BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadiusDirectional.all(
                                                Radius.circular(20)),
                                        image: new DecorationImage(
                                            image: NetworkImage(pro
                                                .getProductList()[index]
                                                .url),
                                            fit: BoxFit.fill)),
                                  ),
                                  trailing: Column(children: <Widget>[
                                    IconButton(
                                        color: red,
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          // print(widget.order.id);
                                          // Provider.of<ProductModel>(context, listen: false)
                                          //     .removeProduct(widget.order);
                                          // setState(() {
                                          //   deletCartItem(widget.order.id.toString()
                                          //   );
                                          // });
                                        }),
                                    Container(
                                      // height: 30,
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     // Provider.of<ProductModel>(context,
                                          //     //         listen: false)
                                          //     //     .removeItem(widget.order);
                                          //     // setState(() {
                                          //     //   quantity > 0
                                          //     //       ? updateCart(widget.order.id.toString(),
                                          //     //           quantity - 1)
                                          //     //       : print('item 0');
                                          //     // });
                                          //   },
                                          //   child: Container(
                                          //       height: 25,
                                          //       width: 25.0,
                                          //       decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(10.0),
                                          //         border: Border.all(
                                          //           width: 0.8,
                                          //           color: Colors.black54,
                                          //         ),
                                          //       ),
                                          //       child: Center(
                                          //         child: Text(
                                          //           '-',
                                          //           style: TextStyle(
                                          //             color: Theme.of(context).primaryColor,
                                          //             fontSize: 20.0,
                                          //             fontWeight: FontWeight.w600,
                                          //           ),
                                          //         ),
                                          //       )),
                                          // ),
                                          // SizedBox(width: 20.0),

                                          // SizedBox(width: 20.0),

                                          // GestureDetector(
                                          //   behavior: HitTestBehavior.opaque,
                                          //   onTap: () {
                                          //     print('add');

                                          //     // Provider.of<ProductModel>(context,
                                          //     //         listen: false)
                                          //     //     .addTaskInList(widget.order);
                                          //     // setState(() {
                                          //     //   updateCart(widget.order.id.toString(),
                                          //     //       quantity + 1);
                                          //     // });
                                          //     // car.createState();
                                          //   },
                                          //   child: Container(
                                          //       height: 25,
                                          //       width: 25.0,
                                          //       decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(10.0),
                                          //         border: Border.all(
                                          //           width: 0.8,
                                          //           color: Colors.black54,
                                          //         ),
                                          //       ),
                                          //       child: Center(
                                          //         child: Text(
                                          //           '+',
                                          //           style: TextStyle(
                                          //             color: Theme.of(context).primaryColor,
                                          //             fontSize: 20.0,
                                          //             fontWeight: FontWeight.w600,
                                          //           ),
                                          //         ),
                                          //       )),
                                          // ),
                                        ],
                                      ),
                                    )
                                  ]));
                            }),
                  ),
                  pro.productlist.length == 0
                      ? Container()
                      : ListTile(
                          leading: Text(
                            'Total price:',
                            style: TextStyle(
                                fontSize: 20,
                                color: black,
                                fontWeight: FontWeight.w600),
                          ),
                          title: Text(
                            "${pro.totalprice().toString()} ₹",
                            style: TextStyle(
                                fontSize: 20,
                                color: black,
                                fontWeight: FontWeight.w900),
                          ),
                          trailing: RaisedButton(
                            onPressed: () {},
                            color: green,
                            child: Text(
                              'CheckOut',
                              style: TextStyle(color: white),
                            ),
                          ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
