import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/component/GameService.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/generated/game/game.pb.dart';
import 'package:frontend/generated/room/room.pb.dart';

class PlayingGameScreen extends StatefulWidget {
  final String gameId;
  final String playerId;
  final String opponentsId;
  final int playerColor;
  final Stream<RoomMessage> chatService;
  final Stream<GameCommonReply> gameService;
  PlayingGameScreen(
      {Key? key,
      required this.gameId,
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
  String gameId = "";
  String playerId = "";
  String source = "", target = "";
  int rotateCount = 0;

  var chessDetail = [
    "chariot",
    "horse",
    "elephant",
    "advisor",
    "king",
    "cannon",
    "sodier"
  ];

  // waiting for opponent join this game
  bool waiting = true;

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
    print("index :$index");
    if (pickedIdx == -1 && playerColor * board[index ~/ 9][index % 9] > 0) {
      setState(() {
        pickedIdx = index;
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
      print(index);
      // if player color is red , rotate index of board
      int from = playerColor == -1
          ? (index[0] - 97) + int.parse(reply.msg[1]) * 9
          : 89 - (index[0] - 97) - int.parse(reply.msg[1]) * 9;
      int to = playerColor == -1
          ? index[2] - 97 + int.parse(reply.msg[3]) * 9
          : 89 - index[2] + 97 - int.parse(reply.msg[3]) * 9;
      // update chess board
      print(from);
      print(to);
      int type = board[from ~/ 9][from % 9];
      setState(() {
        board[from ~/ 9][from % 9] = 0;
      });
      chessMoving(from, to, type);
    } else if (reply.msg.contains("boards")) {
    } else {
      print(reply.msg);
    }
  }

  // listen reply from the server
  void listenGameReply() async {
    try {
      await for (GameCommonReply gameReply in widget.gameService) {
        print("=======================");
        print("reply from server : $gameReply");
        onreply(gameReply);
      }
    } catch (e) {
      print(e);
      showalert("Lỗi");
    }
  }

  void chessMoving(int from, int to, int type) {
    print("moving from $from , to $to");
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
          board[to ~/ 9][to % 9] = type;
        }
        poineterLeft += x_step;
        pointerTop += y_step;
        idx += 1;
      });
    });
  }

  // init some field of pointer animation
  // when chess moving, pointer is moved
  double widthScreen = 0;
  double heightScreen = 0;
  String pointerurl = "assets/icons/r_sodier.svg";
  bool pointerVisiable = false;
  double pointerTop = 0;
  double poineterLeft = 0;

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => executeAfterBuildComplete());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    widthScreen = size.width;
    heightScreen = size.height;
    double cell = size.width / 12;
    if (widget.playerColor == 1 && rotateCount == 0) {
      rotateBoard(board);
      print(board);
      rotateCount += 1;
    }
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/board.png"),
                            fit: BoxFit.fitWidth)))),
            Center(
              child: Container(
                width: size.width,
                height: 11.2 * size.width / 9,
                child: GridView.count(
                  crossAxisCount: 9,
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
                              ]),
                        ),
                        // style: Theme.of(context).textTheme.headline5,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: size.height * 0.1,
                  width: size.width,
                  color: light,
                  child: Row(
                    children: [Text("data"), Text("data1")],
                  ),
                )),
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
                      )),
                    )))
          ],
        ),
      ),
    );
  }
}
