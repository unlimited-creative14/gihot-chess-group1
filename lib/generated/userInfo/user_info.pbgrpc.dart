///
//  Generated code. Do not modify.
//  source: user_info.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user_info.pb.dart' as $0;
export 'user_info.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$getUserInfo =
      $grpc.ClientMethod<$0.UserInfoRequest, $0.UserInfoReply>(
          '/UserService/getUserInfo',
          ($0.UserInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UserInfoReply.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UserInfoReply> getUserInfo($0.UserInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserInfo, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserInfoRequest, $0.UserInfoReply>(
        'getUserInfo',
        getUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserInfoRequest.fromBuffer(value),
        ($0.UserInfoReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.UserInfoReply> getUserInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserInfoRequest> request) async {
    return getUserInfo(call, await request);
  }

  $async.Future<$0.UserInfoReply> getUserInfo(
      $grpc.ServiceCall call, $0.UserInfoRequest request);
}
