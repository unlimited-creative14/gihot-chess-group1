///
//  Generated code. Do not modify.
//  source: room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'room.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'room.pb.dart';

class RoomServiceClient extends $grpc.Client {
  static final _$createRoom =
      $grpc.ClientMethod<$0.CreateRoomRequest, $0.RoomCommonReply>(
          '/RoomService/CreateRoom',
          ($0.CreateRoomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RoomCommonReply.fromBuffer(value));
  static final _$joinRoom =
      $grpc.ClientMethod<$0.RoomCommonRequest, $0.RoomMessage>(
          '/RoomService/JoinRoom',
          ($0.RoomCommonRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RoomMessage.fromBuffer(value));
  static final _$leaveRoom =
      $grpc.ClientMethod<$0.RoomCommonRequest, $0.RoomCommonReply>(
          '/RoomService/LeaveRoom',
          ($0.RoomCommonRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RoomCommonReply.fromBuffer(value));
  static final _$getInfoRoom =
      $grpc.ClientMethod<$0.RoomInfoRequest, $0.RoomInfoReply>(
          '/RoomService/GetInfoRoom',
          ($0.RoomInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RoomInfoReply.fromBuffer(value));
  static final _$getAllRoom = $grpc.ClientMethod<$1.Empty, $0.RoomListReply>(
      '/RoomService/GetAllRoom',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RoomListReply.fromBuffer(value));
  static final _$roomStartGame =
      $grpc.ClientMethod<$0.RoomCommonRequest, $0.RoomMessage>(
          '/RoomService/RoomStartGame',
          ($0.RoomCommonRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RoomMessage.fromBuffer(value));
  static final _$sendChat =
      $grpc.ClientMethod<$0.ChatMessage, $0.RoomCommonReply>(
          '/RoomService/SendChat',
          ($0.ChatMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RoomCommonReply.fromBuffer(value));

  RoomServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.RoomCommonReply> createRoom(
      $0.CreateRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoom, request, options: options);
  }

  $grpc.ResponseStream<$0.RoomMessage> joinRoom($0.RoomCommonRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$joinRoom, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.RoomCommonReply> leaveRoom(
      $0.RoomCommonRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leaveRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomInfoReply> getInfoRoom($0.RoomInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getInfoRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomListReply> getAllRoom($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomMessage> roomStartGame(
      $0.RoomCommonRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$roomStartGame, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomCommonReply> sendChat($0.ChatMessage request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendChat, request, options: options);
  }
}

abstract class RoomServiceBase extends $grpc.Service {
  $core.String get $name => 'RoomService';

  RoomServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateRoomRequest, $0.RoomCommonReply>(
        'CreateRoom',
        createRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRoomRequest.fromBuffer(value),
        ($0.RoomCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoomCommonRequest, $0.RoomMessage>(
        'JoinRoom',
        joinRoom_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.RoomCommonRequest.fromBuffer(value),
        ($0.RoomMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoomCommonRequest, $0.RoomCommonReply>(
        'LeaveRoom',
        leaveRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RoomCommonRequest.fromBuffer(value),
        ($0.RoomCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoomInfoRequest, $0.RoomInfoReply>(
        'GetInfoRoom',
        getInfoRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RoomInfoRequest.fromBuffer(value),
        ($0.RoomInfoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.RoomListReply>(
        'GetAllRoom',
        getAllRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.RoomListReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoomCommonRequest, $0.RoomMessage>(
        'RoomStartGame',
        roomStartGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RoomCommonRequest.fromBuffer(value),
        ($0.RoomMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatMessage, $0.RoomCommonReply>(
        'SendChat',
        sendChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value),
        ($0.RoomCommonReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.RoomCommonReply> createRoom_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateRoomRequest> request) async {
    return createRoom(call, await request);
  }

  $async.Stream<$0.RoomMessage> joinRoom_Pre($grpc.ServiceCall call,
      $async.Future<$0.RoomCommonRequest> request) async* {
    yield* joinRoom(call, await request);
  }

  $async.Future<$0.RoomCommonReply> leaveRoom_Pre($grpc.ServiceCall call,
      $async.Future<$0.RoomCommonRequest> request) async {
    return leaveRoom(call, await request);
  }

  $async.Future<$0.RoomInfoReply> getInfoRoom_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RoomInfoRequest> request) async {
    return getInfoRoom(call, await request);
  }

  $async.Future<$0.RoomListReply> getAllRoom_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllRoom(call, await request);
  }

  $async.Future<$0.RoomMessage> roomStartGame_Pre($grpc.ServiceCall call,
      $async.Future<$0.RoomCommonRequest> request) async {
    return roomStartGame(call, await request);
  }

  $async.Future<$0.RoomCommonReply> sendChat_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ChatMessage> request) async {
    return sendChat(call, await request);
  }

  $async.Future<$0.RoomCommonReply> createRoom(
      $grpc.ServiceCall call, $0.CreateRoomRequest request);
  $async.Stream<$0.RoomMessage> joinRoom(
      $grpc.ServiceCall call, $0.RoomCommonRequest request);
  $async.Future<$0.RoomCommonReply> leaveRoom(
      $grpc.ServiceCall call, $0.RoomCommonRequest request);
  $async.Future<$0.RoomInfoReply> getInfoRoom(
      $grpc.ServiceCall call, $0.RoomInfoRequest request);
  $async.Future<$0.RoomListReply> getAllRoom(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.RoomMessage> roomStartGame(
      $grpc.ServiceCall call, $0.RoomCommonRequest request);
  $async.Future<$0.RoomCommonReply> sendChat(
      $grpc.ServiceCall call, $0.ChatMessage request);
}

class PostGameServiceClient extends $grpc.Client {
  static final _$postGame =
      $grpc.ClientMethod<$0.PostGameDataRequest, $1.Empty>(
          '/PostGameService/PostGame',
          ($0.PostGameDataRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  PostGameServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Empty> postGame($0.PostGameDataRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$postGame, request, options: options);
  }
}

abstract class PostGameServiceBase extends $grpc.Service {
  $core.String get $name => 'PostGameService';

  PostGameServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PostGameDataRequest, $1.Empty>(
        'PostGame',
        postGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.PostGameDataRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> postGame_Pre($grpc.ServiceCall call,
      $async.Future<$0.PostGameDataRequest> request) async {
    return postGame(call, await request);
  }

  $async.Future<$1.Empty> postGame(
      $grpc.ServiceCall call, $0.PostGameDataRequest request);
}
