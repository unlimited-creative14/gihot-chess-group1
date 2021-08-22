import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/GameButton.dart';
import 'package:frontend/screens/components/PlayingBackground.dart';

class RoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PlayingBackground(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            alignment: Alignment.center,
            color: bg_transpearent,
            child: Column(
              children: [
                GameButton(
                  text: "Chơi ngay",
                  onpress: () {},
                  imgWidget: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.width * 0.125)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/hot_game.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                GameButton(
                  text: "Chơi ngay",
                  onpress: () {},
                  imgWidget: SvgPicture.asset("assets/icons/newgame.svg"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
