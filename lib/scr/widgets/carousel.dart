import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../helpers/commons.dart';



class Coupons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('offers').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }
        var userDocument = snapshot.data;
        return CarouselSlider.builder(
            itemCount: userDocument.documents.length,
            autoPlay: true,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index]));
      },
    );
  }
}

_buildListItem(BuildContext context, document) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
// shape: BoxShape.circle,
          color: white,
          boxShadow: [
            BoxShadow(color: grey, offset: Offset(1, 2), blurRadius: 10),
          ]),
      child: Image.network(
        document["url"],
        fit: BoxFit.fill,
      )??CircularProgressIndicator(),
    ),
  );
}