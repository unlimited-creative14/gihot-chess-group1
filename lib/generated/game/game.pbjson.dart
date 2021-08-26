///
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use moveChessRequestDescriptor instead')
const MoveChessRequest$json = const {
  '1': 'MoveChessRequest',
  '2': const [
    const {'1': 'game_id', '3': 1, '4': 1, '5': 9, '10': 'gameId'},
    const {'1': 'color', '3': 2, '4': 1, '5': 9, '10': 'color'},
    const {'1': 'source', '3': 3, '4': 1, '5': 9, '10': 'source'},
    const {'1': 'target', '3': 4, '4': 1, '5': 9, '10': 'target'},
  ],
};

/// Descriptor for `MoveChessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveChessRequestDescriptor = $convert.base64Decode('ChBNb3ZlQ2hlc3NSZXF1ZXN0EhcKB2dhbWVfaWQYASABKAlSBmdhbWVJZBIUCgVjb2xvchgCIAEoCVIFY29sb3ISFgoGc291cmNlGAMgASgJUgZzb3VyY2USFgoGdGFyZ2V0GAQgASgJUgZ0YXJnZXQ=');
@$core.Deprecated('Use gameCommonRequestDescriptor instead')
const GameCommonRequest$json = const {
  '1': 'GameCommonRequest',
  '2': const [
    const {'1': 'game_id', '3': 1, '4': 1, '5': 9, '10': 'gameId'},
    const {'1': 'player_id', '3': 2, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `GameCommonRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameCommonRequestDescriptor = $convert.base64Decode('ChFHYW1lQ29tbW9uUmVxdWVzdBIXCgdnYW1lX2lkGAEgASgJUgZnYW1lSWQSGwoJcGxheWVyX2lkGAIgASgJUghwbGF5ZXJJZA==');
@$core.Deprecated('Use gameCommonReplyDescriptor instead')
const GameCommonReply$json = const {
  '1': 'GameCommonReply',
  '2': const [
    const {'1': 'game_id', '3': 1, '4': 1, '5': 9, '10': 'gameId'},
    const {'1': 'is_error', '3': 2, '4': 1, '5': 8, '10': 'isError'},
    const {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `GameCommonReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameCommonReplyDescriptor = $convert.base64Decode('Cg9HYW1lQ29tbW9uUmVwbHkSFwoHZ2FtZV9pZBgBIAEoCVIGZ2FtZUlkEhkKCGlzX2Vycm9yGAIgASgIUgdpc0Vycm9yEhAKA21zZxgDIAEoCVIDbXNn');
@$core.Deprecated('Use newGameRequestDescriptor instead')
const NewGameRequest$json = const {
  '1': 'NewGameRequest',
  '2': const [
    const {'1': 'player_id', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `NewGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newGameRequestDescriptor = $convert.base64Decode('Cg5OZXdHYW1lUmVxdWVzdBIbCglwbGF5ZXJfaWQYASABKAlSCHBsYXllcklk');