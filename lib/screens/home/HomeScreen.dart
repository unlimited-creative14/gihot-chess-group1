import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/component/BackgroundMusic.dart';
import 'package:frontend/component/LobbyService.dart';
import 'package:frontend/component/UserInfo.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/components/WelcomeBackground.dart';
import 'package:frontend/screens/playgame/RoomScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final String id;
  const HomeScreen({Key? key, required this.id}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double volume = 1;
  bool setting = false;
  BackgroundMusic backgroundMusic = BackgroundMusic();
  late final SharedPreferences pref;

  // lobby service
  // when someone logined in the game, join this lobby
  LobbyService lobbyService = LobbyService();
  var joinLobby;
  var listenLobby;
  // user service
  UserService userService = UserService();
  String imageUrl =
      "https://gamebaiapk.com/wp-content/uploads/2020/06/chinese-chess-xiangqi-110120.png";
  int currency = 0;

  void start(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomScreen(
          id: widget.id,
          lobbyStream: joinLobby,
        ),
      ),
    );
  }

  void botplay(context) {
    //
  }

  void openProfile(context) {
    //
  }

  void introduction(context) {
    //
  }

  void openSetting() {
    setState(() {
      setting = !setting;
    });
  }

  void changeVolume(double value) {
    setState(() {
      volume = value;
    });
    backgroundMusic.changeVolume(value);
    pref.setDouble("volume", value);
  }

  void getInfor() async {
    try {
      var respone = await userService.getUserInfo(widget.id);
      if (mounted) {
        setState(() {
          currency = respone.gameCurrency;
          // imageUrl = respone.image;
        });
      }
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  void joinLobbyFunc() {
    try {
      joinLobby = lobbyService.joinLobby(widget.id).asBroadcastStream();
      listenLobby = joinLobby.listen((event) {
        // on lobby reply
      });
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  void executeAfterBuildComplete() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      volume = pref.getDouble("volume") ?? 1;
    });
    getInfor();
    joinLobbyFunc();
  }

  @override
  void initState() {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => executeAfterBuildComplete());
    super.initState();
  }

  @override
  void dispose() {
    listenLobby.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WelcomeBackground(
        child: SingleChildScrollView(
            child: Container(
          alignment: Alignment.center,
          height: size.height,
          color: bg_transpearent,
          child: Column(
            children: [
              Container(
                height: size.height * 0.2,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(
                    "assets/icons/coin.svg",
                    height: size.height * 0.05,
                    width: size.height * 0.05,
                  ),
                  Text(
                    " : " + currency.toString(),
                    style: TextStyle(fontSize: 20, color: light),
                  ),
                  SizedBox(width: size.width * 0.3),
                  Container(
                    margin: EdgeInsets.all(size.height * 0.03),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.height * 0.05)),
                      child: Image.network(
                        "https://gamebaiapk.com/wp-content/uploads/2020/06/chinese-chess-xiangqi-110120.png",
                        height: size.height * 0.1,
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.8,
                child: RoundedButton(
                    text: "Bắt đầu",
                    onpress: () {
                      start(context);
                    }),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.8,
                child: RoundedButton(
                    text: "Chơi với máy",
                    onpress: () {
                      botplay(context);
                    }),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                  width: size.width * 0.8,
                  child: RoundedButton(
                      text: "Hướng dẫn",
                      onpress: () {
                        introduction(context);
                      })),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.8,
                child: RoundedButton(
                  text: "Cài đặt",
                  onpress: () {
                    openSetting();
                  },
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Visibility(
                  visible: setting,
                  child: Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        Text("Âm lượng",
                            style: TextStyle(fontSize: 18, color: light)),
                        Slider(
                            value: volume,
                            min: 0,
                            max: 1,
                            divisions: 5,
                            onChanged: (double value) {
                              changeVolume(value);
                            })
                      ],
                    ),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
