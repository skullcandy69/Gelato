import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_place/scr/helpers/userinfo.dart';
import 'package:market_place/scr/models/user.dart';

enum status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  status _status = status.Uninitialized;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  //getter
  status get Status => _status;
  UserModel get userModel=>_userModel;
  FirebaseUser get user => _user;

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }
  Future<bool> signin() async {
    try {
      _status = status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      return true;
    } catch (e) {
      _status = status.Unauthenticated;
      notifyListeners();
      print('error:'+ e.toString());
      return false;
    }
  }

  Future<bool>signup()async{
    try{
      _status= status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email.text, password: password.text).then((user){
        Map<String,dynamic> values ={
          "name":name.text,
          "email":email.text,
          "id":user.user.uid
        };
        _userServices.createUser(values);

      });
      return true;
    }catch(e){
      _status=status.Unauthenticated;
      notifyListeners();
      print('error:'+ e.toString());
      return false;
    }
  }

  Future<void> signout(){
    _auth.signOut();
    _status=status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (user == null) {
      _status = status.Uninitialized;
    } else {
      _user = firebaseUser;
      _status = status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }

  void cleanControllers(){
    email.text="";
    password.text ="";
    name.text="";
  }
}
