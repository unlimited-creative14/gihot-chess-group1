import 'package:frontend/component/baseUrl.dart';
import 'package:frontend/generated/roomServices.pb.dart';
import 'package:frontend/generated/roomServices.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class CreateRoomService {
  RoomServiceClient room = RoomServiceClient(channel);
  void createRoom(String roomId, String playerID) async {
    var respone = await room.createRoom(RoomCommonRequest()
      ..roomId = roomId
      ..playerId = playerID);
    print(respone);
  }
}
