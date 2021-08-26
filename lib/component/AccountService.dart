import 'package:frontend/generated/signup/signup.pbgrpc.dart';

import 'baseUrl.dart';

class AccountService {
  SignUpServiceClient signUpServiceClient = SignUpServiceClient(channel);

  Future<LoginReply> login(String email, String password) async {
    return signUpServiceClient.login(LoginRequest()
      ..email = email
      ..password = password);
  }
}
