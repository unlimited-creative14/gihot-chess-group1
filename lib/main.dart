import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/component/BackgroundMusic.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/welcome/WelcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final BackgroundMusic backgroundMusic = BackgroundMusic();

  void playmusic() async {
    var prefs = await SharedPreferences.getInstance();
    double volume = prefs.getDouble("volume") ?? 1;
    // playing background music
    if (volume > 1) volume = 1;
    backgroundMusic.playMusic("musics/BackgoundMusic.mp3", volume);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    playmusic();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chinese chess',
      theme: ThemeData(primaryColor: light_blue, scaffoldBackgroundColor: dark),
      home: WelcomeScreen(),
    );
  }
}
