import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/helpers/screen_navigation.dart';
import 'package:market_place/scr/provider/authenticationbloc.dart';
import 'package:market_place/scr/screens/home.dart';
import 'package:market_place/scr/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phno = TextEditingController();
  UserRepo userRepo = new UserRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'images/logo.png',
                scale: 4,
              ),
              Center(
                child: Text(
                  'SIGNUP',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _name,
                      decoration: InputDecoration(

                          border: InputBorder.none,
                          hintText: "Name",
                          icon: Icon(Icons.account_circle)),
                      validator: (value) =>
                      value.isEmpty ? 'name cant be empty' : null,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phno,
                      decoration: InputDecoration(

                          border: InputBorder.none,
                          hintText: "Phone number",
                          icon: Icon(Icons.phone_android)),
                      validator: (value) =>
                      value.isEmpty ? 'name cant be empty' : null,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      decoration: InputDecoration(

                          border: InputBorder.none,
                          hintText: "Email",
                          icon: Icon(Icons.email)),
                      validator: (value) =>
                          value.isEmpty ? 'Email cant be empty' : null,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            icon: Icon(Icons.lock)),
                        validator: (value) =>
                            value.isEmpty ? 'password cant be empty' : null,
                      ),
                    ),
                  )),

              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Already have an account? Login'),
                ),
                onTap: () {},
              ),
              RaisedButton(
                onPressed: () {
                  createRecord(_name.text, _email.text, _phno.text, _password.text);
                  userRepo
                      .signUp(_email.text, _password.text)
                      .then((user) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('issignedin', 'true');
                    prefs.setString('email', _email.text);
                    user != null
                        ? Navigator.pushReplacement(context,
                            new MaterialPageRoute(builder: (context) => Home()))
                        : print('failed');
                  }).catchError((e) => print(e));
//                  changeScreen(context, Home());

                },
                color: red,
                child: Text(
                  'SIGNUP',
                  style: TextStyle(color: white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final databaseReference = Firestore.instance;

void createRecord(String name,String email,String phono,String pass) async {
  await databaseReference.collection("User").document(email).setData({
    'name': name,
    'email': email,
    'phone': phono,
    'password': pass
  });
  print(databaseReference);
}