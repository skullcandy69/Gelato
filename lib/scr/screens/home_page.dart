import 'package:flutter/material.dart';
import 'package:market_place/scr/widgets/carousel.dart';
import 'package:market_place/scr/widgets/categories.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/widgets/popular_product.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

Future<Null> _handleRefresh() async {
  await new Future.delayed(new Duration(seconds: 2));
  return null;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: red,
                  ),
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Home - Block A kalkaji dou...',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.notifications_none,
                          color: black,
                        ),
                        onPressed: null),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            StickyHeader(
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: white, boxShadow: [
                      BoxShadow(
                          color: grey, offset: Offset(1, 2), blurRadius: 10)
                    ]),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: red,
                      ),
                      trailing: Icon(
                        Icons.filter_list,
                        color: red,
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                            hintText: 'Find food and restaurent',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                content: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Coupons',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: grey),
                          ),
                        ],
                      ),
                    ),
                    Coupons(),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Categories',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: grey),
                          ),
                        ],
                      ),
                    ),
                    Categories(),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Popular Food',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: grey),
                          ),
                        ],
                      ),
                    ),
                    Popular(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
