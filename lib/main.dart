import 'package:flutter/material.dart';
import 'SplashPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//BuildContext used to draw on the screen

  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage());
  }
}
