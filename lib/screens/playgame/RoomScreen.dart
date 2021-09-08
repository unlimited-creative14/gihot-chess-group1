import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/component/RoomService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/generated/room/room.pb.dart';
import 'package:frontend/screens/components/CustomBackButton.dart';
import 'package:frontend/screens/components/GameButton.dart';
import 'package:frontend/screens/components/PlayingBackground.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/newroom/NewRoomScreen.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  String playerId = "1";
  bool isWaiting = false;
  int counting = 0;
  bool stopTimer = false;
  RoomService roomService = RoomService();
  var findroomListener;

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

  void commonGame(context) async {
    var respone = await roomService.createRoom(playerId);
    if (respone.success != "created") {
      alertMsg("Không tìm thấy máy chủ");
    } else {
      print("roomId : ${respone.roomId}");
      // join room
      Stream<RoomMessage> joinroom =
          roomService.joinRoom(respone.roomId, playerId).asBroadcastStream();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewRoomScreen(
            roomMesasge: joinroom,
            playerId: playerId,
          ),
        ),
      );
    }
  }

  void playwithfr(context) {
    typeGameInfo();
  }

  // when client click findgame button
  void findroom(String roomId) {
    Stream<RoomMessage> joinroom = roomService.joinRoom(roomId, playerId)
      ..asBroadcastStream();
    findroomListener = joinroom.listen((event) {
      if (event.type.toString() == "Error") {
        alertMsg("Không tìm thấy phòng này");
      } else {
        findroomListener.cancel();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewRoomScreen(
              playerId: playerId,
              roomMesasge: joinroom,
              ishost: false,
            ),
          ),
        );
      }
    });
  }

  void alertMsg(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: light,
      content: Text(message, style: TextStyle(color: Colors.red)),
      duration: Duration(seconds: 2),
    ));
  }

  Future<void> typeGameInfo() async {
    String roomId = "";

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Nhập mã phòng"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  onChanged: (text) {
                    roomId = text;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.class_),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  findroom(roomId);
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
