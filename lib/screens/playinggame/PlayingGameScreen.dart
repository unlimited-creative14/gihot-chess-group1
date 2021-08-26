import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/constant/color.dart';

class PlayingGameScreen extends StatefulWidget {
  PlayingGameScreen({Key? key}) : super(key: key);

  @override
  _PlayingGameScreenState createState() => _PlayingGameScreenState();
}

class _PlayingGameScreenState extends State<PlayingGameScreen> {
  String player = "r_";
  var chessDetail = [
    "chariot",
    "horse",
    "advisor",
    "elephant",
    "king",
    "cannon",
    "sodier"
  ];

  var board = [
    [-1, -2, -3, -4, -5, -4, -3, -2, -1],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, -6, 0, 0, 0, 0, 0, -6, 0],
    [-7, 0, -7, 0, -7, 0, -7, 0, -7],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [7, 0, 7, 0, 7, 0, 7, 0, 7],
    [0, 6, 0, 0, 0, 0, 0, 6, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 2, 3, 4, 5, 4, 3, 2, 1],
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

  int player_color = 1;

  void tap(int index) {
    // if ((board[index ~/ 9][index % 9] <= 0 && player_color == -1) ||
    //     (board[index ~/ 9][index % 9] >= 0 && player_color == 1)) {
    setState(() {
      if (pickedIdx == -1)
        pickedIdx = index;
      else
        pickedIdx = -1;
    });
    // }
  }

  int pickedIdx = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cell = size.width / 12;
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/board.png"))))),
            Positioned(
              top: (size.height - 11.2 * size.width / 9) / 2,
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
                ))
          ],
        ),
      ),
    );
  }
}
