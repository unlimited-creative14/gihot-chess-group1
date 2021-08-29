import 'package:frontend/component/baseUrl.dart';
import 'package:frontend/generated/room/google/protobuf/empty.pb.dart';
import 'package:frontend/generated/room/room.pbgrpc.dart';

class RoomService {
  RoomServiceClient room = RoomServiceClient(channel);

  Future<RoomCommonReply> createRoom(String playerId) {
    return room.createRoom(RoomCommonRequest()..playerId = playerId);
  }

  Future<RoomCommonReply> destroyRoom(String roomId) {
    return room.destroyRoom(RoomCommonRequest()..roomId = roomId);
  }

  Stream<RoomMessage> joinRoom(String roomId, String playerId) {
    return room.joinRoom(RoomCommonRequest()
      ..roomId = roomId
      ..playerId = playerId);
  }

  Future<RoomInfoReply> getInfoRoom(String roomId) {
    return room.getInfoRoom(RoomInfoRequest()..roomId = roomId);
  }

  Future<RoomListReply> getAllRoom() {
    return room.getAllRoom(Empty());
  }

  Future<RoomMessage> roomStartGame(String roomId, String playerId) {
    return room.roomStartGame(RoomCommonRequest()
      ..roomId = roomId
      ..playerId = playerId);
  }
}
