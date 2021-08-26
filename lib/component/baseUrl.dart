import 'package:grpc/grpc.dart';

const baseUrl = "192.168.1.6";
const port = 9090;
const game_port = 9192;

final ClientChannel channel = ClientChannel(baseUrl,
    port: port,
    options: ChannelOptions(credentials: ChannelCredentials.insecure()));

final ClientChannel gamechanel = ClientChannel(baseUrl,
    port: game_port,
    options: ChannelOptions(credentials: ChannelCredentials.insecure()));
