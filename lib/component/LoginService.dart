import 'package:frontend/component/baseUrl.dart';
import 'package:frontend/generated/signUpServices.pb.dart';
import 'package:frontend/generated/signUpServices.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class LoginService {
  SignUpServiceClient room = SignUpServiceClient(channel);
  void login(String email, String password) async {
    var respone = await room.login(LoginRequest()
      ..email = email
      ..password = password);
    print(respone);
  }
}
