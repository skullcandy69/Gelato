
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('images/cooking.gif',fit: BoxFit.fitHeight,height: MediaQuery.of(context).size.height,)
    );
  }
}
