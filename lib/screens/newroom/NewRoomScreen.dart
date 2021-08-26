import 'package:flutter/material.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/PlayingBackground.dart';

class NewRoomScreen extends StatefulWidget {
  NewRoomScreen({Key? key}) : super(key: key);

  @override
  _NewRoomScreenState createState() => _NewRoomScreenState();
}

class _NewRoomScreenState extends State<NewRoomScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: PlayingBackground(
          child: Container(
        color: bg_transpearent,
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                child: Column(
              children: [
                Container(
                  width: size.width * 0.2,
                  height: size.width * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.1),
                      image: DecorationImage(
                          image: AssetImage("assets/images/profile.png"))),
                ),
                SizedBox(height: size.width * 0.04),
                Text("name", style: TextStyle(fontSize: 18, color: light))
              ],
            )),
            Container(
                child: Column(
              children: [
                Container(
                  width: size.width * 0.2,
                  height: size.width * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.1),
                      image: DecorationImage(
                          image: AssetImage("assets/images/profile.png"))),
                ),
                SizedBox(height: size.width * 0.04),
                Text("name", style: TextStyle(fontSize: 18, color: light))
              ],
            ))
          ],
        ),
      )),
    );
  }
}
