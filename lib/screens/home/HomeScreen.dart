import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/components/WelcomeBackground.dart';
import 'package:frontend/screens/playgame/RoomScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void start(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RoomScreen()));
  }

  void botplay(context) {
    //
  }

  void openProfile(context) {
    //
  }

  void introduction(context) {
    //
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WelcomeBackground(
        child: SingleChildScrollView(
            child: Container(
          alignment: Alignment.center,
          height: size.height,
          color: bg_transpearent,
          child: Column(
            children: [
              Container(
                height: size.height * 0.2,
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    openProfile(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(size.height * 0.03),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.height * 0.05)),
                      child: Image.asset(
                        "assets/images/profile.png",
                        height: size.height * 0.1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.8,
                child: RoundedButton(
                    text: "Bắt đầu",
                    onpress: () {
                      start(context);
                    }),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.8,
                child: RoundedButton(
                    text: "Chơi với máy",
                    onpress: () {
                      botplay(context);
                    }),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                  width: size.width * 0.8,
                  child: RoundedButton(
                      text: "Hướng dẫn",
                      onpress: () {
                        introduction(context);
                      })),
            ],
          ),
        )),
      ),
    );
  }
}
