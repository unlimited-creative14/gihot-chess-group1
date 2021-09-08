///
//  Generated code. Do not modify.
//  source: user_info.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UserInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserInfoRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..hasRequiredFields = false
  ;

  UserInfoRequest._() : super();
  factory UserInfoRequest({
    $core.String? username,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    return _result;
  }
  factory UserInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfoRequest clone() => UserInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfoRequest copyWith(void Function(UserInfoRequest) updates) => super.copyWith((message) => updates(message as UserInfoRequest)) as UserInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfoRequest create() => UserInfoRequest._();
  UserInfoRequest createEmptyInstance() => create();
  static $pb.PbList<UserInfoRequest> createRepeated() => $pb.PbList<UserInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static UserInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfoRequest>(create);
  static UserInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);
}

class UserInfoReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserInfoReply', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameCurrency', $pb.PbFieldType.O3, protoName: 'gameCurrency')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friendListId', protoName: 'friendList_id')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  UserInfoReply._() : super();
  factory UserInfoReply({
    $core.String? success,
    $core.String? username,
    $core.int? gameCurrency,
    $core.Iterable<$core.String>? friendListId,
    $core.String? status,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (username != null) {
      _result.username = username;
    }
    if (gameCurrency != null) {
      _result.gameCurrency = gameCurrency;
    }
    if (friendListId != null) {
      _result.friendListId.addAll(friendListId);
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory UserInfoReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfoReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfoReply clone() => UserInfoReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfoReply copyWith(void Function(UserInfoReply) updates) => super.copyWith((message) => updates(message as UserInfoReply)) as UserInfoReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfoReply create() => UserInfoReply._();
  UserInfoReply createEmptyInstance() => create();
  static $pb.PbList<UserInfoReply> createRepeated() => $pb.PbList<UserInfoReply>();
  @$core.pragma('dart2js:noInline')
  static UserInfoReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfoReply>(create);
  static UserInfoReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get success => $_getSZ(0);
  @$pb.TagNumber(1)
  set success($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get gameCurrency => $_getIZ(2);
  @$pb.TagNumber(3)
  set gameCurrency($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGameCurrency() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameCurrency() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get friendListId => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);
}

