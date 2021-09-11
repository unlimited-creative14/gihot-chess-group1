import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/component/RoomService.dart';
import 'package:frontend/component/UserInfo.dart';
import 'package:frontend/component/gameService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/generated/game/game.pb.dart';
import 'package:frontend/generated/room/room.pb.dart';
import 'package:frontend/screens/components/Chat.dart';
import 'package:frontend/screens/components/PlayingBackground.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/playinggame/PlayingGameScreen.dart';

class NewRoomScreen extends StatefulWidget {
  final bool ishost;
  final Stream<RoomMessage> roomMesasge;
  final String playerId;
  final String hostId;
  final String roomId;
  final int betAmount;
  NewRoomScreen(
      {Key? key,
      this.ishost = true,
      this.roomId = "",
      this.hostId = "",
      required this.playerId,
      required this.roomMesasge,
      required this.betAmount})
      : super(key: key);

  @override
  _NewRoomScreenState createState() => _NewRoomScreenState();
}

class _NewRoomScreenState extends State<NewRoomScreen> {
  RoomService roomService = RoomService();
  GameService gameService = GameService();
  UserService userService = UserService();
  var chats = [];
  // 0 if you, 1 if opponent
  var chatColors = [];
  Color usernameColor = Colors.blue;
  bool have_opponent = false;

  String roomId = "";
  String playerId = "";
  String hostId = "";
  String chattingMessage = "";

  // id and image of player
  // index 0 : host, index 1 : player
  var Ids = ["player 1", "player 2"];
  var Images = [
    "https://gamebaiapk.com/wp-content/uploads/2020/06/chinese-chess-xiangqi-110120.png",
    "https://gamebaiapk.com/wp-content/uploads/2020/06/chinese-chess-xiangqi-110120.png"
  ];
  var CurrencyList = [0, 0];

  // control chat field and clean when submit
  var chatController = TextEditingController();

  var listenRoomMessage;

  bool ishost = false;

  String opponentsId = "";

  void onreply(RoomMessage roomMessage) {
    print("Reply from server: ");
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
      } else if (msg[0] == "leaveroom") {
        // when another player leave this roon
        anotherPlayerLeaveRoom(msg[1]);
      } else {
        // new player join this room
        var playerList = msg[1].split(",");
        for (var playerId in playerList) {
          if (playerId != widget.playerId) {
            // new player join this room
            newPlayer(playerId);
          }
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
    String _opponentsId = ishost ? opponentsId : widget.hostId;
    int playerColor = ishost ? 1 : -1;
    Stream<GameCommonReply> subscribeGame =
        gameService.subscribeGame(gameId, playerId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayingGameScreen(
          gameId: gameId,
          playerId: playerId,
          opponentsId: _opponentsId,
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
    getInforAndPutTo(1, playerId);
    have_opponent = true;
    opponentsId = playerId;
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
      listenRoomMessage = widget.roomMesasge.listen((event) {
        onreply(event);
      });
    } catch (e) {
      print(e);
      Navigator.pop(context);
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

  // some field will be excute when screen loading successfull
  void executeAfterBuildComplete() {
    playerId = widget.playerId;
    if (mounted) {
      setState(() {
        ishost = widget.ishost;
      });
    }
    if (ishost) {
      // get information of the player
      roomId = widget.roomId;
      getInforAndPutTo(0, playerId);
    } else {
      // get information of the player and the opponents
      roomId = widget.roomId;
      hostId = widget.hostId;
      have_opponent = true;
      getInforAndPutTo(0, widget.hostId);
      getInforAndPutTo(1, playerId);
    }
    // listen some room messages
    listenMessage();
  }

  void anotherPlayerLeaveRoom(String id) {
    if (ishost) {
      if (mounted) {
        setState(() {
          have_opponent = false;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          ishost = true;
          have_opponent = false;
          Ids[0] = Ids[1];
          CurrencyList[0] = CurrencyList[1];
        });
      }
    }
  }

  // leave the room
  void leaveRoomRequest() async {
    try {
      var respone = await roomService.leaveRoom(playerId, roomId);
      if (respone.success.toString() != "success") {
        // leave this room
        showalert("Lỗi");
      }
    } catch (e) {
      showalert("Lỗi");
    }
  }

  void getInforAndPutTo(int index, String id) async {
    if (index < 2) {
      try {
        var respone = await userService.getUserInfo(id);
        Images[index] = respone.photoUrl;
        CurrencyList[index] = respone.gameCurrency;
        Ids[index] = respone.displayName;
        if (mounted) {
          setState(() {});
        }
      } catch (e) {
        showalert("Lỗi");
        print("Error getting information: $e");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => executeAfterBuildComplete());
  }

  @override
  void dispose() {
    // unsubscribe stream
    listenRoomMessage.cancel();
    leaveRoomRequest();
    super.dispose();
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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Mã phòng :    ",
                              style: TextStyle(fontSize: 20, color: light),
                            ),
                            SelectableText(
                              roomId,
                              style: TextStyle(fontSize: 20, color: light_blue),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Tiền cược :    ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: dark_blue,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic)),
                            SelectableText(
                              widget.betAmount.toString(),
                              style: TextStyle(fontSize: 20, color: dark_blue),
                            )
                          ],
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.25,
                      child: Column(
                        children: [
                          Container(
                            width: size.height * 0.15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/coin.svg",
                                  height: size.height * 0.03,
                                  width: size.height * 0.03,
                                ),
                                Text(
                                  " : " + CurrencyList[0].toString(),
                                  style: TextStyle(fontSize: 18, color: light),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.15,
                            width: size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(size.height * 0.7),
                              image: DecorationImage(
                                image: NetworkImage(Images[0]),
                              ),
                            ),
                            // child: Image.network(Images[0]),
                          ),
                          SizedBox(height: size.width * 0.02),
                          Text(Ids[0],
                              style: TextStyle(fontSize: 18, color: light))
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.1),
                    Container(
                      height: size.height * 0.25,
                      child: Visibility(
                        visible: have_opponent,
                        replacement: Column(
                          children: [
                            Container(
                              width: size.height * 0.15,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/coin.svg",
                                    height: size.height * 0.03,
                                    width: size.height * 0.03,
                                  ),
                                  Text(
                                    " :  ?",
                                    style:
                                        TextStyle(fontSize: 18, color: light),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              "assets/images/question.png",
                              height: size.height * 0.15,
                              width: size.height * 0.15,
                            ),
                            SizedBox(height: size.width * 0.02),
                            Text(
                              "đang đợi...",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: size.height * 0.15,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/coin.svg",
                                    height: size.height * 0.03,
                                    width: size.height * 0.03,
                                  ),
                                  Text(
                                    " : " + CurrencyList[1].toString(),
                                    style:
                                        TextStyle(fontSize: 18, color: light),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.15,
                              width: size.height * 0.15,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.7),
                                image: DecorationImage(
                                  image: NetworkImage(Images[1]),
                                ),
                              ),
                            ),
                            SizedBox(height: size.width * 0.02),
                            Text(
                              Ids[1],
                              style: TextStyle(fontSize: 18, color: light),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                Visibility(
                  visible: ishost,
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
                      topRight: Radius.circular(size.width * 0.1),
                    ),
                  ),
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
                                style: TextStyle(
                                    fontSize: 16, color: usernameColor),
                                children: [
                              TextSpan(
                                text: chats[index].message,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
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
        ),
      )),
    );
  }
}
