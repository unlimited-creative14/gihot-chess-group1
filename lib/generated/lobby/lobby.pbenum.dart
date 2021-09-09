///
//  Generated code. Do not modify.
//  source: lobby.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class LobbyCommonReply_MsgType extends $pb.ProtobufEnum {
  static const LobbyCommonReply_MsgType System = LobbyCommonReply_MsgType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'System');
  static const LobbyCommonReply_MsgType Friend = LobbyCommonReply_MsgType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Friend');
  static const LobbyCommonReply_MsgType World = LobbyCommonReply_MsgType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'World');
  static const LobbyCommonReply_MsgType Error = LobbyCommonReply_MsgType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Error');

  static const $core.List<LobbyCommonReply_MsgType> values = <LobbyCommonReply_MsgType> [
    System,
    Friend,
    World,
    Error,
  ];

  static final $core.Map<$core.int, LobbyCommonReply_MsgType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LobbyCommonReply_MsgType? valueOf($core.int value) => _byValue[value];

  const LobbyCommonReply_MsgType._($core.int v, $core.String n) : super(v, n);
}

