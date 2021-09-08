import 'package:audioplayers/audioplayers.dart';

class BackgroundMusic {
  static AudioPlayer _audioPlayer = AudioPlayer();
  static final _music = AudioCache(fixedPlayer: _audioPlayer);

  static final BackgroundMusic backgroundMusic =
      BackgroundMusic._privateContructor();
  factory BackgroundMusic() {
    return backgroundMusic;
  }
  BackgroundMusic._privateContructor();

  void playMusic(String url, double volume) {
    try {
      _music.loop(url, volume: volume);
    } catch (e) {
      print("Error play background music: $e");
    }
  }

  void changeVolume(double newVolume) {
    _audioPlayer.setVolume(newVolume);
  }
}
