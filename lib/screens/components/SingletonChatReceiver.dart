class SingletonChatReceiver {
  String data = "";

  static final SingletonChatReceiver singletonChatReceiver =
      SingletonChatReceiver._privateConstructor();

  factory SingletonChatReceiver() {
    return singletonChatReceiver;
  }

  SingletonChatReceiver._privateConstructor();
}
