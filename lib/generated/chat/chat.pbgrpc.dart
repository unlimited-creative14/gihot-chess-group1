///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
export 'chat.pb.dart';

class ChatClient extends $grpc.Client {
  static final _$subscribe =
      $grpc.ClientMethod<$0.SubscriptionRequest, $0.Message>(
          '/grpcwebchat.Chat/Subscribe',
          ($0.SubscriptionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Message.fromBuffer(value));
  static final _$sendMessage =
      $grpc.ClientMethod<$0.MessageRequest, $0.Message>(
          '/grpcwebchat.Chat/SendMessage',
          ($0.MessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Message.fromBuffer(value));
  static final _$unsubscribe =
      $grpc.ClientMethod<$0.UnsubscriptionRequest, $0.Message>(
          '/grpcwebchat.Chat/Unsubscribe',
          ($0.UnsubscriptionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  ChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.Message> subscribe($0.SubscriptionRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$subscribe, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Message> sendMessage($0.MessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.Message> unsubscribe($0.UnsubscriptionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unsubscribe, request, options: options);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'grpcwebchat.Chat';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SubscriptionRequest, $0.Message>(
        'Subscribe',
        subscribe_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.SubscriptionRequest.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MessageRequest, $0.Message>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MessageRequest.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UnsubscriptionRequest, $0.Message>(
        'Unsubscribe',
        unsubscribe_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UnsubscriptionRequest.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Message> subscribe_Pre($grpc.ServiceCall call,
      $async.Future<$0.SubscriptionRequest> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Future<$0.Message> sendMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MessageRequest> request) async {
    return sendMessage(call, await request);
  }

  $async.Future<$0.Message> unsubscribe_Pre($grpc.ServiceCall call,
      $async.Future<$0.UnsubscriptionRequest> request) async {
    return unsubscribe(call, await request);
  }

  $async.Stream<$0.Message> subscribe(
      $grpc.ServiceCall call, $0.SubscriptionRequest request);
  $async.Future<$0.Message> sendMessage(
      $grpc.ServiceCall call, $0.MessageRequest request);
  $async.Future<$0.Message> unsubscribe(
      $grpc.ServiceCall call, $0.UnsubscriptionRequest request);
}
