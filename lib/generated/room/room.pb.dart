///
//  Generated code. Do not modify.
//  source: room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'room.pbenum.dart';

export 'room.pbenum.dart';

class RoomListReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomListReply', createEmptyInstance: create)
    ..pc<RoomInfoReply>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rooms', $pb.PbFieldType.PM, subBuilder: RoomInfoReply.create)
    ..hasRequiredFields = false
  ;

  RoomListReply._() : super();
  factory RoomListReply({
    $core.Iterable<RoomInfoReply>? rooms,
  }) {
    final _result = create();
    if (rooms != null) {
      _result.rooms.addAll(rooms);
    }
    return _result;
  }
  factory RoomListReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomListReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomListReply clone() => RoomListReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomListReply copyWith(void Function(RoomListReply) updates) => super.copyWith((message) => updates(message as RoomListReply)) as RoomListReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomListReply create() => RoomListReply._();
  RoomListReply createEmptyInstance() => create();
  static $pb.PbList<RoomListReply> createRepeated() => $pb.PbList<RoomListReply>();
  @$core.pragma('dart2js:noInline')
  static RoomListReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomListReply>(create);
  static RoomListReply? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<RoomInfoReply> get rooms => $_getList(0);
}

class RoomInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomInfoRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  RoomInfoRequest._() : super();
  factory RoomInfoRequest({
    $core.String? roomId,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    return _result;
  }
  factory RoomInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomInfoRequest clone() => RoomInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomInfoRequest copyWith(void Function(RoomInfoRequest) updates) => super.copyWith((message) => updates(message as RoomInfoRequest)) as RoomInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomInfoRequest create() => RoomInfoRequest._();
  RoomInfoRequest createEmptyInstance() => create();
  static $pb.PbList<RoomInfoRequest> createRepeated() => $pb.PbList<RoomInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static RoomInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomInfoRequest>(create);
  static RoomInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);
}

class RoomInfoReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomInfoReply', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creatorId')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerIds')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'started')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ended')
    ..hasRequiredFields = false
  ;

  RoomInfoReply._() : super();
  factory RoomInfoReply({
    $core.String? roomId,
    $core.String? creatorId,
    $core.Iterable<$core.String>? playerIds,
    $core.bool? started,
    $core.bool? ended,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (creatorId != null) {
      _result.creatorId = creatorId;
    }
    if (playerIds != null) {
      _result.playerIds.addAll(playerIds);
    }
    if (started != null) {
      _result.started = started;
    }
    if (ended != null) {
      _result.ended = ended;
    }
    return _result;
  }
  factory RoomInfoReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomInfoReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomInfoReply clone() => RoomInfoReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomInfoReply copyWith(void Function(RoomInfoReply) updates) => super.copyWith((message) => updates(message as RoomInfoReply)) as RoomInfoReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomInfoReply create() => RoomInfoReply._();
  RoomInfoReply createEmptyInstance() => create();
  static $pb.PbList<RoomInfoReply> createRepeated() => $pb.PbList<RoomInfoReply>();
  @$core.pragma('dart2js:noInline')
  static RoomInfoReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomInfoReply>(create);
  static RoomInfoReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get creatorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set creatorId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatorId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get playerIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get started => $_getBF(3);
  @$pb.TagNumber(4)
  set started($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStarted() => $_has(3);
  @$pb.TagNumber(4)
  void clearStarted() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get ended => $_getBF(4);
  @$pb.TagNumber(5)
  set ended($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEnded() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnded() => clearField(5);
}

class RoomCommonRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomCommonRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  RoomCommonRequest._() : super();
  factory RoomCommonRequest({
    $core.String? playerId,
    $core.String? roomId,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    return _result;
  }
  factory RoomCommonRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomCommonRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomCommonRequest clone() => RoomCommonRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomCommonRequest copyWith(void Function(RoomCommonRequest) updates) => super.copyWith((message) => updates(message as RoomCommonRequest)) as RoomCommonRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCommonRequest create() => RoomCommonRequest._();
  RoomCommonRequest createEmptyInstance() => create();
  static $pb.PbList<RoomCommonRequest> createRepeated() => $pb.PbList<RoomCommonRequest>();
  @$core.pragma('dart2js:noInline')
  static RoomCommonRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomCommonRequest>(create);
  static RoomCommonRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);
}

class RoomCommonReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomCommonReply', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  RoomCommonReply._() : super();
  factory RoomCommonReply({
    $core.String? success,
    $core.String? roomId,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    return _result;
  }
  factory RoomCommonReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomCommonReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomCommonReply clone() => RoomCommonReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomCommonReply copyWith(void Function(RoomCommonReply) updates) => super.copyWith((message) => updates(message as RoomCommonReply)) as RoomCommonReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCommonReply create() => RoomCommonReply._();
  RoomCommonReply createEmptyInstance() => create();
  static $pb.PbList<RoomCommonReply> createRepeated() => $pb.PbList<RoomCommonReply>();
  @$core.pragma('dart2js:noInline')
  static RoomCommonReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomCommonReply>(create);
  static RoomCommonReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get success => $_getSZ(0);
  @$pb.TagNumber(1)
  set success($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);
}

class RoomMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomMessage', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..e<RoomMessage_MsgType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: RoomMessage_MsgType.Game, valueOf: RoomMessage_MsgType.valueOf, enumValues: RoomMessage_MsgType.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  RoomMessage._() : super();
  factory RoomMessage({
    $core.String? roomId,
    RoomMessage_MsgType? type,
    $core.String? msg,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (type != null) {
      _result.type = type;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory RoomMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomMessage clone() => RoomMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomMessage copyWith(void Function(RoomMessage) updates) => super.copyWith((message) => updates(message as RoomMessage)) as RoomMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomMessage create() => RoomMessage._();
  RoomMessage createEmptyInstance() => create();
  static $pb.PbList<RoomMessage> createRepeated() => $pb.PbList<RoomMessage>();
  @$core.pragma('dart2js:noInline')
  static RoomMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomMessage>(create);
  static RoomMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  RoomMessage_MsgType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(RoomMessage_MsgType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

class ChatMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChatMessage', createEmptyInstance: create)
    ..aOM<RoomCommonRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'request', subBuilder: RoomCommonRequest.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  ChatMessage._() : super();
  factory ChatMessage({
    RoomCommonRequest? request,
    $core.String? message,
  }) {
    final _result = create();
    if (request != null) {
      _result.request = request;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory ChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatMessage clone() => ChatMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatMessage copyWith(void Function(ChatMessage) updates) => super.copyWith((message) => updates(message as ChatMessage)) as ChatMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatMessage create() => ChatMessage._();
  ChatMessage createEmptyInstance() => create();
  static $pb.PbList<ChatMessage> createRepeated() => $pb.PbList<ChatMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessage>(create);
  static ChatMessage? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCommonRequest get request => $_getN(0);
  @$pb.TagNumber(1)
  set request(RoomCommonRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequest() => clearField(1);
  @$pb.TagNumber(1)
  RoomCommonRequest ensureRequest() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
}

class PostGameDataRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostGameDataRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aOM<PostGameData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: PostGameData.create)
    ..hasRequiredFields = false
  ;

  PostGameDataRequest._() : super();
  factory PostGameDataRequest({
    $core.String? roomId,
    PostGameData? data,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory PostGameDataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostGameDataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostGameDataRequest clone() => PostGameDataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostGameDataRequest copyWith(void Function(PostGameDataRequest) updates) => super.copyWith((message) => updates(message as PostGameDataRequest)) as PostGameDataRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostGameDataRequest create() => PostGameDataRequest._();
  PostGameDataRequest createEmptyInstance() => create();
  static $pb.PbList<PostGameDataRequest> createRepeated() => $pb.PbList<PostGameDataRequest>();
  @$core.pragma('dart2js:noInline')
  static PostGameDataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostGameDataRequest>(create);
  static PostGameDataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  PostGameData get data => $_getN(1);
  @$pb.TagNumber(2)
  set data(PostGameData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  PostGameData ensureData() => $_ensure(1);
}

class PostGameData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostGameData', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameEnded')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerWinId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerLoseId')
    ..hasRequiredFields = false
  ;

  PostGameData._() : super();
  factory PostGameData({
    $core.String? gameId,
    $core.bool? gameEnded,
    $core.String? playerWinId,
    $core.String? playerLoseId,
  }) {
    final _result = create();
    if (gameId != null) {
      _result.gameId = gameId;
    }
    if (gameEnded != null) {
      _result.gameEnded = gameEnded;
    }
    if (playerWinId != null) {
      _result.playerWinId = playerWinId;
    }
    if (playerLoseId != null) {
      _result.playerLoseId = playerLoseId;
    }
    return _result;
  }
  factory PostGameData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostGameData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostGameData clone() => PostGameData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostGameData copyWith(void Function(PostGameData) updates) => super.copyWith((message) => updates(message as PostGameData)) as PostGameData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostGameData create() => PostGameData._();
  PostGameData createEmptyInstance() => create();
  static $pb.PbList<PostGameData> createRepeated() => $pb.PbList<PostGameData>();
  @$core.pragma('dart2js:noInline')
  static PostGameData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostGameData>(create);
  static PostGameData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get gameEnded => $_getBF(1);
  @$pb.TagNumber(2)
  set gameEnded($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGameEnded() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameEnded() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get playerWinId => $_getSZ(2);
  @$pb.TagNumber(3)
  set playerWinId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlayerWinId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayerWinId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get playerLoseId => $_getSZ(3);
  @$pb.TagNumber(4)
  set playerLoseId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlayerLoseId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlayerLoseId() => clearField(4);
}

