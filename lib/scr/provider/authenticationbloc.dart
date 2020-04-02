import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UserRepo {
  FirebaseAuth firebaseAuth;
  UserRepo() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  Future<FirebaseUser> signUp(String email, String pass) async {
    try {
      var _authuser = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);
      print("REPO: ${_authuser.user.email})");
      return _authuser.user;
    } on PlatformException catch (e) {
      print("ERROR" + e.toString());
      throw Exception();
    }
  }

  Future<FirebaseUser> signIn(String email, String pass) async {
    try {
      var _authuser = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      return _authuser.user;
    } on PlatformException catch (e) {
      print("ERROR" + e.toString());
      throw Exception();
    }
  }

  Future<void> signOut() async {
    print('signed out');
    await FirebaseAuth.instance.signOut();
  }

  // check signIn
  Future<bool> isSignedIn() async {
    var currentUser = await firebaseAuth.currentUser();
    return currentUser != null;
  }

  // get current user
  Future<FirebaseUser> getCurrentUser() async {
    return await FirebaseAuth.instance.currentUser();
  }
}
