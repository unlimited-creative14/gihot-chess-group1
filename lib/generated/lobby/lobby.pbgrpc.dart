///
//  Generated code. Do not modify.
//  source: lobby.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'lobby.pb.dart' as $0;
export 'lobby.pb.dart';

class LobbyServiceClient extends $grpc.Client {
  static final _$joinLobby =
      $grpc.ClientMethod<$0.LobbyCommonMessage, $0.LobbyCommonReply>(
          '/LobbyService/JoinLobby',
          ($0.LobbyCommonMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LobbyCommonReply.fromBuffer(value));
  static final _$getFriendsList =
      $grpc.ClientMethod<$0.LobbyCommonMessage, $0.FriendList>(
          '/LobbyService/GetFriendsList',
          ($0.LobbyCommonMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FriendList.fromBuffer(value));
  static final _$unfriend =
      $grpc.ClientMethod<$0.FriendRequest, $0.LobbyCommonReply>(
          '/LobbyService/Unfriend',
          ($0.FriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LobbyCommonReply.fromBuffer(value));
  static final _$sendFriendRequest =
      $grpc.ClientMethod<$0.FriendRequest, $0.LobbyCommonReply>(
          '/LobbyService/SendFriendRequest',
          ($0.FriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LobbyCommonReply.fromBuffer(value));
  static final _$acceptFriendRequest =
      $grpc.ClientMethod<$0.FriendRequest, $0.LobbyCommonReply>(
          '/LobbyService/AcceptFriendRequest',
          ($0.FriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LobbyCommonReply.fromBuffer(value));
  static final _$declineFriendRequest =
      $grpc.ClientMethod<$0.FriendRequest, $0.LobbyCommonReply>(
          '/LobbyService/DeclineFriendRequest',
          ($0.FriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LobbyCommonReply.fromBuffer(value));
  static final _$sendChat =
      $grpc.ClientMethod<$0.LobbyChatMessage, $0.LobbyCommonReply>(
          '/LobbyService/SendChat',
          ($0.LobbyChatMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LobbyCommonReply.fromBuffer(value));

  LobbyServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.LobbyCommonReply> joinLobby(
      $0.LobbyCommonMessage request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$joinLobby, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.FriendList> getFriendsList(
      $0.LobbyCommonMessage request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFriendsList, request, options: options);
  }

  $grpc.ResponseFuture<$0.LobbyCommonReply> unfriend($0.FriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unfriend, request, options: options);
  }

  $grpc.ResponseFuture<$0.LobbyCommonReply> sendFriendRequest(
      $0.FriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendFriendRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.LobbyCommonReply> acceptFriendRequest(
      $0.FriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$acceptFriendRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.LobbyCommonReply> declineFriendRequest(
      $0.FriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$declineFriendRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.LobbyCommonReply> sendChat(
      $0.LobbyChatMessage request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendChat, request, options: options);
  }
}

abstract class LobbyServiceBase extends $grpc.Service {
  $core.String get $name => 'LobbyService';

  LobbyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LobbyCommonMessage, $0.LobbyCommonReply>(
        'JoinLobby',
        joinLobby_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.LobbyCommonMessage.fromBuffer(value),
        ($0.LobbyCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LobbyCommonMessage, $0.FriendList>(
        'GetFriendsList',
        getFriendsList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.LobbyCommonMessage.fromBuffer(value),
        ($0.FriendList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FriendRequest, $0.LobbyCommonReply>(
        'Unfriend',
        unfriend_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FriendRequest.fromBuffer(value),
        ($0.LobbyCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FriendRequest, $0.LobbyCommonReply>(
        'SendFriendRequest',
        sendFriendRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FriendRequest.fromBuffer(value),
        ($0.LobbyCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FriendRequest, $0.LobbyCommonReply>(
        'AcceptFriendRequest',
        acceptFriendRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FriendRequest.fromBuffer(value),
        ($0.LobbyCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FriendRequest, $0.LobbyCommonReply>(
        'DeclineFriendRequest',
        declineFriendRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FriendRequest.fromBuffer(value),
        ($0.LobbyCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LobbyChatMessage, $0.LobbyCommonReply>(
        'SendChat',
        sendChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LobbyChatMessage.fromBuffer(value),
        ($0.LobbyCommonReply value) => value.writeToBuffer()));
  }

  $async.Stream<$0.LobbyCommonReply> joinLobby_Pre($grpc.ServiceCall call,
      $async.Future<$0.LobbyCommonMessage> request) async* {
    yield* joinLobby(call, await request);
  }

  $async.Future<$0.FriendList> getFriendsList_Pre($grpc.ServiceCall call,
      $async.Future<$0.LobbyCommonMessage> request) async {
    return getFriendsList(call, await request);
  }

  $async.Future<$0.LobbyCommonReply> unfriend_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FriendRequest> request) async {
    return unfriend(call, await request);
  }

  $async.Future<$0.LobbyCommonReply> sendFriendRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FriendRequest> request) async {
    return sendFriendRequest(call, await request);
  }

  $async.Future<$0.LobbyCommonReply> acceptFriendRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FriendRequest> request) async {
    return acceptFriendRequest(call, await request);
  }

  $async.Future<$0.LobbyCommonReply> declineFriendRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FriendRequest> request) async {
    return declineFriendRequest(call, await request);
  }

  $async.Future<$0.LobbyCommonReply> sendChat_Pre($grpc.ServiceCall call,
      $async.Future<$0.LobbyChatMessage> request) async {
    return sendChat(call, await request);
  }

  $async.Stream<$0.LobbyCommonReply> joinLobby(
      $grpc.ServiceCall call, $0.LobbyCommonMessage request);
  $async.Future<$0.FriendList> getFriendsList(
      $grpc.ServiceCall call, $0.LobbyCommonMessage request);
  $async.Future<$0.LobbyCommonReply> unfriend(
      $grpc.ServiceCall call, $0.FriendRequest request);
  $async.Future<$0.LobbyCommonReply> sendFriendRequest(
      $grpc.ServiceCall call, $0.FriendRequest request);
  $async.Future<$0.LobbyCommonReply> acceptFriendRequest(
      $grpc.ServiceCall call, $0.FriendRequest request);
  $async.Future<$0.LobbyCommonReply> declineFriendRequest(
      $grpc.ServiceCall call, $0.FriendRequest request);
  $async.Future<$0.LobbyCommonReply> sendChat(
      $grpc.ServiceCall call, $0.LobbyChatMessage request);
}

class AdminLobbyServiceClient extends $grpc.Client {
  static final _$broadcastMessage =
      $grpc.ClientMethod<$0.LobbyCommonReply, $0.LobbyCommonReply>(
          '/AdminLobbyService/BroadcastMessage',
          ($0.LobbyCommonReply value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LobbyCommonReply.fromBuffer(value));

  AdminLobbyServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LobbyCommonReply> broadcastMessage(
      $0.LobbyCommonReply request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$broadcastMessage, request, options: options);
  }
}

abstract class AdminLobbyServiceBase extends $grpc.Service {
  $core.String get $name => 'AdminLobbyService';

  AdminLobbyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LobbyCommonReply, $0.LobbyCommonReply>(
        'BroadcastMessage',
        broadcastMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LobbyCommonReply.fromBuffer(value),
        ($0.LobbyCommonReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.LobbyCommonReply> broadcastMessage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.LobbyCommonReply> request) async {
    return broadcastMessage(call, await request);
  }

  $async.Future<$0.LobbyCommonReply> broadcastMessage(
      $grpc.ServiceCall call, $0.LobbyCommonReply request);
}
