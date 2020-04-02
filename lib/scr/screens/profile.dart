import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/helpers/screen_navigation.dart';
import 'package:market_place/scr/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "SHIVAM AHUJA",
                    style: TextStyle(
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      _settingModalBottomSheet(context);
                    },
                    child: Text(
                      "EDIT",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "9718529289",
                    style: TextStyle(
                        color: grey, fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Shiv.ahuja1494@gmail.com",
                    style: TextStyle(
                        color: grey, fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: SizedBox(
                child: Container(
                  height: 2,
                  color: Colors.black54,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "My Account",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Addresses,Payments,Referrals & Offers",
                        style: TextStyle(
                            color: grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.home, size: 20),
                    title: Text(
                      "Manage Address",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.payment, size: 20),
                    title: Text(
                      "Payments",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.add_comment, size: 20),
                    title: Text("Referrals",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.local_offer, size: 20),
                    title: Text("Offers",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: SizedBox(
                child: Container(
                  height: 2,
                  color: Colors.black54,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Help",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "FAQs & Links",
                        style: TextStyle(
                            color: grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: SizedBox(
                child: Container(
                  height: 2,
                  color: Colors.black54,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                print('good bye');
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('issignedin');
                prefs.remove('location');
                changeScreenRepacement(context, LoginScreen());
              },
              title: Text("logout",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              trailing: Icon(
                Icons.exit_to_app,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) async {
    TextEditingController _email = TextEditingController();
    TextEditingController _name = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _phno = TextEditingController();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var doc = prefs.getString('email');
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Edit Account',
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),

//
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15.0, right: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    controller: _name,
                    decoration: InputDecoration(
                        fillColor: Colors.deepOrangeAccent,
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    enabled: false,
                    initialValue: doc,
                    decoration: InputDecoration(
                        fillColor: Colors.deepOrangeAccent,
                        labelText: 'EMAIL ID(cannot be changed)',
                        labelStyle: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w300,
                            fontSize: 15)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15, left: 15.0, right: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _phno,
                    maxLength: 10,
                    decoration: InputDecoration(
                        fillColor: Colors.deepOrangeAccent,
                        labelText: 'PHONE NUMBER',
                        labelStyle: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15.0, right: 15, bottom: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(
                        fillColor: Colors.deepOrangeAccent,
                        labelText: 'CONFIRM PASSWORD',
                        labelStyle: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                    validator: (String value) {
                      if (value.length < 6) {
                        return 'Please enter some text';
                      } else
                        return null;
                    },
                  ),
                ),

                RaisedButton(
                  onPressed: () {
                    _formKey.currentState.validate()
                        ? Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Account Updated!!'),
                            duration: Duration(seconds: 3),
                      backgroundColor: green,
                          ))
                        : null;
                    _formKey.currentState.validate()
                        ? updateData(_name.text, _phno.text, _password.text)
                        : null;
                    _formKey.currentState.validate()
                        ? Navigator.pop(context)
                        : null;
                  },
                  color: Colors.deepOrange,
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(color: white),
                  ),
                ),
              ]),
              autovalidate: true,
            ),
          );
        });
  }
}

inputData() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  final String uid = user.uid.toString();
  return uid;
}

void updateData(String name, String phono, String pass) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var doc = prefs.getString('email');
  print(doc);
  try {
    databaseReference.collection('User').document(doc).updateData({
      'name': name,
//      'email': email,
      'phone': phono,
      'password': pass
    });
  } catch (e) {
    print(e.toString());
  }
}

//
//Future<FirebaseUser> inputData() async {
//  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
//  final String uid = user.uid.toString();
//  final String phono= user.phoneNumber.toString();
//  return user;
//}
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//      body: Center(
//        child: Column(
//          children: <Widget>[
//            RaisedButton(
//              child: Text('Create Record'),
//              onPressed: () {
//                createRecord();
//              },
//            ),
//            RaisedButton(
//              child: Text('View Record'),
//              onPressed: () {
//                getData();
//              },
//            ),
//            RaisedButton(
//              child: Text('Update Record'),
//              onPressed: () {
//                updateData();
//              },
//            ),
//            RaisedButton(
//              child: Text('Delete Record'),
//              onPressed: () {
//                deleteData();
//              },
//            ),
//            Container(
//              height: 400,color: blue,
//              child: BookList(),
//            )
//
//          ],
//        ),
//      ),
//      floatingActionButton: RaisedButton(
//        onPressed: () async {
//          print('good bye');
//          SharedPreferences prefs = await SharedPreferences.getInstance();
//          prefs.remove('issignedin');
//          prefs.remove('location');
//          changeScreenRepacement(context, LoginScreen());
//        },
//        child: Text('logout'),
//      ),
//    );
//  }
//
final databaseReference = Firestore.instance;
//
//  void createRecord() async {
//    await databaseReference.collection("Products").document("1").setData({
//      'name': 'matthi',
//      'desc': 'lala ji ki matthi',
//      'rating': 5,
//      'price': 100
//    });
//
//    DocumentReference ref = await databaseReference.collection("books").add({
//      'title': 'Flutter in Action',
//      'description': 'Complete Programming Guide to learn Flutter'
//    });
//    print(ref.documentID);
//  }
//
//  void getData() async{
//    SharedPreferences pref= await SharedPreferences.getInstance();
//    var email = pref.getString('email');
//    databaseReference
//        .collection("User").document(email).snapshots();
//    var userDocument = snapshot.data;
//  }
//

//
//  void deleteData() {
//    try {
//      databaseReference.collection('books').document('2').delete();
//    } catch (e) {
//      print(e.toString());
//    }
//  }
//}
