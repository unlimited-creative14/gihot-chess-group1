///
//  Generated code. Do not modify.
//  source: user_info.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use newUserRequestDescriptor instead')
const newUserRequest$json = const {
  '1': 'newUserRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'display_name', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'photo_url', '3': 3, '4': 1, '5': 9, '10': 'photoUrl'},
  ],
};

/// Descriptor for `newUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newUserRequestDescriptor = $convert.base64Decode('Cg5uZXdVc2VyUmVxdWVzdBIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSIQoMZGlzcGxheV9uYW1lGAIgASgJUgtkaXNwbGF5TmFtZRIbCglwaG90b191cmwYAyABKAlSCHBob3RvVXJs');
@$core.Deprecated('Use newUserReplyDescriptor instead')
const newUserReply$json = const {
  '1': 'newUserReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 9, '10': 'success'},
  ],
};

/// Descriptor for `newUserReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newUserReplyDescriptor = $convert.base64Decode('CgxuZXdVc2VyUmVwbHkSGAoHc3VjY2VzcxgBIAEoCVIHc3VjY2Vzcw==');
@$core.Deprecated('Use userInfoRequestDescriptor instead')
const UserInfoRequest$json = const {
  '1': 'UserInfoRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
  ],
};

/// Descriptor for `UserInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoRequestDescriptor = $convert.base64Decode('Cg9Vc2VySW5mb1JlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1l');
@$core.Deprecated('Use userInfoReplyDescriptor instead')
const UserInfoReply$json = const {
  '1': 'UserInfoReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 9, '10': 'success'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'gameCurrency', '3': 4, '4': 1, '5': 5, '10': 'gameCurrency'},
    const {'1': 'friendList_id', '3': 5, '4': 3, '5': 9, '10': 'friendListId'},
    const {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'photo_url', '3': 7, '4': 1, '5': 9, '10': 'photoUrl'},
  ],
};

/// Descriptor for `UserInfoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoReplyDescriptor = $convert.base64Decode('Cg1Vc2VySW5mb1JlcGx5EhgKB3N1Y2Nlc3MYASABKAlSB3N1Y2Nlc3MSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1lEiEKDGRpc3BsYXlfbmFtZRgDIAEoCVILZGlzcGxheU5hbWUSIgoMZ2FtZUN1cnJlbmN5GAQgASgFUgxnYW1lQ3VycmVuY3kSIwoNZnJpZW5kTGlzdF9pZBgFIAMoCVIMZnJpZW5kTGlzdElkEhYKBnN0YXR1cxgGIAEoCVIGc3RhdHVzEhsKCXBob3RvX3VybBgHIAEoCVIIcGhvdG9Vcmw=');
@$core.Deprecated('Use userExistDescriptor instead')
const UserExist$json = const {
  '1': 'UserExist',
  '2': const [
    const {'1': 'isExist', '3': 1, '4': 1, '5': 8, '10': 'isExist'},
  ],
};

/// Descriptor for `UserExist`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExistDescriptor = $convert.base64Decode('CglVc2VyRXhpc3QSGAoHaXNFeGlzdBgBIAEoCFIHaXNFeGlzdA==');
