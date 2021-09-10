import 'package:frontend/generated/game/game.pbgrpc.dart';
import 'baseUrl.dart';

class GameService {
  GameServiceClient gameServiceClient = GameServiceClient(gamechanel);

  Stream<GameCommonReply> subscribeGame(String gameId, String playerId) {
    return gameServiceClient.subscribeGame(GameCommonRequest()
      ..gameId = gameId
      ..playerId = playerId);
  }

  Future<GameCommonReply> sendMove(
      String gameId, String playerId, String source, String target) {
    return gameServiceClient.sendMove(MoveChessRequest()
      ..gameId = gameId
      ..playerId = playerId
      ..source = source
      ..target = target);
  }

  Future<GameCommonReply> leaveGame(String gameId, String playerId) {
    return gameServiceClient.leaveGame(GameCommonRequest()
      ..gameId = gameId
      ..playerId = playerId);
  }
}
