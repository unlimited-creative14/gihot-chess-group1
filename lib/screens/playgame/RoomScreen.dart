import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/component/RoomService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/generated/room/room.pb.dart';
import 'package:frontend/screens/components/Chat.dart';
import 'package:frontend/screens/components/CustomBackButton.dart';
import 'package:frontend/screens/components/GameButton.dart';
import 'package:frontend/screens/components/LobbyChat.dart';
import 'package:frontend/screens/components/PlayingBackground.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/newroom/NewRoomScreen.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  String playerId = "dev1";
  bool isWaiting = false;
  int counting = 0;
  bool stopTimer = false;
  RoomService roomService = RoomService();
  var roomListener;

  // some initial for chat with friend
  bool friendVisiable = true;
  var imageUrl = [
    "assets/images/profile.png",
    "assets/images/profile.png",
    "assets/images/profile.png"
  ];
  var friendList = ["username1", "name2", "username3"];
  var friendStatus = [true, true, false];
  int friendSelectedIdx = 1;
  String chattingMessageLobby = "";
  var chatLobbyController = TextEditingController();
  var listChatMessageInLobby = [LobbyChat(), LobbyChat(), LobbyChat()];

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
      // listen respone and get roomId
      roomListener = joinroom.listen((event) {
        if (event.type.toString() == "Error") {
          alertMsg("Lỗi");
        } else {
          // navigate to room screen
          roomListener.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewRoomScreen(
                roomMesasge: joinroom,
                playerId: playerId,
                roomId: event.roomId,
              ),
            ),
          );
        }
      });
    }
  }

  void playwithfr(context) {
    typeGameInfo();
  }

  // when client click findgame button
  void findroom(String roomId) {
    Stream<RoomMessage> joinroom =
        roomService.joinRoom(roomId, playerId).asBroadcastStream();
    roomListener = joinroom.listen((event) {
      if (event.type.toString() == "Error") {
        alertMsg("Không tìm thấy phòng này");
      } else {
        var msgs = event.msg.split(":");
        if (msgs.length > 1) {
          var playerList = msgs[1].split(",");
          if (playerList.length > 1) {
            roomListener.cancel();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewRoomScreen(
                  playerId: playerId,
                  roomMesasge: joinroom,
                  ishost: false,
                  hostId: playerList[0],
                  roomId: event.roomId,
                ),
              ),
            );
          }
        }
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

  void sendChatInLobby(
      String playerId, String username, String chattingMessage) {
    // send chat to server

    // add new chat to screen
    listChatMessageInLobby[friendSelectedIdx]
        .addnewchat(Chat(message: chattingMessage, username: playerId));
    // clear chat box
    chatLobbyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        PlayingBackground(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              height: size.height,
              color: bg_transpearent,
              child: Stack(
                children: [
                  SingleChildScrollView(
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
                                  image:
                                      AssetImage("assets/images/hot_game.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        GameButton(
                          text: "Tạo bàn mới",
                          onpress: () {
                            commonGame(context);
                          },
                          imgWidget:
                              SvgPicture.asset("assets/icons/newgame.svg"),
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
                                  image: AssetImage(
                                      "assets/images/play_with_fr.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        size.width * 0.2, size.height * 0.1, 0, 0),
                    child: Visibility(
                      visible: friendVisiable,
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.4,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: bg_dark,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Visibility(
                                  visible: true,
                                  child: Container(
                                    height: size.height * 0.4,
                                    width: size.width * 0.6,
                                    decoration: BoxDecoration(
                                      color: bg_chat,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: size.height * 0.3,
                                          child: ListView.builder(
                                              itemCount: listChatMessageInLobby[
                                                      friendSelectedIdx]
                                                  .getLength(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      size.width * 0.05,
                                                      0,
                                                      size.width * 0.05,
                                                      0),
                                                  child: RichText(
                                                    text: TextSpan(
                                                        text: listChatMessageInLobby[
                                                                    friendSelectedIdx]
                                                                .listChatMsg[
                                                                    index]
                                                                .username +
                                                            " : ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: listChatMessageInLobby[
                                                                            friendSelectedIdx]
                                                                        .listChatMsg[
                                                                            index]
                                                                        .username ==
                                                                    playerId
                                                                ? Colors.green
                                                                : Colors.blue),
                                                        children: [
                                                          TextSpan(
                                                            text: listChatMessageInLobby[
                                                                    friendSelectedIdx]
                                                                .listChatMsg[
                                                                    index]
                                                                .message,
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        ]),
                                                  ),
                                                );
                                              }),
                                        ),
                                        Container(
                                          height: size.height * 0.1,
                                          child: TextField(
                                            onChanged: (text) {
                                              chattingMessageLobby = text;
                                            },
                                            style:
                                                TextStyle(color: Colors.black),
                                            controller: chatLobbyController,
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                  color: Colors.black45),
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  sendChatInLobby(
                                                      playerId,
                                                      friendList[
                                                          friendSelectedIdx],
                                                      chattingMessageLobby);
                                                },
                                                child: Icon(
                                                  Icons.send,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              hintText: "Type message here",
                                              fillColor: Colors.black,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.4,
                                  width: size.width * 0.2,
                                  child: ListView.builder(
                                    itemCount: friendList.length,
                                    padding: EdgeInsets.all(0),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: index == friendSelectedIdx
                                              ? bg_chat
                                              : null,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              friendSelectedIdx = index;
                                            });
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Container(
                                                height: size.width * 0.15,
                                                width: size.width * 0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          size.width * 0.075)),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        imageUrl[index]),
                                                  ),
                                                ),
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      size.width * 0.11,
                                                      0,
                                                      0,
                                                      size.width * 0.11),
                                                  height: size.width * 0.04,
                                                  width: size.width * 0.04,
                                                  decoration: BoxDecoration(
                                                    color: friendStatus[index]
                                                        ? Colors.green
                                                        : Colors.white,
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            size.width * 0.02)),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                friendList[index],
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: friendSelectedIdx ==
                                                            index
                                                        ? Colors.black
                                                        : dark_blue),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (mounted) {
                                setState(() {
                                  friendVisiable = !friendVisiable;
                                });
                              }
                            },
                            child: Container(
                              height: size.width * 0.1,
                              child: Container(
                                height: size.width * 0.1,
                                width: size.width * 0.1,
                                margin: EdgeInsets.fromLTRB(
                                    size.width * 0.7, 0, 0, 0),
                                child: Icon(
                                  Icons.arrow_right,
                                  color: light_blue,
                                  size: size.width * 0.1,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !friendVisiable,
                    child: Container(
                      height: size.width * 0.1,
                      width: size.width * 0.1,
                      margin: EdgeInsets.fromLTRB(
                          size.width * 0.9, size.height * 0.5, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          if (mounted) {
                            setState(() {
                              friendVisiable = !friendVisiable;
                            });
                          }
                        },
                        child: Icon(
                          Icons.people,
                          color: light_blue,
                          size: size.width * 0.1,
                        ),
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
                  Text(
                    "Đợi người chơi khác",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: size.width * 0.1),
                  Text(
                    counting.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
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
