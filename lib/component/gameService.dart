import 'package:frontend/generated/game/game.pbgrpc.dart';

import 'baseUrl.dart';

class GameService {
  GameServiceClient gameServiceClient = GameServiceClient(channel);
  void newgame() async {
    try {
      await for (var feature
          in gameServiceClient.createGame(NewGameRequest(playerId: "111"))) {
        print(feature);
      }
    } catch (e) {
      print(e);
    }
  }
}
