import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/commons.dart';


class shoppingBagWidget extends StatelessWidget {
  final int items;

   shoppingBagWidget({this.items}) ;

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                  items.toString(),
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
    );
  }
}
