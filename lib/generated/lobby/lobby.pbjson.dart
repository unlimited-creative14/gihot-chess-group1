///
//  Generated code. Do not modify.
//  source: lobby.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use lobbyCommonMessageDescriptor instead')
const LobbyCommonMessage$json = const {
  '1': 'LobbyCommonMessage',
  '2': const [
    const {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `LobbyCommonMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lobbyCommonMessageDescriptor = $convert.base64Decode('ChJMb2JieUNvbW1vbk1lc3NhZ2USGwoJcGxheWVyX2lkGAEgASgJUghwbGF5ZXJJZA==');
@$core.Deprecated('Use playerObjectDescriptor instead')
const PlayerObject$json = const {
  '1': 'PlayerObject',
  '2': const [
    const {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'disp_name', '3': 2, '4': 1, '5': 9, '10': 'dispName'},
    const {'1': 'online', '3': 3, '4': 1, '5': 8, '10': 'online'},
  ],
};

/// Descriptor for `PlayerObject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerObjectDescriptor = $convert.base64Decode('CgxQbGF5ZXJPYmplY3QSGwoJcGxheWVyX2lkGAEgASgJUghwbGF5ZXJJZBIbCglkaXNwX25hbWUYAiABKAlSCGRpc3BOYW1lEhYKBm9ubGluZRgDIAEoCFIGb25saW5l');
@$core.Deprecated('Use friendListDescriptor instead')
const FriendList$json = const {
  '1': 'FriendList',
  '2': const [
    const {'1': 'friend_list', '3': 1, '4': 3, '5': 11, '6': '.PlayerObject', '10': 'friendList'},
  ],
};

/// Descriptor for `FriendList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendListDescriptor = $convert.base64Decode('CgpGcmllbmRMaXN0Ei4KC2ZyaWVuZF9saXN0GAEgAygLMg0uUGxheWVyT2JqZWN0UgpmcmllbmRMaXN0');
@$core.Deprecated('Use friendRequestDescriptor instead')
const FriendRequest$json = const {
  '1': 'FriendRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'player_id', '3': 2, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'player_id2', '3': 3, '4': 1, '5': 9, '10': 'playerId2'},
  ],
};

/// Descriptor for `FriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendRequestDescriptor = $convert.base64Decode('Cg1GcmllbmRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBIbCglwbGF5ZXJfaWQYAiABKAlSCHBsYXllcklkEh0KCnBsYXllcl9pZDIYAyABKAlSCXBsYXllcklkMg==');
@$core.Deprecated('Use lobbyChatMessageDescriptor instead')
const LobbyChatMessage$json = const {
  '1': 'LobbyChatMessage',
  '2': const [
    const {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'recv_player_id', '3': 2, '4': 1, '5': 9, '10': 'recvPlayerId'},
    const {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `LobbyChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lobbyChatMessageDescriptor = $convert.base64Decode('ChBMb2JieUNoYXRNZXNzYWdlEhsKCXBsYXllcl9pZBgBIAEoCVIIcGxheWVySWQSJAoOcmVjdl9wbGF5ZXJfaWQYAiABKAlSDHJlY3ZQbGF5ZXJJZBIQCgNtc2cYAyABKAlSA21zZw==');
@$core.Deprecated('Use lobbyCommonReplyDescriptor instead')
const LobbyCommonReply$json = const {
  '1': 'LobbyCommonReply',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.LobbyCommonReply.MsgType', '10': 'type'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
  '4': const [LobbyCommonReply_MsgType$json],
};

@$core.Deprecated('Use lobbyCommonReplyDescriptor instead')
const LobbyCommonReply_MsgType$json = const {
  '1': 'MsgType',
  '2': const [
    const {'1': 'System', '2': 0},
    const {'1': 'Friend', '2': 1},
    const {'1': 'World', '2': 2},
    const {'1': 'Error', '2': 3},
  ],
};

/// Descriptor for `LobbyCommonReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lobbyCommonReplyDescriptor = $convert.base64Decode('ChBMb2JieUNvbW1vblJlcGx5Ei0KBHR5cGUYASABKA4yGS5Mb2JieUNvbW1vblJlcGx5Lk1zZ1R5cGVSBHR5cGUSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZSI3CgdNc2dUeXBlEgoKBlN5c3RlbRAAEgoKBkZyaWVuZBABEgkKBVdvcmxkEAISCQoFRXJyb3IQAw==');
