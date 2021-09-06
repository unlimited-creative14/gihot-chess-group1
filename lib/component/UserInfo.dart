import 'package:frontend/generated/userInfo/user_info.pbgrpc.dart';

import 'baseUrl.dart';

class UserService {
  UserServiceClient userServiceClient = UserServiceClient(channel);

  Future<UserInfoReply> getUserInfo(String username) async {
    return userServiceClient.getUserInfo(UserInfoRequest()
        ..username = username);
  }

}
