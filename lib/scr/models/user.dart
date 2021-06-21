import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  static const PHNO = "phno";

  String _name;
  String _email;
  String _id;
  String _phno;

//  getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get phno => _phno;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
    _phno = snapshot.data[PHNO];
  }
}
