import 'dart:async';
import 'package:flutter/material.dart';
import 'package:market_place/scr/screens/home.dart';
import 'package:market_place/scr/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-9800396717606741~3973353423');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var issignedin = prefs.getString('issignedin');
  print(issignedin);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: issignedin == 'true' ? Home() : LoginScreen(),
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
  ));
//  runApp(MyApp());
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('images/cooking.gif  '),
      ),
    );
  }
}
