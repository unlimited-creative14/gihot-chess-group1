import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/component/GameService.dart';
import 'package:frontend/component/RoomService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/generated/game/game.pb.dart';
import 'package:frontend/generated/room/room.pb.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:keyboard_visibility/keyboard_visibility.dart';

class PlayingGameScreen extends StatefulWidget {
  final String gameId;
  final String playerId;
  final String opponentsId;
  final int playerColor;
  final String roomId;
  final Stream<RoomMessage> chatService;
  final Stream<GameCommonReply> gameService;
  PlayingGameScreen(
      {Key? key,
      required this.gameId,
      required this.roomId,
      required this.playerId,
      required this.opponentsId,
      required this.playerColor,
      required this.chatService,
      required this.gameService})
      : super(key: key);

  @override
  _PlayingGameScreenState createState() => _PlayingGameScreenState();
}

class _PlayingGameScreenState extends State<PlayingGameScreen> {
  String player = "r_";
  int playerColor = -1;
  int pickedIdx = -1;
  GameService gameService = GameService();
  RoomService roomService = RoomService();
  String gameId = "";
  String playerId = "";
  String source = "", target = "";
  int rotateCount = 0;

  // waiting for opponent join this game
  bool waiting = true;

  var chatController = TextEditingController();

  // init some field of pointer animation
  // when chess moving, pointer is moved
  double widthScreen = 0;
  double heightScreen = 0;
  String pointerurl = "assets/icons/r_sodier.svg";
  bool pointerVisiable = false;
  double pointerTop = 0;
  double poineterLeft = 0;

  // init some field for chat text
  double chatHeight = 0;
  int chatFocus = 0;
  String chattingMessage = "";

  bool playerChat = false, opponentsChat = false;
  String playerChatMsg = "", oppnentsChatMsg = "";

  // variables for some music
  AudioCache boomAudio = AudioCache();
  AudioCache clickAudio = AudioCache();

  var listenChat;
  var listenGame;

  var chessDetail = [
    "chariot",
    "horse",
    "elephant",
    "advisor",
    "king",
    "cannon",
    "sodier"
  ];

  var board = [
    [1, 2, 3, 4, 5, 4, 3, 2, 1],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 6, 0, 0, 0, 0, 0, 6, 0],
    [7, 0, 7, 0, 7, 0, 7, 0, 7],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [-7, 0, -7, 0, -7, 0, -7, 0, -7],
    [0, -6, 0, 0, 0, 0, 0, -6, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [-1, -2, -3, -4, -5, -4, -3, -2, -1],
  ];

  void rotateBoard(var board) {
    int tmp = 0;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) {
        tmp = board[i][j];
        board[i][j] = board[9 - i][8 - j];
        board[9 - i][8 - j] = tmp;
      }
    }
  }

  void tap(int index) async {
    if (pickedIdx == -1 && playerColor * board[index ~/ 9][index % 9] > 0) {
      setState(() {
        pickedIdx = index;
        try {
          clickAudio.play("musics/click.wav");
        } catch (e) {
          print(e);
        }
      });
    } else if (pickedIdx != -1 && pickedIdx == index) {
      setState(() {
        pickedIdx = -1;
      });
    } else if (pickedIdx != -1 &&
        playerColor * board[index ~/ 9][index % 9] <= 0) {
      // parser index to string
      if (playerColor == 1) {
        source = String.fromCharCode((89 - pickedIdx) % 9 + 97) +
            ((89 - pickedIdx) ~/ 9).toString();
        target = String.fromCharCode((89 - index) % 9 + 97) +
            ((89 - index) ~/ 9).toString();
      } else {
        source = String.fromCharCode(pickedIdx % 9 + 97) +
            (pickedIdx ~/ 9).toString();
        target = String.fromCharCode(index % 9 + 97) + (index ~/ 9).toString();
      }
      // put into server
      try {
        print(
            "send info, gameid:  $gameId, playerId: $playerId, source: $source, target: $target");
        var respone =
            await gameService.sendMove(gameId, playerId, source, target);

        if (respone.isError) {
          print("err message from server:  ${respone.msg} ");
          showalert(respone.msg);
        } else {
          // valid move
          //update board and animation
          int _picked = pickedIdx;
          int type = board[pickedIdx ~/ 9][pickedIdx % 9];
          setState(() {
            board[pickedIdx ~/ 9][pickedIdx % 9] = 0;
            pickedIdx = -1;
          });
          chessMoving(_picked, index, type);
        }
      } catch (e) {
        print("error: $e");
        showalert("Something went wrong, please check your connection");
      }
    } else if (playerColor * board[index ~/ 9][index % 9] > 0) {
      setState(() {
        pickedIdx = index;
      });
      try {
        clickAudio.play("musics/click.wav");
      } catch (e) {
        print(e);
      }
    }
  }

  void onreply(GameCommonReply reply) {
    // when recieve reply from server
    if (reply.isError) {
      Navigator.pop(context);
      print(reply.msg);
    } else if (reply.msg.toString().length == 4) {
      print(reply.msg);
      // return a moving chess from opponent , example : "a0a1"
      // parser respone
      List<int> index = reply.msg.toString().codeUnits;
      // if player color is red , rotate index of board
      int from = playerColor == -1
          ? (index[0] - 97) + int.parse(reply.msg[1]) * 9
          : 89 - (index[0] - 97) - int.parse(reply.msg[1]) * 9;
      int to = playerColor == -1
          ? index[2] - 97 + int.parse(reply.msg[3]) * 9
          : 89 - index[2] + 97 - int.parse(reply.msg[3]) * 9;
      // update chess board
      int type = board[from ~/ 9][from % 9];
      setState(() {
        board[from ~/ 9][from % 9] = 0;
      });
      chessMoving(from, to, type);
    } else if (reply.msg.contains("broadcast")) {
      var msgs = reply.msg.toString().split(":");
      if (msgs[1] == "startgame") {
        // start game
        Timer.periodic(Duration(seconds: 1), (timer) {
          if (mounted) {
            setState(() {
              waiting = false;
            });
            timer.cancel();
          }
        });
      }
    } else {
      print(reply.msg);
    }
  }

  // listen game service from the server
  void listenGameReply() async {
    try {
      listenGame = widget.gameService.listen((event) {
        onreply(event);
      });
    } catch (e) {
      print(e);
      showalert("Lỗi");
      Timer.periodic(Duration(seconds: 2), (timer) {
        Navigator.pop(context);
        timer.cancel();
      });
    }
  }

  // receive chat from opponents
  void receiveChat(String message) {
    // put message into screen
    setState(() {
      oppnentsChatMsg = message;
      opponentsChat = true;
    });
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (message == oppnentsChatMsg) {
        if (mounted) {
          setState(() {
            opponentsChat = false;
          });
        }
      }
      timer.cancel();
    });
  }

  void sendChat(String msg) async {
    try {
      var respone = await roomService.sendChat(msg, playerId, widget.roomId);
      if (respone.success.toString() != "success") {
        showalert("Không gửi được");
      } else {
        // send successfull
        // clear chat message
        chatController.clear();
        // show into screen with respone message
        setState(() {
          playerChatMsg = msg;
          playerChat = true;
        });
        Timer.periodic(Duration(seconds: 5), (timer) {
          if (msg == playerChatMsg) {
            if (mounted) {
              setState(() {
                playerChat = false;
              });
            }
          }
          timer.cancel();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void chessMoving(int from, int to, int type) {
    Size source = cellToPositon(from);
    Size target = cellToPositon(to);
    String pre = type < 0 ? "b_" : "r_";
    pointerurl = "assets/icons/" + pre + chessDetail[type.abs() - 1] + ".svg";
    pointerVisiable = true;
    double x_step = (target.width - source.width) / 5;
    double y_step = (target.height - source.height) / 5;
    int idx = 0;
    poineterLeft = source.width;
    pointerTop = source.height;
    Timer.periodic(Duration(milliseconds: 20), (timer) {
      setState(() {
        if (idx == 5) {
          timer.cancel();
          pointerVisiable = false;
          if (board[to ~/ 9][to % 9] != 0) {
            // boom sound
            try {
              clickAudio.play("musics/boom.wav");
            } catch (e) {
              print(e);
            }
          }
          board[to ~/ 9][to % 9] = type;
        }
        poineterLeft += x_step;
        pointerTop += y_step;
        idx += 1;
      });
    });
  }

  Size cellToPositon(int cell) {
    double x = 0, y = 0;
    x = (cell % 9) * widthScreen / 9;
    y = (cell ~/ 9) * widthScreen / 9 +
        (heightScreen - 10 * widthScreen / 9) / 2;
    return Size(x, y);
  }

  // Alert to the client with a message
  void showalert(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: light,
      content: Text(message, style: TextStyle(color: Colors.red)),
      duration: Duration(seconds: 2),
    ));
  }

  // when frontend render complete , subcribe to the server
  // if something wrong when subcribe, pop context and respone error
  void executeAfterBuildComplete() {
    gameId = widget.gameId;
    playerColor = widget.playerColor;
    playerId = widget.playerId;
    listenGameReply();
  }

  void showHideKeyboard(bool visible) {
    if (visible) {
      setState(() {
        chatFocus = 1;
      });
    } else {
      setState(() {
        chatFocus = 0;
      });
    }
  }

  void listenChatMessage() {
    try {
      listenChat = widget.chatService.listen((event) {
        var msgs = event.msg.toString().split(":");
        if (msgs[0] != playerId) receiveChat(msgs[1]);
      });
    } catch (e) {
      print("Error listen chat: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    // listening the keyboard
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        showHideKeyboard(visible);
      },
    );
    //listen onchange data from chat service
    listenChatMessage();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => executeAfterBuildComplete());
  }

  @override
  void dispose() {
    // stop listen
    listenChat.cancel();
    listenGame.cancel();
    // unsubscribe game
    gameService.leaveGame(gameId, playerId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    widthScreen = size.width;
    heightScreen = size.height;
    chatHeight = (heightScreen - 12 * widthScreen / 9) / 2;
    double cell = size.width / 10;
    if (widget.playerColor == 1 && rotateCount == 0) {
      rotateBoard(board);
      rotateCount += 1;
    }
    print(waiting);
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: Colors.blue,
              ),
              Container(
                height: size.height,
                width: size.width,
                color: Colors.black54,
              ),
              Center(
                child: Container(
                  height: 10 * size.width / 9,
                  width: size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/board.png"),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: size.width,
                  height: 10 * size.width / 9,
                  child: GridView.count(
                    crossAxisCount: 9,
                    padding: EdgeInsets.all(0),
                    children: List.generate(90, (index) {
                      if (board[index ~/ 9][index % 9] == 0) {
                        return Center(
                          child: Container(
                            width: cell,
                            height: cell,
                            child: GestureDetector(
                              onTap: () {
                                tap(index);
                              }, // style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        );
                      }
                      String prefix = "r_";
                      Color picked_color = picked_green;
                      if (board[index ~/ 9][index % 9] < 0) {
                        prefix = "b_";
                        picked_color = picked_red;
                      }
                      bool ispicked = false;
                      if (pickedIdx == index) ispicked = true;
                      return Center(
                        child: Container(
                          width: cell,
                          height: cell,
                          child: GestureDetector(
                            onTap: () {
                              tap(index);
                            },
                            // child: SvgPicture.asset("assets/icons/r_advisor.svg"),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Visibility(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: picked_color,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(cell / 2))),
                                  ),
                                  visible: ispicked,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/" +
                                      prefix +
                                      chessDetail[
                                          board[index ~/ 9][index % 9].abs() -
                                              1] +
                                      ".svg",
                                  width: cell * 0.9,
                                  height: cell * 0.9,
                                ),
                              ],
                            ),
                          ),
                          // style: Theme.of(context).textTheme.headline5,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Visibility(
                visible: pointerVisiable,
                child: Positioned(
                  top: pointerTop,
                  left: poineterLeft,
                  child: Container(
                    width: size.width / 9,
                    height: size.width / 9,
                    child: Center(
                      child: SvgPicture.asset(
                        pointerurl,
                        width: 0.9 * size.width / 12,
                        height: 0.9 * size.width / 12,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0, size.height - chatHeight - chatFocus * 280, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: chatHeight,
                padding: EdgeInsets.all(20),
                child: TextField(
                  onChanged: (text) {
                    if (text.length > 35) {
                      chatController.text = chattingMessage;
                    } else
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
                  ),
                ),
              ),
              Container(
                height: (size.height - 10 * size.width / 9) / 2,
                width: size.width,
                color: Colors.black12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 25),
                    Visibility(
                      visible: playerChat,
                      child: Container(
                        width: size.width * 0.9,
                        margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.1, 0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: light,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: RichText(
                          text: TextSpan(
                              text: playerId + " : ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: playerChatMsg,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal))
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Visibility(
                      visible: opponentsChat,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(size.width * 0.1, 0, 0, 0),
                        width: size.width * 0.9,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: widget.opponentsId + " : ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: oppnentsChatMsg,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: waiting,
                child: Container(
                  height: size.height,
                  width: size.width,
                  color: bg_dark,
                  child: Center(
                    child: Text(
                      "Vui lòng đợi đối thủ",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
