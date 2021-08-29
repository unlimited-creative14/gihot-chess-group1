///
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'game.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'game.pb.dart';

class GameServiceClient extends $grpc.Client {
  static final _$createGame =
      $grpc.ClientMethod<$0.GameCreateRequest, $0.GameCommonReply>(
          '/GameService/CreateGame',
          ($0.GameCreateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GameCommonReply.fromBuffer(value));
  static final _$subscribeGame =
      $grpc.ClientMethod<$0.GameCommonRequest, $0.GameCommonReply>(
          '/GameService/SubscribeGame',
          ($0.GameCommonRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GameCommonReply.fromBuffer(value));
  static final _$guestSubscribeGame =
      $grpc.ClientMethod<$1.Empty, $0.GameCommonReply>(
          '/GameService/GuestSubscribeGame',
          ($1.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GameCommonReply.fromBuffer(value));
  static final _$sendMove =
      $grpc.ClientMethod<$0.MoveChessRequest, $0.GameCommonReply>(
          '/GameService/SendMove',
          ($0.MoveChessRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GameCommonReply.fromBuffer(value));

  GameServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GameCommonReply> createGame(
      $0.GameCreateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createGame, request, options: options);
  }

  $grpc.ResponseStream<$0.GameCommonReply> subscribeGame(
      $0.GameCommonRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$subscribeGame, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.GameCommonReply> guestSubscribeGame($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$guestSubscribeGame, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.GameCommonReply> sendMove($0.MoveChessRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMove, request, options: options);
  }
}

abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'GameService';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GameCreateRequest, $0.GameCommonReply>(
        'CreateGame',
        createGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GameCreateRequest.fromBuffer(value),
        ($0.GameCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GameCommonRequest, $0.GameCommonReply>(
        'SubscribeGame',
        subscribeGame_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GameCommonRequest.fromBuffer(value),
        ($0.GameCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GameCommonReply>(
        'GuestSubscribeGame',
        guestSubscribeGame_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GameCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MoveChessRequest, $0.GameCommonReply>(
        'SendMove',
        sendMove_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MoveChessRequest.fromBuffer(value),
        ($0.GameCommonReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.GameCommonReply> createGame_Pre($grpc.ServiceCall call,
      $async.Future<$0.GameCreateRequest> request) async {
    return createGame(call, await request);
  }

  $async.Stream<$0.GameCommonReply> subscribeGame_Pre($grpc.ServiceCall call,
      $async.Future<$0.GameCommonRequest> request) async* {
    yield* subscribeGame(call, await request);
  }

  $async.Stream<$0.GameCommonReply> guestSubscribeGame_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* guestSubscribeGame(call, await request);
  }

  $async.Future<$0.GameCommonReply> sendMove_Pre($grpc.ServiceCall call,
      $async.Future<$0.MoveChessRequest> request) async {
    return sendMove(call, await request);
  }

  $async.Future<$0.GameCommonReply> createGame(
      $grpc.ServiceCall call, $0.GameCreateRequest request);
  $async.Stream<$0.GameCommonReply> subscribeGame(
      $grpc.ServiceCall call, $0.GameCommonRequest request);
  $async.Stream<$0.GameCommonReply> guestSubscribeGame(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.GameCommonReply> sendMove(
      $grpc.ServiceCall call, $0.MoveChessRequest request);
}
