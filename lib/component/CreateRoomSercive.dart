import 'package:frontend/component/baseUrl.dart';
import 'package:frontend/generated/room/roomServices.pbgrpc.dart';

class CreateRoomService {
  RoomServiceClient room = RoomServiceClient(channel);
  void createRoom(String roomId, String playerID) async {
    var respone = await room.createRoom(RoomCommonRequest()
      ..roomId = roomId
      ..playerId = playerID);
    print(respone);
  }
}
