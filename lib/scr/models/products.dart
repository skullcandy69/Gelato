import 'package:cloud_firestore/cloud_firestore.dart';


class Product{
   String name;
   String image;
   double rating;
   double price;
   String vendor;
   bool wishlist;
  String desc;
  Product({this.name, this.image, this.rating, this.price, this.vendor, this.wishlist,this.desc});

}
//
//class Product{
//
//  static const NAME = 'name';
//  static const PRICE = 'price';
//  static const IMAGE = 'image';
//  static const RATING = 'rating';
//  static const VENDOR = 'vendor';
//  static const WISHLIST = 'wishlist';
//  static const DESC = 'desc';
//
//
//
//  String _name;
//  String _image;
//  double _rating;
//  double _price;
//  String _vendor;
//  bool _wishlist;
//  String _desc;
//
//  String get name=>_name;
//  String get image=> _image;
//  double get rating=>_rating;
//  double get price=>_price;
//  String get vendor=>_vendor;
//  bool get wishlist=>_wishlist;
//  String get desc=>_desc;
//
//  Product.fromSnapshot(DocumentSnapshot snapshot){
//    Map data = snapshot.data;
//    _name = data[NAME];
//    _price = data[PRICE];
//    _image = data[IMAGE];
//    _vendor = data[VENDOR];
//    _wishlist = data[WISHLIST];
//    _rating = data[RATING];
//    _desc = data[DESC];
//  }
//
//}