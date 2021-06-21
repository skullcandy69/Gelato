import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  List<Productmod> productlist = [];
  removeItem(Productmod p) {
    productlist.remove(p);
    notifyListeners();
  }

  totalprice() {
    int tprice = 0;
    if (productlist.length == 0) {
      tprice = 0;
    } else {
      for (int i = 0; i < productlist.length; i++) {
        tprice += productlist[i].price;
      }
    }

    notifyListeners();
    return tprice;
  }

  List<Productmod> getProductList() {
    print(productlist.toSet().toList().length.toString() + "hello");
    return productlist.toSet().toList();
  }

  int getQuanity(String name, String vendor) =>
      productlist.where((p) => name == p.name && vendor == p.vendor).length;

  addTaskInList(String name, String url, int price, String vendor) {
    Productmod taskModel = Productmod(name, vendor, price, url);
    productlist.add(taskModel);
    notifyListeners();
    //code to do
  }
}

class Productmod  extends Equatable {
  String name;
  String vendor;
  int price;
  String url;

  String get getTitle => name;
  String get getDetail => vendor;
  int get getprice => price;
  String get geturl => url;

  Productmod(this.name, this.vendor, this.price, this.url);

   @override
  List<Object> get props => [name];
}

// class Product{
//    String name;
//    String image;
//    double rating;
//    double price;
//    String vendor;
//    bool wishlist;
//   String desc;
//   Product({this.name, this.image, this.rating, this.price, this.vendor, this.wishlist,this.desc});

// }
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
