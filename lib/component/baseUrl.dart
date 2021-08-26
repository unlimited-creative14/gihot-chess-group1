import 'package:grpc/grpc.dart';

const baseUrl = "192.168.1.6";
const port = 9192;

final ClientChannel channel = ClientChannel(baseUrl,
    port: port,
    options: ChannelOptions(credentials: ChannelCredentials.insecure()));
