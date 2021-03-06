import 'package:flutter/material.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/welcome/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chinese chess',
      theme: ThemeData(primaryColor: light_blue, scaffoldBackgroundColor: dark),
      home: WelcomeScreen(),
    );
  }
}
