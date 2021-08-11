import 'package:flutter/material.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/CircleChessBackground.dart';
import 'package:frontend/screens/components/WelcomeBackground.dart';
import 'package:frontend/screens/login/LoginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WelcomeBackground(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Container(
            height: size.height,
            width: size.width,
            color: bg_transpearent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: [
                    CircleChessBackground(),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Gihot Chess",
                        style: TextStyle(fontSize: 35, color: light)),
                  ],
                ),
                Text("Tap to play",
                    style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: light)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
