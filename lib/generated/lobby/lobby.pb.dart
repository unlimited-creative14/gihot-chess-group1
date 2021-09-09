///
//  Generated code. Do not modify.
//  source: lobby.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'lobby.pbenum.dart';

export 'lobby.pbenum.dart';

class LobbyCommonMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LobbyCommonMessage', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId')
    ..hasRequiredFields = false
  ;

  LobbyCommonMessage._() : super();
  factory LobbyCommonMessage({
    $core.String? playerId,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    return _result;
  }
  factory LobbyCommonMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LobbyCommonMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LobbyCommonMessage clone() => LobbyCommonMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LobbyCommonMessage copyWith(void Function(LobbyCommonMessage) updates) => super.copyWith((message) => updates(message as LobbyCommonMessage)) as LobbyCommonMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LobbyCommonMessage create() => LobbyCommonMessage._();
  LobbyCommonMessage createEmptyInstance() => create();
  static $pb.PbList<LobbyCommonMessage> createRepeated() => $pb.PbList<LobbyCommonMessage>();
  @$core.pragma('dart2js:noInline')
  static LobbyCommonMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LobbyCommonMessage>(create);
  static LobbyCommonMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

class PlayerObject extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlayerObject', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dispName')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'online')
    ..hasRequiredFields = false
  ;

  PlayerObject._() : super();
  factory PlayerObject({
    $core.String? playerId,
    $core.String? dispName,
    $core.bool? online,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (dispName != null) {
      _result.dispName = dispName;
    }
    if (online != null) {
      _result.online = online;
    }
    return _result;
  }
  factory PlayerObject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerObject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerObject clone() => PlayerObject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerObject copyWith(void Function(PlayerObject) updates) => super.copyWith((message) => updates(message as PlayerObject)) as PlayerObject; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayerObject create() => PlayerObject._();
  PlayerObject createEmptyInstance() => create();
  static $pb.PbList<PlayerObject> createRepeated() => $pb.PbList<PlayerObject>();
  @$core.pragma('dart2js:noInline')
  static PlayerObject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerObject>(create);
  static PlayerObject? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get dispName => $_getSZ(1);
  @$pb.TagNumber(2)
  set dispName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDispName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDispName() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get online => $_getBF(2);
  @$pb.TagNumber(3)
  set online($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOnline() => $_has(2);
  @$pb.TagNumber(3)
  void clearOnline() => clearField(3);
}

class FriendList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FriendList', createEmptyInstance: create)
    ..pc<PlayerObject>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friendList', $pb.PbFieldType.PM, subBuilder: PlayerObject.create)
    ..hasRequiredFields = false
  ;

  FriendList._() : super();
  factory FriendList({
    $core.Iterable<PlayerObject>? friendList,
  }) {
    final _result = create();
    if (friendList != null) {
      _result.friendList.addAll(friendList);
    }
    return _result;
  }
  factory FriendList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FriendList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FriendList clone() => FriendList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FriendList copyWith(void Function(FriendList) updates) => super.copyWith((message) => updates(message as FriendList)) as FriendList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendList create() => FriendList._();
  FriendList createEmptyInstance() => create();
  static $pb.PbList<FriendList> createRepeated() => $pb.PbList<FriendList>();
  @$core.pragma('dart2js:noInline')
  static FriendList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FriendList>(create);
  static FriendList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PlayerObject> get friendList => $_getList(0);
}

class FriendRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FriendRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId2')
    ..hasRequiredFields = false
  ;

  FriendRequest._() : super();
  factory FriendRequest({
    $core.String? id,
    $core.String? playerId,
    $core.String? playerId2,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (playerId2 != null) {
      _result.playerId2 = playerId2;
    }
    return _result;
  }
  factory FriendRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FriendRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FriendRequest clone() => FriendRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FriendRequest copyWith(void Function(FriendRequest) updates) => super.copyWith((message) => updates(message as FriendRequest)) as FriendRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendRequest create() => FriendRequest._();
  FriendRequest createEmptyInstance() => create();
  static $pb.PbList<FriendRequest> createRepeated() => $pb.PbList<FriendRequest>();
  @$core.pragma('dart2js:noInline')
  static FriendRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FriendRequest>(create);
  static FriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set playerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get playerId2 => $_getSZ(2);
  @$pb.TagNumber(3)
  set playerId2($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlayerId2() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayerId2() => clearField(3);
}

class LobbyChatMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LobbyChatMessage', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recvPlayerId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  LobbyChatMessage._() : super();
  factory LobbyChatMessage({
    $core.String? playerId,
    $core.String? recvPlayerId,
    $core.String? msg,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (recvPlayerId != null) {
      _result.recvPlayerId = recvPlayerId;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory LobbyChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LobbyChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LobbyChatMessage clone() => LobbyChatMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LobbyChatMessage copyWith(void Function(LobbyChatMessage) updates) => super.copyWith((message) => updates(message as LobbyChatMessage)) as LobbyChatMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LobbyChatMessage create() => LobbyChatMessage._();
  LobbyChatMessage createEmptyInstance() => create();
  static $pb.PbList<LobbyChatMessage> createRepeated() => $pb.PbList<LobbyChatMessage>();
  @$core.pragma('dart2js:noInline')
  static LobbyChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LobbyChatMessage>(create);
  static LobbyChatMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get recvPlayerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set recvPlayerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRecvPlayerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecvPlayerId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

class LobbyCommonReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LobbyCommonReply', createEmptyInstance: create)
    ..e<LobbyCommonReply_MsgType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: LobbyCommonReply_MsgType.System, valueOf: LobbyCommonReply_MsgType.valueOf, enumValues: LobbyCommonReply_MsgType.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  LobbyCommonReply._() : super();
  factory LobbyCommonReply({
    LobbyCommonReply_MsgType? type,
    $core.String? message,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory LobbyCommonReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LobbyCommonReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LobbyCommonReply clone() => LobbyCommonReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LobbyCommonReply copyWith(void Function(LobbyCommonReply) updates) => super.copyWith((message) => updates(message as LobbyCommonReply)) as LobbyCommonReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LobbyCommonReply create() => LobbyCommonReply._();
  LobbyCommonReply createEmptyInstance() => create();
  static $pb.PbList<LobbyCommonReply> createRepeated() => $pb.PbList<LobbyCommonReply>();
  @$core.pragma('dart2js:noInline')
  static LobbyCommonReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LobbyCommonReply>(create);
  static LobbyCommonReply? _defaultInstance;

  @$pb.TagNumber(1)
  LobbyCommonReply_MsgType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(LobbyCommonReply_MsgType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

