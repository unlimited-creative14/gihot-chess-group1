///
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'game.pb.dart' as $1;
export 'game.pb.dart';

class GameServiceClient extends $grpc.Client {
  static final _$createGame = $grpc.ClientMethod<$0.Empty, $1.GameCommonReply>(
      '/GameService/CreateGame',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GameCommonReply.fromBuffer(value));
  static final _$subscribeGame =
      $grpc.ClientMethod<$1.GameCommonRequest, $1.GameCommonReply>(
          '/GameService/SubscribeGame',
          ($1.GameCommonRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GameCommonReply.fromBuffer(value));
  static final _$guestSubscribeGame =
      $grpc.ClientMethod<$0.Empty, $1.GameCommonReply>(
          '/GameService/GuestSubscribeGame',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GameCommonReply.fromBuffer(value));
  static final _$sendMove =
      $grpc.ClientMethod<$1.MoveChessRequest, $1.GameCommonReply>(
          '/GameService/SendMove',
          ($1.MoveChessRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GameCommonReply.fromBuffer(value));

  GameServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.GameCommonReply> createGame($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createGame, request, options: options);
  }

  $grpc.ResponseStream<$1.GameCommonReply> subscribeGame(
      $1.GameCommonRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$subscribeGame, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$1.GameCommonReply> guestSubscribeGame($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$guestSubscribeGame, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.GameCommonReply> sendMove($1.MoveChessRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMove, request, options: options);
  }
}

abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'GameService';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GameCommonReply>(
        'CreateGame',
        createGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GameCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GameCommonRequest, $1.GameCommonReply>(
        'SubscribeGame',
        subscribeGame_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.GameCommonRequest.fromBuffer(value),
        ($1.GameCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GameCommonReply>(
        'GuestSubscribeGame',
        guestSubscribeGame_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GameCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.MoveChessRequest, $1.GameCommonReply>(
        'SendMove',
        sendMove_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.MoveChessRequest.fromBuffer(value),
        ($1.GameCommonReply value) => value.writeToBuffer()));
  }

  $async.Future<$1.GameCommonReply> createGame_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return createGame(call, await request);
  }

  $async.Stream<$1.GameCommonReply> subscribeGame_Pre($grpc.ServiceCall call,
      $async.Future<$1.GameCommonRequest> request) async* {
    yield* subscribeGame(call, await request);
  }

  $async.Stream<$1.GameCommonReply> guestSubscribeGame_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* guestSubscribeGame(call, await request);
  }

  $async.Future<$1.GameCommonReply> sendMove_Pre($grpc.ServiceCall call,
      $async.Future<$1.MoveChessRequest> request) async {
    return sendMove(call, await request);
  }

  $async.Future<$1.GameCommonReply> createGame(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Stream<$1.GameCommonReply> subscribeGame(
      $grpc.ServiceCall call, $1.GameCommonRequest request);
  $async.Stream<$1.GameCommonReply> guestSubscribeGame(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.GameCommonReply> sendMove(
      $grpc.ServiceCall call, $1.MoveChessRequest request);
}
