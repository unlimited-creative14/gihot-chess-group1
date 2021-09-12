import 'package:frontend/generated/userInfo/user_info.pbgrpc.dart';

import 'baseUrl.dart';

class UserService {
  UserServiceClient userServiceClient = UserServiceClient(channel);

  Future<UserInfoReply> getUserInfo(String username) async {
    return userServiceClient.getUserInfo(UserInfoRequest()
        ..username = username);
  }
  Future<newUserReply> newUser (String username,String display_name,String photo_url) async {
    return userServiceClient.newUser(newUserRequest()
        ..username = username
        ..displayName = display_name
        ..photoUrl = photo_url);
  }

  Future<UserExist> isExist (String username) async {
    return userServiceClient.isExist(UserInfoRequest()
        ..username = username);
  }

  Future<LogoutReply> logout (String username) async {
    return userServiceClient.logout(UserInfoRequest()
      ..username = username);
  }

}
