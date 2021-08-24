import 'package:grpc/grpc.dart';

const port = 9090;

final ClientChannel channel = ClientChannel(
    'localhost',
    port: port,
    options: ChannelOptions(credentials: ChannelCredentials.insecure()));
