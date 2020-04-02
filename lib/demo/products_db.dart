import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_place/scr/models/products.dart';

Firestore _firestore = Firestore.instance;
String collection = 'Products';
//
//Future<List<Product>> getProducts()=>
//    _firestore.collection(collection).getDocuments().then((snap){
//      List<Product> products=[];
//      snap.documents.map((snapshot)=>products.add(Product.fromSnapshot(snapshot)));
//      return products;
//    });