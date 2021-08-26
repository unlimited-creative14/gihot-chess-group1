import 'package:frontend/generated/game/game.pbgrpc.dart';
import 'baseUrl.dart';

class GameService {
  GameServiceClient gameServiceClient = GameServiceClient(channel);

  Stream<GameCommonReply> reply() async* {
    // await for (var msg
    //     in gameServiceClient.createGame(NewGameRequest(playerId: "11"))) {
    //   yield msg;
    // }
  }
}
