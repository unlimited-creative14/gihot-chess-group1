///
//  Generated code. Do not modify.
//  source: room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RoomMessage_MsgType extends $pb.ProtobufEnum {
  static const RoomMessage_MsgType Game = RoomMessage_MsgType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Game');
  static const RoomMessage_MsgType Setting = RoomMessage_MsgType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Setting');
  static const RoomMessage_MsgType Chat = RoomMessage_MsgType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Chat');
  static const RoomMessage_MsgType Room = RoomMessage_MsgType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Room');
  static const RoomMessage_MsgType Error = RoomMessage_MsgType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Error');

  static const $core.List<RoomMessage_MsgType> values = <RoomMessage_MsgType> [
    Game,
    Setting,
    Chat,
    Room,
    Error,
  ];

  static final $core.Map<$core.int, RoomMessage_MsgType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RoomMessage_MsgType? valueOf($core.int value) => _byValue[value];

  const RoomMessage_MsgType._($core.int v, $core.String n) : super(v, n);
}

