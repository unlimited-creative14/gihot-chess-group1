import 'package:frontend/component/baseUrl.dart';
import 'package:frontend/generated/chat/chat.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';

class ChatServices {
  ChatClient chatClient = ChatClient(channel);
  void subcribe() async {
    print("connection");
    try {
      await for (var feature
          in chatClient.subscribe(SubscriptionRequest(username: "long123"))) {
        print(feature);
      }
    } catch (e) {
      print(e);
    }
    // var respone =
    //     await chatClient.subscribe(SubscriptionRequest(username: "long"));

    // print(respone);
  }
}
