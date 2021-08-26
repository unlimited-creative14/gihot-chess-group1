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
export 'game.pb.dart';

class GameServiceClient extends $grpc.Client {
  static final _$createGame =
      $grpc.ClientMethod<$0.NewGameRequest, $0.GameCommonReply>(
          '/GameService/CreateGame',
          ($0.NewGameRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GameCommonReply.fromBuffer(value));
  static final _$startGame =
      $grpc.ClientMethod<$0.GameCommonRequest, $0.GameCommonReply>(
          '/GameService/StartGame',
          ($0.GameCommonRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GameCommonReply.fromBuffer(value));
  static final _$doMoveChess =
      $grpc.ClientMethod<$0.MoveChessRequest, $0.GameCommonReply>(
          '/GameService/DoMoveChess',
          ($0.MoveChessRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GameCommonReply.fromBuffer(value));
  static final _$destroyGame =
      $grpc.ClientMethod<$0.GameCommonRequest, $0.GameCommonReply>(
          '/GameService/DestroyGame',
          ($0.GameCommonRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GameCommonReply.fromBuffer(value));

  GameServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.GameCommonReply> createGame($0.NewGameRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$createGame, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.GameCommonReply> startGame(
      $0.GameCommonRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$startGame, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.GameCommonReply> doMoveChess(
      $0.MoveChessRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$doMoveChess, request, options: options);
  }

  $grpc.ResponseFuture<$0.GameCommonReply> destroyGame(
      $0.GameCommonRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$destroyGame, request, options: options);
  }
}

abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'GameService';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.NewGameRequest, $0.GameCommonReply>(
        'CreateGame',
        createGame_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.NewGameRequest.fromBuffer(value),
        ($0.GameCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GameCommonRequest, $0.GameCommonReply>(
        'StartGame',
        startGame_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GameCommonRequest.fromBuffer(value),
        ($0.GameCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MoveChessRequest, $0.GameCommonReply>(
        'DoMoveChess',
        doMoveChess_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MoveChessRequest.fromBuffer(value),
        ($0.GameCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GameCommonRequest, $0.GameCommonReply>(
        'DestroyGame',
        destroyGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GameCommonRequest.fromBuffer(value),
        ($0.GameCommonReply value) => value.writeToBuffer()));
  }

  $async.Stream<$0.GameCommonReply> createGame_Pre(
      $grpc.ServiceCall call, $async.Future<$0.NewGameRequest> request) async* {
    yield* createGame(call, await request);
  }

  $async.Stream<$0.GameCommonReply> startGame_Pre($grpc.ServiceCall call,
      $async.Future<$0.GameCommonRequest> request) async* {
    yield* startGame(call, await request);
  }

  $async.Future<$0.GameCommonReply> doMoveChess_Pre($grpc.ServiceCall call,
      $async.Future<$0.MoveChessRequest> request) async {
    return doMoveChess(call, await request);
  }

  $async.Future<$0.GameCommonReply> destroyGame_Pre($grpc.ServiceCall call,
      $async.Future<$0.GameCommonRequest> request) async {
    return destroyGame(call, await request);
  }

  $async.Stream<$0.GameCommonReply> createGame(
      $grpc.ServiceCall call, $0.NewGameRequest request);
  $async.Stream<$0.GameCommonReply> startGame(
      $grpc.ServiceCall call, $0.GameCommonRequest request);
  $async.Future<$0.GameCommonReply> doMoveChess(
      $grpc.ServiceCall call, $0.MoveChessRequest request);
  $async.Future<$0.GameCommonReply> destroyGame(
      $grpc.ServiceCall call, $0.GameCommonRequest request);
}
