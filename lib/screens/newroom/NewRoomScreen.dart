import 'package:flutter/material.dart';
import 'package:frontend/component/RoomService.dart';
import 'package:frontend/component/gameService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/generated/game/game.pb.dart';
import 'package:frontend/generated/room/room.pb.dart';
import 'package:frontend/screens/components/Chat.dart';
import 'package:frontend/screens/components/PlayingBackground.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/components/SingletonChatReceiver.dart';
import 'package:frontend/screens/playinggame/PlayingGameScreen.dart';

class NewRoomScreen extends StatefulWidget {
  final bool ishost;
  final Stream<RoomMessage> roomMesasge;
  final String playerId;
  NewRoomScreen(
      {Key? key,
      this.ishost = true,
      required this.playerId,
      required this.roomMesasge})
      : super(key: key);

  @override
  _NewRoomScreenState createState() => _NewRoomScreenState();
}

class _NewRoomScreenState extends State<NewRoomScreen> {
  RoomService roomService = RoomService();
  GameService gameService = GameService();
  var chats = [];
  // 0 if you, 1 if opponent
  var chatColors = [];
  Color usernameColor = Colors.blue;
  bool have_opponent = false;

  String roomId = "";
  String playerId = "";
  String hostId = "";
  String chattingMessage = "";

  SingletonChatReceiver chatReceiver = SingletonChatReceiver();

  var Ids = ["player 1", "player 2"];

  // control chat field and clean when submit
  var chatController = TextEditingController();

  void getInfoById(String id) {}

  void initialData(var playerList, String _roomId) {
    if (widget.ishost) {
      // if host join this room
      // get info host
      getInfoById(playerList[0]);
      setState(() {
        Ids[0] = playerList[0];
        roomId = _roomId;
      });
    } else {
      // if client join this room
      // get info host and client
      if (playerList.length > 1) {
        String _hostid =
            playerList[0] == widget.playerId ? playerList[1] : playerList[0];
        getInfoById(_hostid);
        getInfoById(widget.playerId);
        setState(() {
          Ids[0] = _hostid;
          Ids[1] = widget.playerId;
          roomId = _roomId;
          have_opponent = true;
        });
      }
    }
  }

  void onreply(RoomMessage roomMessage) {
    print(roomMessage);
    print("---------------------------------");
    if (roomMessage.type.toString() == "Error") {
      // respone error
      showalert(roomMessage.msg);
    } else if (roomMessage.type.toString() == "Room") {
      // something with this room
      var msg = roomMessage.msg.split(":");
      if (msg.length == 1) {
        showalert(msg[0]);
      } else {
        // new player join this room
        var playerList = msg[1].split(",");
        if (roomId == "") {
          // initial data
          initialData(playerList, roomMessage.roomId);
        }
        for (var playerId in playerList) {
          if (playerId != widget.playerId) {
            // get info this player and put into screeen
            newPlayer(playerId);
          } else {}
        }
      }
    } else if (roomMessage.type.toString() == "Game") {
      // something with game
      // get gameId
      var gameId = roomMessage.msg.split(":")[1];
      subcribeGame(gameId);
    } else if (roomMessage.type.toString() == "Chat") {
      // chat message
      var msgs = roomMessage.msg.toString().split(":");
      if (msgs.length >= 2 && msgs[0] != widget.playerId) {
        chatReceiver.data = msgs[1];
        setState(() {
          chats.add(Chat(message: msgs[1], username: msgs[0]));
          chatColors.add(1);
        });
      }
    } else {
      // another message
    }
  }

  // when is clicking the start button
  void startGame() async {
    try {
      var respone = await roomService.roomStartGame(roomId, playerId);
      if (respone.type.toString() == "Error") {
        showalert("Chưa thể bắt đầu game");
      }
    } catch (e) {
      print(e);
      showalert("Lỗi");
    }
  }

  // subcribe game
  // when host click start button, server will respone message to bolth host and client
  // so this funtion will be run
  void subcribeGame(String gameId) {
    String opponentsId = widget.ishost ? Ids[1] : Ids[0];
    int playerColor = widget.ishost ? 1 : -1;
    Stream<GameCommonReply> subscribeGame =
        gameService.subscribeGame(gameId, playerId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayingGameScreen(
          gameId: gameId,
          playerId: playerId,
          opponentsId: opponentsId,
          playerColor: playerColor,
          chatService: widget.roomMesasge,
          gameService: subscribeGame,
          roomId: roomId,
        ),
      ),
    );
  }

  void newPlayer(String playerId) {
    // Toto : get info player and put when complete
    setState(() {
      if (widget.ishost) {
        Ids[1] = playerId.toString();
        have_opponent = true;
      }
    });
  }

  void showalert(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: light,
      content: Text(message, style: TextStyle(color: Colors.red)),
      duration: Duration(seconds: 2),
    ));
  }

  void listenMessage() async {
    try {
      await for (RoomMessage message in widget.roomMesasge) {
        onreply(message);
      }
    } catch (e) {
      print(e);
      showalert("disconnected !");
    }
  }

  void sendChat(String msg) async {
    try {
      print(
          "send chat to server: msg : $msg, playerid: $playerId, roomid: $roomId");
      var responne = await roomService.sendChat(msg, playerId, roomId);
      if (responne.success.toString() != "success") {
        showalert("Không gửi được");
      } else {
        chattingMessage = "";
        chatController.clear();
        setState(() {
          chats.add(Chat(message: msg, username: widget.playerId));
          chatColors.add(0);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void executeAfterBuildComplete() {
    playerId = widget.playerId;
    listenMessage();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => executeAfterBuildComplete());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: PlayingBackground(
          child: Container(
        color: bg_transpearent,
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.05),
              Container(
                  height: size.height * 0.15,
                  padding: EdgeInsets.fromLTRB(
                      size.width * 0.05, 0, 0, size.width * 0.05),
                  child: Column(
                    children: [
                      Text("Room ID:",
                          style: TextStyle(fontSize: 20, color: light)),
                      SelectableText(roomId,
                          style: TextStyle(fontSize: 20, color: light_blue))
                    ],
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: size.height * 0.25,
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.15,
                        width: size.height * 0.15,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.height * 0.7),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/profile.png"))),
                      ),
                      SizedBox(height: size.width * 0.04),
                      Text(Ids[0], style: TextStyle(fontSize: 18, color: light))
                    ],
                  ),
                ),
                SizedBox(width: size.width * 0.1),
                Container(
                    height: size.height * 0.25,
                    child: Visibility(
                        visible: have_opponent,
                        replacement: Column(children: [
                          Image.asset(
                            "assets/images/question.png",
                            height: size.height * 0.15,
                            width: size.height * 0.15,
                          ),
                          SizedBox(height: size.width * 0.04),
                          Text("wating...",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black))
                        ]),
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.15,
                              width: size.height * 0.15,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.7),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/profile.png"))),
                            ),
                            SizedBox(height: size.width * 0.04),
                            Text(Ids[1],
                                style: TextStyle(fontSize: 18, color: light))
                          ],
                        ))),
              ]),
              SizedBox(height: size.height * 0.05),
              Visibility(
                visible: widget.ishost,
                replacement: Container(
                  height: size.height * 0.08,
                ),
                child: Container(
                  height: size.height * 0.08,
                  child: RoundedButton(
                    text: "Bắt đầu",
                    onpress: () {
                      startGame();
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                height: size.height * 0.3,
                padding: EdgeInsets.all(size.width * 0.05),
                decoration: BoxDecoration(
                    color: bg_transpearent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size.width * 0.1),
                        topRight: Radius.circular(size.width * 0.1))),
                child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      // TOTO : custom color username
                      if (chatColors[index] == 1) {
                        usernameColor = Colors.blue;
                      } else {
                        usernameColor = Colors.green;
                      }
                      return RichText(
                          text: TextSpan(
                              text: chats[index].username + " : ",
                              style:
                                  TextStyle(fontSize: 16, color: usernameColor),
                              children: [
                            TextSpan(
                              text: chats[index].message,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ]));
                    }),
              ),
              Container(
                height: size.height * .1,
                padding: EdgeInsets.fromLTRB(
                    size.width * 0.05, 0, size.width * 0.05, 0),
                decoration: BoxDecoration(color: Colors.black),
                child: TextField(
                    onChanged: (text) {
                      chattingMessage = text;
                    },
                    style: TextStyle(color: Colors.white),
                    controller: chatController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white60),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          sendChat(chattingMessage);
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.cyan,
                        ),
                      ),
                      hintText: "Type message here",
                      fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
