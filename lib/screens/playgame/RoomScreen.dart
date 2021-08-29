import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/component/GameService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/generated/game/game.pb.dart';
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
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => PlayingGameScreen()));
  }

  void playwithfr(context) {
    typeGameInfo();
  }

  Future<void> typeGameInfo() async {
    String playerId = "";
    String gameId = "";
    int playerColor = 1;
    String error = "";

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter your id and game id"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  onChanged: (text) {
                    playerId = text;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_fields), hintText: "PlayerId"),
                ),
                TextField(
                  onChanged: (text) {
                    gameId = text;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_fields), hintText: "GameId"),
                ),
                TextField(
                  onChanged: (text) {
                    playerColor = int.parse(text);
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_fields),
                      hintText: "Player Color : 1 is red, -1 is blue"),
                ),
                Text(
                  error,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  try {
                    print(gameId);
                    print(playerId);
                    Stream<GameCommonReply> reply =
                        GameService().subscribeGame(gameId, playerId);
                    await for (var respone in reply) {
                      if (respone.isError) {
                        print(respone.msg);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(respone.msg)));
                      } else {
                        Navigator.pop(context);
                        // Navigate to playing screen and pass Stream respone
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayingGameScreen(
                                    gameId: gameId,
                                    playerColor: playerColor,
                                    playerId: playerId)));
                      }
                    }
                  } catch (e) {
                    error = e.toString();
                    print(e);
                  }
                },
                child: Text("submit"))
          ],
        );
      },
    );
  }

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
