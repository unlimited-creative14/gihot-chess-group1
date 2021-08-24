///
//  Generated code. Do not modify.
//  source: signUpServices.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'signUpServices.pb.dart' as $0;
export 'signUpServices.pb.dart';

class SignUpServiceClient extends $grpc.Client {
  static final _$createNewPlayer =
      $grpc.ClientMethod<$0.SignupRequest, $0.SignupReply>(
          '/SignUpService/CreateNewPlayer',
          ($0.SignupRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SignupReply.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginReply>(
      '/SignUpService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginReply.fromBuffer(value));

  SignUpServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.SignupReply> createNewPlayer($0.SignupRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createNewPlayer, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginReply> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }
}

abstract class SignUpServiceBase extends $grpc.Service {
  $core.String get $name => 'SignUpService';

  SignUpServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SignupRequest, $0.SignupReply>(
        'CreateNewPlayer',
        createNewPlayer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignupRequest.fromBuffer(value),
        ($0.SignupReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginReply>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.SignupReply> createNewPlayer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignupRequest> request) async {
    return createNewPlayer(call, await request);
  }

  $async.Future<$0.LoginReply> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.SignupReply> createNewPlayer(
      $grpc.ServiceCall call, $0.SignupRequest request);
  $async.Future<$0.LoginReply> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
}
