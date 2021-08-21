///
//  Generated code. Do not modify.
//  source: roomServices.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
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
