import 'package:grpc/grpc.dart';

const baseUrl = "192.168.1.4";
const port = 9090;

final ClientChannel channel = ClientChannel(baseUrl,
    port: port,
    options: ChannelOptions(credentials: ChannelCredentials.insecure()));
