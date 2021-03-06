import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/helpers/screen_navigation.dart';
import 'package:market_place/scr/widgets/Dishes.dart';
import 'package:market_place/scr/widgets/loading.dart';

class Restaurants extends StatefulWidget {
  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('restaurants').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }
        var userDocument = snapshot.data;
        print(userDocument);
        return ListView.builder(
            itemCount: userDocument.documents.length,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () => changeScreen(
                    context,
                    Dishes(
                      dish: snapshot.data.documents[index],
                    )),
                child:
                    _buildListItem(context, snapshot.data.documents[index])));
      },
    );
  }
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            child: Image.network(
              document['logo'],
              height: MediaQuery.of(context).size.height,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: document['name'] + '\n',
                style: TextStyle(
                    fontSize: 20, color: black, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: document['special'] + '\n',
                style: TextStyle(color: grey, fontWeight: FontWeight.w300),
              ),
              TextSpan(
                text: document['location'],
                style: TextStyle(color: grey, fontWeight: FontWeight.w300),
              ),
            ]),
          )
        ],
      ),
    ),
  );
}
