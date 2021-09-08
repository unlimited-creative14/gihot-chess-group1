///
//  Generated code. Do not modify.
//  source: user_info.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
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
    const {'1': 'gameCurrency', '3': 3, '4': 1, '5': 5, '10': 'gameCurrency'},
    const {'1': 'friendList_id', '3': 4, '4': 3, '5': 9, '10': 'friendListId'},
    const {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `UserInfoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoReplyDescriptor = $convert.base64Decode('Cg1Vc2VySW5mb1JlcGx5EhgKB3N1Y2Nlc3MYASABKAlSB3N1Y2Nlc3MSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1lEiIKDGdhbWVDdXJyZW5jeRgDIAEoBVIMZ2FtZUN1cnJlbmN5EiMKDWZyaWVuZExpc3RfaWQYBCADKAlSDGZyaWVuZExpc3RJZBIWCgZzdGF0dXMYBSABKAlSBnN0YXR1cw==');
