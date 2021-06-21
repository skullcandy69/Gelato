import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Dishes extends StatefulWidget {
  final dish;
  Dishes({Key key, this.dish}) : super(key: key);

  @override
  _DishesState createState() => _DishesState();
}

class _DishesState extends State<Dishes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(child: Text(widget.dish["dish"].toString()))),
    );
  }
}
