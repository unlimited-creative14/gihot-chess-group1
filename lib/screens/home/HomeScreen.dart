import 'package:flutter/material.dart';
import 'package:frontend/component/BackgroundMusic.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/RoundedButton.dart';
import 'package:frontend/screens/components/WelcomeBackground.dart';
import 'package:frontend/screens/playgame/RoomScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double volume = 1;
  bool setting = false;
  BackgroundMusic backgroundMusic = BackgroundMusic();
  late final SharedPreferences pref;

  void start(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RoomScreen()));
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

  void executeAfterBuildComplete() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      volume = pref.getDouble("volume") ?? 1;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => executeAfterBuildComplete());
    super.initState();
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
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    openProfile(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(size.height * 0.03),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.height * 0.05)),
                      child: Image.asset(
                        "assets/images/profile.png",
                        height: size.height * 0.1,
                      ),
                    ),
                  ),
                ),
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
