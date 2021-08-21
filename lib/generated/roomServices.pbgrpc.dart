///
//  Generated code. Do not modify.
//  source: roomServices.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'roomServices.pb.dart' as $0;
export 'roomServices.pb.dart';

class RoomServiceClient extends $grpc.Client {
  static final _$createRoom =
      $grpc.ClientMethod<$0.RoomCommonRequest, $0.RoomCommonReply>(
          '/RoomService/CreateRoom',
          ($0.RoomCommonRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RoomCommonReply.fromBuffer(value));
  static final _$destroyRoom =
      $grpc.ClientMethod<$0.RoomCommonRequest, $0.RoomCommonReply>(
          '/RoomService/DestroyRoom',
          ($0.RoomCommonRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RoomCommonReply.fromBuffer(value));
  static final _$joinRoom =
      $grpc.ClientMethod<$0.RoomCommonRequest, $0.RoomCommonReply>(
          '/RoomService/JoinRoom',
          ($0.RoomCommonRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RoomCommonReply.fromBuffer(value));

  RoomServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.RoomCommonReply> createRoom(
      $0.RoomCommonRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomCommonReply> destroyRoom(
      $0.RoomCommonRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$destroyRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomCommonReply> joinRoom(
      $0.RoomCommonRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$joinRoom, request, options: options);
  }
}

abstract class RoomServiceBase extends $grpc.Service {
  $core.String get $name => 'RoomService';

  RoomServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RoomCommonRequest, $0.RoomCommonReply>(
        'CreateRoom',
        createRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RoomCommonRequest.fromBuffer(value),
        ($0.RoomCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoomCommonRequest, $0.RoomCommonReply>(
        'DestroyRoom',
        destroyRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RoomCommonRequest.fromBuffer(value),
        ($0.RoomCommonReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoomCommonRequest, $0.RoomCommonReply>(
        'JoinRoom',
        joinRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RoomCommonRequest.fromBuffer(value),
        ($0.RoomCommonReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.RoomCommonReply> createRoom_Pre($grpc.ServiceCall call,
      $async.Future<$0.RoomCommonRequest> request) async {
    return createRoom(call, await request);
  }

  $async.Future<$0.RoomCommonReply> destroyRoom_Pre($grpc.ServiceCall call,
      $async.Future<$0.RoomCommonRequest> request) async {
    return destroyRoom(call, await request);
  }

  $async.Future<$0.RoomCommonReply> joinRoom_Pre($grpc.ServiceCall call,
      $async.Future<$0.RoomCommonRequest> request) async {
    return joinRoom(call, await request);
  }

  $async.Future<$0.RoomCommonReply> createRoom(
      $grpc.ServiceCall call, $0.RoomCommonRequest request);
  $async.Future<$0.RoomCommonReply> destroyRoom(
      $grpc.ServiceCall call, $0.RoomCommonRequest request);
  $async.Future<$0.RoomCommonReply> joinRoom(
      $grpc.ServiceCall call, $0.RoomCommonRequest request);
}
