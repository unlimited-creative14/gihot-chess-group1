///
//  Generated code. Do not modify.
//  source: room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use roomListReplyDescriptor instead')
const RoomListReply$json = const {
  '1': 'RoomListReply',
  '2': const [
    const {'1': 'rooms', '3': 2, '4': 3, '5': 11, '6': '.RoomInfoReply', '10': 'rooms'},
  ],
};

/// Descriptor for `RoomListReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomListReplyDescriptor = $convert.base64Decode('Cg1Sb29tTGlzdFJlcGx5EiQKBXJvb21zGAIgAygLMg4uUm9vbUluZm9SZXBseVIFcm9vbXM=');
@$core.Deprecated('Use roomInfoRequestDescriptor instead')
const RoomInfoRequest$json = const {
  '1': 'RoomInfoRequest',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `RoomInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomInfoRequestDescriptor = $convert.base64Decode('Cg9Sb29tSW5mb1JlcXVlc3QSFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlk');
@$core.Deprecated('Use roomInfoReplyDescriptor instead')
const RoomInfoReply$json = const {
  '1': 'RoomInfoReply',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'creator_id', '3': 2, '4': 1, '5': 9, '10': 'creatorId'},
    const {'1': 'player_ids', '3': 3, '4': 3, '5': 9, '10': 'playerIds'},
    const {'1': 'started', '3': 4, '4': 1, '5': 8, '10': 'started'},
    const {'1': 'ended', '3': 5, '4': 1, '5': 8, '10': 'ended'},
    const {'1': 'bet_amount', '3': 6, '4': 1, '5': 5, '10': 'betAmount'},
  ],
};

/// Descriptor for `RoomInfoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomInfoReplyDescriptor = $convert.base64Decode('Cg1Sb29tSW5mb1JlcGx5EhcKB3Jvb21faWQYASABKAlSBnJvb21JZBIdCgpjcmVhdG9yX2lkGAIgASgJUgljcmVhdG9ySWQSHQoKcGxheWVyX2lkcxgDIAMoCVIJcGxheWVySWRzEhgKB3N0YXJ0ZWQYBCABKAhSB3N0YXJ0ZWQSFAoFZW5kZWQYBSABKAhSBWVuZGVkEh0KCmJldF9hbW91bnQYBiABKAVSCWJldEFtb3VudA==');
@$core.Deprecated('Use roomCommonRequestDescriptor instead')
const RoomCommonRequest$json = const {
  '1': 'RoomCommonRequest',
  '2': const [
    const {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `RoomCommonRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomCommonRequestDescriptor = $convert.base64Decode('ChFSb29tQ29tbW9uUmVxdWVzdBIbCglwbGF5ZXJfaWQYASABKAlSCHBsYXllcklkEhcKB3Jvb21faWQYAiABKAlSBnJvb21JZA==');
@$core.Deprecated('Use roomCommonReplyDescriptor instead')
const RoomCommonReply$json = const {
  '1': 'RoomCommonReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 9, '10': 'success'},
    const {'1': 'room_id', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `RoomCommonReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomCommonReplyDescriptor = $convert.base64Decode('Cg9Sb29tQ29tbW9uUmVwbHkSGAoHc3VjY2VzcxgBIAEoCVIHc3VjY2VzcxIXCgdyb29tX2lkGAIgASgJUgZyb29tSWQ=');
@$core.Deprecated('Use roomMessageDescriptor instead')
const RoomMessage$json = const {
  '1': 'RoomMessage',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.RoomMessage.MsgType', '10': 'type'},
    const {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
  ],
  '4': const [RoomMessage_MsgType$json],
};

@$core.Deprecated('Use roomMessageDescriptor instead')
const RoomMessage_MsgType$json = const {
  '1': 'MsgType',
  '2': const [
    const {'1': 'Game', '2': 0},
    const {'1': 'Setting', '2': 1},
    const {'1': 'Chat', '2': 2},
    const {'1': 'Room', '2': 3},
    const {'1': 'Error', '2': 4},
  ],
};

/// Descriptor for `RoomMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomMessageDescriptor = $convert.base64Decode('CgtSb29tTWVzc2FnZRIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSKAoEdHlwZRgCIAEoDjIULlJvb21NZXNzYWdlLk1zZ1R5cGVSBHR5cGUSEAoDbXNnGAMgASgJUgNtc2ciPwoHTXNnVHlwZRIICgRHYW1lEAASCwoHU2V0dGluZxABEggKBENoYXQQAhIICgRSb29tEAMSCQoFRXJyb3IQBA==');
@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = const {
  '1': 'ChatMessage',
  '2': const [
    const {'1': 'request', '3': 1, '4': 1, '5': 11, '6': '.RoomCommonRequest', '10': 'request'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode('CgtDaGF0TWVzc2FnZRIsCgdyZXF1ZXN0GAEgASgLMhIuUm9vbUNvbW1vblJlcXVlc3RSB3JlcXVlc3QSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZQ==');
@$core.Deprecated('Use createRoomRequestDescriptor instead')
const CreateRoomRequest$json = const {
  '1': 'CreateRoomRequest',
  '2': const [
    const {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'bet_amount', '3': 2, '4': 1, '5': 5, '10': 'betAmount'},
  ],
};

/// Descriptor for `CreateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVSb29tUmVxdWVzdBIbCglwbGF5ZXJfaWQYASABKAlSCHBsYXllcklkEh0KCmJldF9hbW91bnQYAiABKAVSCWJldEFtb3VudA==');
@$core.Deprecated('Use postGameDataRequestDescriptor instead')
const PostGameDataRequest$json = const {
  '1': 'PostGameDataRequest',
  '2': const [
    const {'1': 'bet_value', '3': 1, '4': 1, '5': 5, '10': 'betValue'},
    const {'1': 'data', '3': 2, '4': 1, '5': 11, '6': '.PostGameData', '10': 'data'},
  ],
};

/// Descriptor for `PostGameDataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postGameDataRequestDescriptor = $convert.base64Decode('ChNQb3N0R2FtZURhdGFSZXF1ZXN0EhsKCWJldF92YWx1ZRgBIAEoBVIIYmV0VmFsdWUSIQoEZGF0YRgCIAEoCzINLlBvc3RHYW1lRGF0YVIEZGF0YQ==');
@$core.Deprecated('Use postGameDataDescriptor instead')
const PostGameData$json = const {
  '1': 'PostGameData',
  '2': const [
    const {'1': 'game_id', '3': 1, '4': 1, '5': 9, '10': 'gameId'},
    const {'1': 'game_ended', '3': 2, '4': 1, '5': 8, '10': 'gameEnded'},
    const {'1': 'player_win_id', '3': 3, '4': 1, '5': 9, '10': 'playerWinId'},
    const {'1': 'player_lose_id', '3': 4, '4': 1, '5': 9, '10': 'playerLoseId'},
  ],
};

/// Descriptor for `PostGameData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postGameDataDescriptor = $convert.base64Decode('CgxQb3N0R2FtZURhdGESFwoHZ2FtZV9pZBgBIAEoCVIGZ2FtZUlkEh0KCmdhbWVfZW5kZWQYAiABKAhSCWdhbWVFbmRlZBIiCg1wbGF5ZXJfd2luX2lkGAMgASgJUgtwbGF5ZXJXaW5JZBIkCg5wbGF5ZXJfbG9zZV9pZBgEIAEoCVIMcGxheWVyTG9zZUlk');