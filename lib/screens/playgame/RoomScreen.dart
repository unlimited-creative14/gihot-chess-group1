import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/component/LobbyService.dart';
import 'package:frontend/component/RoomService.dart';
import 'package:frontend/component/UserInfo.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/generated/lobby/lobby.pb.dart';
import 'package:frontend/generated/room/room.pb.dart';
import 'package:frontend/screens/components/Chat.dart';
import 'package:frontend/screens/components/CustomBackButton.dart';
import 'package:frontend/screens/components/GameButton.dart';
import 'package:frontend/screens/components/LobbyChat.dart';
import 'package:frontend/screens/components/PlayingBackground.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/newroom/NewRoomScreen.dart';

class RoomScreen extends StatefulWidget {
  final String id;
  final Stream<LobbyCommonReply> lobbyStream;
  const RoomScreen({Key? key, required this.id, required this.lobbyStream})
      : super(key: key);
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  bool isWaiting = false;
  int counting = 0;
  bool stopTimer = false;
  RoomService roomService = RoomService();
  var roomListener;
  int betAmountIndex = 0;
  var betValues = [0, 1, 2, 5, 10];

  // lobby service
  LobbyService lobbyService = LobbyService();

  UserService userService = UserService();

  // some initial for chat with friend
  bool friendVisiable = false;
  var imageUrl = [
    "https://gamebaiapk.com/wp-content/uploads/2020/06/chinese-chess-xiangqi-110120.png",
  ];
  var friendList = ["a"];
  var friendStatus = [false];
  int friendSelectedIdx = 0;
  String chattingMessageLobby = "";
  var chatLobbyController = TextEditingController();
  var listChatMessageInLobby = [LobbyChat()];
  bool haveFriend = false;
  String newFriendId = "";

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

  void commonGame(int betAmount) async {
    var respone = await roomService.createRoom(widget.id, betAmount);
    if (respone.success != "created") {
      alertMsg("Không tìm thấy máy chủ");
    } else {
      print("roomId : ${respone.roomId}");
      // join room
      Stream<RoomMessage> joinroom =
          roomService.joinRoom(respone.roomId, widget.id).asBroadcastStream();
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
                  playerId: widget.id,
                  roomId: event.roomId,
                  betAmount: betAmount),
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
        roomService.joinRoom(roomId, widget.id).asBroadcastStream();
    roomListener = joinroom.listen((event) async {
      if (event.type.toString() == "Error") {
        alertMsg("Không tìm thấy phòng này");
      } else {
        try {
          var roomInfo = await roomService.getInfoRoom(roomId);
          var msgs = event.msg.split(":");
          if (msgs.length > 1) {
            var playerList = msgs[1].split(",");
            if (playerList.length > 1) {
              roomListener.cancel();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewRoomScreen(
                    playerId: widget.id,
                    roomMesasge: joinroom,
                    ishost: false,
                    hostId: playerList[0],
                    roomId: event.roomId,
                    betAmount: roomInfo.betAmount,
                  ),
                ),
              );
            }
          }
        } catch (e) {
          alertMsg("Lỗi");
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
        .addnewchat(Chat(message: chattingMessage, username: widget.id));
    // clear chat box
    chatLobbyController.clear();
  }

  void getInforAndPutInto(String id, int index, bool setStateAfter) async {
    try {
      var respone = await userService.getUserInfo(id);
      // imageUrl[index] = respone.imageurl
      if (setStateAfter) {
        if (mounted) setState(() {});
      }
    } catch (e) {
      print("Error get information: $e");
    }
  }

  void addnewFriend(String newFriendId) async {
    // add new friend
    try {
      var respone =
          await lobbyService.sendFriendRequest(widget.id, newFriendId);
      if (respone.type.toString() == "Error") {
        alertMsg("Nhập tên sai hoặc bạn của bạn đã offline");
        print(respone);
      } else {
        alertMsg("Gửi lời mời thành công");
      }
    } catch (e) {
      alertMsg("Lỗi thêm bạn");
      print("Error on add new frient: $e");
    }
  }

  void onLobbyReply(LobbyCommonReply reply) {
    if (reply.type.toString() == "System") {
      // new frient request
      var msgs = reply.message.toString().split(":");
      if (msgs.length > 1) {
        showFriendRequest(msgs[1]);
      }
    }
  }

  void listenLobby() {
    widget.lobbyStream.listen((event) {
      //listen from lobby
      onLobbyReply(event);
    });
  }

  void getFriendList(String id) async {
    try {
      var respone = await lobbyService.getFriendList(id);
      int index = 0;
      if (respone.friendList.length != 0) haveFriend = true;
      for (var friend in respone.friendList) {
        // foreach friend , get information
        bool setStateAffter =
            index == respone.friendList.length - 1 ? true : false;
        if (index == 0) {
          int _index = index;
          getInforAndPutInto(friend.playerId, _index, setStateAffter);
          index += 1;
          continue;
        }
        imageUrl.add(
            "https://gamebaiapk.com/wp-content/uploads/2020/06/chinese-chess-xiangqi-110120.png");
        friendStatus.add(friend.online);
        friendList.add(friend.playerId);
        int _index = index;
        getInforAndPutInto(friend.playerId, _index, setStateAffter);
        index += 1;
      }
    } catch (e) {
      print("Error get frient list : $e");
    }
  }

  void excuteAfterBuildingComplete() {
    getFriendList(widget.id);
    listenLobby();
  }

  void acceptFriendRequest(String id) async {
    try {
      var respone = await lobbyService.acceptFriendRequest(widget.id, id);
      if (respone.type.toString() == "Error") {
        print(respone);
        alertMsg("Lời mời đã hết hạn");
      } else {
        alertMsg("Chấp nhận kết bạn thành công");
        haveFriend = true;
        insertNewFriend(id);
      }
    } catch (e) {
      print("Error accept friend request : $e");
    }
  }

  void declineFriendRequest(String id) async {
    try {
      var respone = await lobbyService.acceptFriendRequest(widget.id, id);
      if (respone.type.toString() == "Error") {
        alertMsg("Lời mời đã hết hạn");
      } else {
        alertMsg("Từ chối kết bạn thành công");
      }
    } catch (e) {
      print("Error decline friend request : $e");
    }
  }

  void insertNewFriend(String id) {
    // when new friend add to list
    if (haveFriend) {
      imageUrl.add(
          "https://gamebaiapk.com/wp-content/uploads/2020/06/chinese-chess-xiangqi-110120.png");
      friendStatus.add(true);
      friendList.add(id);
      int _index = friendList.length - 1;
      getInforAndPutInto(id, _index, true);
    } else {
      getInforAndPutInto(id, 0, true);
    }
  }

  // bet amount
  Future<void> betAmountShowing() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text("Đặt cược"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    betValues[betAmountIndex].toString(),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Slider(
                    value: betAmountIndex.toDouble(),
                    onChanged: (value) {
                      if (mounted) {
                        setState(() {
                          betAmountIndex = value.toInt();
                        });
                      }
                    },
                    min: 0,
                    max: 4,
                    divisions: 4,
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  commonGame(betValues[betAmountIndex]);
                },
                child: Text("Đồng ý"),
              )
            ],
          );
        });
      },
    );
  }

  Future<void> openBoxAddFriend() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text("Thêm bạn"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      newFriendId = value;
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: "Nhập tên người bạn"),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  addnewFriend(newFriendId);
                },
                child: Text("Gửi"),
              )
            ],
          );
        });
      },
    );
  }

  Future<void> showFriendRequest(String id) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text("Kết bạn"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    "Bạn nhận được lời mời kết bạn từ : $id",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  acceptFriendRequest(id);
                },
                child: Text("Chấp nhận"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    declineFriendRequest(id);
                  },
                  child: Text("Từ chối"))
            ],
          );
        });
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => excuteAfterBuildingComplete());
    super.initState();
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
                            betAmountShowing();
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
                                                                    widget.id
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
                                                      widget.id,
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
                                                    image: NetworkImage(
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
                          if (haveFriend) {
                            if (mounted) {
                              setState(() {
                                friendVisiable = !friendVisiable;
                              });
                            }
                          } else {
                            openBoxAddFriend();
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
