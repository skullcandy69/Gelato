import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/helpers/screen_navigation.dart';
import 'package:market_place/scr/provider/auth.dart';
import 'package:market_place/scr/screens/home.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phno = TextEditingController();
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);
    

    return Scaffold(
      backgroundColor: white,
      key: _key,
      body: authprovider.status == Status.Authenticating
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
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
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
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
                            controller: authprovider.name,
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
                            maxLength: 10,
                            maxLengthEnforced: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone number",
                            
                                icon: Icon(Icons.phone_android)),
                                validator: (_phno) {
                                _phno.length==0 ? 'name cant be empty' : null;
                                
                                }
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
                            controller: authprovider.email,
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
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: TextFormField(
                              controller: authprovider.password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  icon: Icon(Icons.lock)),
                              validator: (value) => value.isEmpty
                                  ? 'password cant be empty'
                                  : null,
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
                      onPressed: () async {

                        if (!await authprovider.signUp(_phno.text)) {
                          _key.currentState.showSnackBar(SnackBar(
                            content: Text('Signup failed'),
                          ));
                          return;
                        }
                        authprovider.clearController();
                        changeScreenRepacement(context, Home());
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

