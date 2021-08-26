import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/CustomBackButton.dart';
import 'package:frontend/screens/components/GameButton.dart';
import 'package:frontend/screens/components/PlayingBackground.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/newroom/NewRoomScreen.dart';
import 'package:frontend/screens/playinggame/PlayingGameScreen.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  bool isWaiting = false;
  int counting = 0;
  bool stopTimer = false;

  void changeWaitingState(bool targetState) {
    setState(() {
      isWaiting = !isWaiting;
    });
    Timer timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        counting += 1;
      });
      if (stopTimer) timer.cancel();
    });

    if (!targetState) {
      timer.cancel();
    } else {
      counting = 0;
    }
  }

  void back(context) {
    Navigator.pop(context);
  }

  void hotGame(context) {}
  void cancelGame(context) {}

  void commonGame(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewRoomScreen()));
  }

  void playwithfr(context) {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        PlayingBackground(
          child: Container(
            height: size.height,
            color: bg_transpearent,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.width * 0.1),
                  Container(
                    width: size.width,
                    alignment: Alignment.centerLeft,
                    child: CustomBackButton(
                      onpress: () {
                        back(context);
                      },
                    ),
                  ),
                  GameButton(
                    text: "Chơi ngay",
                    onpress: () {
                      stopTimer = false;
                      changeWaitingState(true);
                      hotGame(context);
                    },
                    imgWidget: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(size.width * 0.125)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/hot_game.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  GameButton(
                    text: "Tạo bàn mới",
                    onpress: () {
                      commonGame(context);
                    },
                    imgWidget: SvgPicture.asset("assets/icons/newgame.svg"),
                  ),
                  SizedBox(height: size.height * 0.03),
                  GameButton(
                    text: "Tìm bàn",
                    onpress: () {
                      playwithfr(context);
                    },
                    imgWidget: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(size.width * 0.125)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/play_with_fr.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          child: PlayingBackground(
            child: Container(
              alignment: Alignment.center,
              color: bg_dark,
              child: Column(
                children: [
                  SizedBox(height: size.width * 0.2),
                  RoundedButton(
                      text: "Hủy",
                      onpress: () {
                        stopTimer = true;
                        cancelGame(context);
                        changeWaitingState(false);
                      }),
                  SizedBox(height: size.width * 0.1),
                  Image.asset("assets/images/profile.png"),
                  SizedBox(height: size.width * 0.1),
                  Text("Đợi người chơi khác",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                  SizedBox(height: size.width * 0.1),
                  Text(counting.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                ],
              ),
            ),
          ),
          visible: isWaiting,
        )
      ]),
    );
  }
}
