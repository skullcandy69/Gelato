import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:market_place/scr/screens/top%20brands.dart';
import 'package:market_place/scr/widgets/carousel.dart';
import 'package:market_place/scr/widgets/categories.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/widgets/popular_product.dart';
import 'package:market_place/scr/widgets/restaurants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

String appunitid = 'ca-app-pub-9800396717606741/7063385345';

Future<Null> _handleRefresh() async {
  await new Future.delayed(new Duration(seconds: 2));
  return null;
}

//BannerAd _bannerAd = createBannerAd()..load();
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollPhysics _scrollController = new ScrollPhysics();
  final FirebaseMessaging _messaging = FirebaseMessaging();

  // @override
  // void initState() {
  //   super.initState();

  //   _messaging.getToken().then((token) {
  //     print(token);
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
    loc();

    _messaging.getToken().then((token) {
      print(token);
    });
  }

  loc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('location');
    setState(() {
      x = stringValue;
    });
    print(stringValue);
    return x;
  }

  String x;
  @override
  Widget build(BuildContext context) {
    const _adUnitID = "ca-app-pub-3940256099942544/8135179316";
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
          // controller: _scrollController,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  focusNode: FocusNode(),
                  icon: Icon(
                    Icons.location_on,
                    color: red,
                  ),
                  onPressed: () async {
                    _getCurrentLocation();
                  },
                ),
                new Flexible(
                  child: new Container(
                      padding: new EdgeInsets.only(right: 13.0),
                      child: x == null
                          ? Text(
                              'Fetching location...',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          : Text(
                              x,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )),
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
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Coupons',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: black),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Get upto 50% off",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Coupons(),
                    SizedBox(
                      child: Container(
                        height: 10,
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                                color: black),
                          ),
                        ],
                      ),
                    ),
                    Categories(),
                    SizedBox(
                      child: Container(
                        height: 10,
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Popular Brands",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: black),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Most ordered from around your locality",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TopBrands()
                  ],
                )),
            SizedBox(
              child: Container(
                height: 10,
                color: Colors.black12,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            NativeAdmobBannerView(
              // Your ad unit id
              adUnitID: _adUnitID,

              // Styling native view with options
              options: const BannerOptions(
                backgroundColor: Colors.white,
                indicatorColor: Colors.black,
                ratingColor: Colors.yellow,
                adLabelOptions: const TextOptions(
                  fontSize: 12,
                  color: Colors.white,
                  backgroundColor: Color(0xFFFFCC66),
                ),
                headlineTextOptions: const TextOptions(
                  fontSize: 16,
                  color: Colors.black,
                ),
                advertiserTextOptions: const TextOptions(
                  fontSize: 14,
                  color: Colors.black,
                ),
                bodyTextOptions: const TextOptions(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                storeTextOptions: const TextOptions(
                  fontSize: 12,
                  color: Colors.black,
                ),
                priceTextOptions: const TextOptions(
                  fontSize: 12,
                  color: Colors.black,
                ),
                callToActionOptions: const TextOptions(
                  fontSize: 15,
                  color: Colors.white,
                  backgroundColor: Color(0xFF4CBE99),
                ),
              ),
              showMedia: true,

              // Content paddings
              contentPadding: EdgeInsets.all(10),

              onCreate: (controller) {
                // controller.setOptions(BannerOptions()); // change view styling options
              },
            ),
            SizedBox(
              child: Container(
                height: 10,
                color: Colors.black12,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Popular Food',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: black),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Try some of the popular dishes",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
//                          _bannerAd?.dispose();
//                          _bannerAd = null;
                },
                child: Popular()),
            SizedBox(
              child: Container(
                height: 10,
                color: Colors.black12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'All Restaurants Nearby',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: black),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Discover unique tastes nearby",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  Restaurants(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String location;

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('location');
    location = stringValue;
//    setState(() {
//      location = stringValue;
//    });
  }

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('location', _currentAddress);
  }

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  String _currentAddress;
  Position _currentPosition;
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}${place.thoroughfare},${place.locality}, ${place.postalCode},${place.subAdministrativeArea}";
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('location', _currentAddress);
    } catch (e) {
      print(e);
    }
  }
}
