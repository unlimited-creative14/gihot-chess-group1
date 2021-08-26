import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/component/chatService.dart';
import 'package:frontend/component/gameService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/welcome/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chinese chess',
      theme: ThemeData(primaryColor: light_blue, scaffoldBackgroundColor: dark),
      home: WelcomeScreen(),
    );
  }
}
