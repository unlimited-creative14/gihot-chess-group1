import 'package:frontend/component/baseUrl.dart';
import 'package:frontend/generated/signUpServices.pb.dart';
import 'package:frontend/generated/signUpServices.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class SignUpService {
  SignUpServiceClient room = SignUpServiceClient(channel);
  void signUp(String username, String email, String password) async {
    var respone = await room.createNewPlayer(SignupRequest()
      ..username = username
      ..email = email
      ..password = password);
    print(respone);
  }
}
