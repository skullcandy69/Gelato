import 'package:flutter/material.dart';
import 'package:market_place/scr/models/products.dart';
import 'package:market_place/scr/provider/auth.dart';
import 'package:market_place/scr/screens/home.dart';
import 'package:market_place/scr/screens/login.dart';
import 'package:market_place/scr/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductModel()),
        
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food App',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: SController())));
}

class SController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      // case Status.Uninitialized:
      //   return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}
