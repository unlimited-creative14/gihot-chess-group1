import 'Chat.dart';

class LobbyChat {
  var listChatMsg = [];
  int _length = 0;
  void addnewchat(Chat newchat) {
    listChatMsg.add(newchat);
    this._length += 1;
  }

  int getLength() {
    return this._length;
  }
}
