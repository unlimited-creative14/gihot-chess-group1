import 'package:frontend/generated/lobby/lobby.pbgrpc.dart';
import 'baseUrl.dart';

class LobbyService {
  LobbyServiceClient lobbyServiceClient = LobbyServiceClient(channel);

  Stream<LobbyCommonReply> joinLobby(String playerId) {
    return lobbyServiceClient
        .joinLobby(LobbyCommonMessage()..playerId = playerId);
  }

  Future<FriendList> getFriendList(String playerId) {
    return lobbyServiceClient
        .getFriendsList(LobbyCommonMessage()..playerId = playerId);
  }

  Future<LobbyCommonReply> unFriend(String playerId, String friendId) {
    return lobbyServiceClient.unfriend(FriendRequest()
      ..id = playerId
      ..playerId = playerId
      ..playerId2 = friendId);
  }

  Future<LobbyCommonReply> sendFriendRequest(String playerId, String friendId) {
    return lobbyServiceClient.sendFriendRequest(FriendRequest()
      ..id = playerId
      ..playerId = playerId
      ..playerId2 = friendId);
  }

  Future<LobbyCommonReply> acceptFriendRequest(
      String playerId, String friendId) {
    return lobbyServiceClient.acceptFriendRequest(FriendRequest()
      ..id = playerId
      ..playerId = playerId
      ..playerId2 = friendId);
  }

  Future<LobbyCommonReply> declineFriendRequest(
      String playerId, String friendId) {
    return lobbyServiceClient.declineFriendRequest(FriendRequest()
      ..id = playerId
      ..playerId = playerId
      ..playerId2 = friendId);
  }

  Future<LobbyCommonReply> sendChat(
      String playerId, String friendId, String message) {
    return lobbyServiceClient.sendChat(LobbyChatMessage()
      ..playerId = playerId
      ..recvPlayerId = friendId
      ..msg = message);
  }
}