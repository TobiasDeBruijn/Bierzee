///
//  Generated code. Do not modify.
//  source: payloads/auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use postLoginRequestDescriptor instead')
const PostLoginRequest$json = const {
  '1': 'PostLoginRequest',
  '2': const [
    const {'1': 'userLoginId', '3': 1, '4': 1, '5': 9, '10': 'userLoginId'},
    const {'1': 'organizationCode', '3': 2, '4': 1, '5': 9, '10': 'organizationCode'},
    const {'1': 'organizationPassword', '3': 3, '4': 1, '5': 9, '10': 'organizationPassword'},
  ],
};

/// Descriptor for `PostLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postLoginRequestDescriptor = $convert.base64Decode('ChBQb3N0TG9naW5SZXF1ZXN0EiAKC3VzZXJMb2dpbklkGAEgASgJUgt1c2VyTG9naW5JZBIqChBvcmdhbml6YXRpb25Db2RlGAIgASgJUhBvcmdhbml6YXRpb25Db2RlEjIKFG9yZ2FuaXphdGlvblBhc3N3b3JkGAMgASgJUhRvcmdhbml6YXRpb25QYXNzd29yZA==');
@$core.Deprecated('Use postLoginResponseDescriptor instead')
const PostLoginResponse$json = const {
  '1': 'PostLoginResponse',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.bierzee.User', '10': 'user'},
    const {'1': 'organization', '3': 2, '4': 1, '5': 11, '6': '.bierzee.Organization', '10': 'organization'},
    const {'1': 'session', '3': 3, '4': 1, '5': 11, '6': '.bierzee.Session', '10': 'session'},
    const {'1': 'isAdmin', '3': 4, '4': 1, '5': 8, '10': 'isAdmin'},
  ],
};

/// Descriptor for `PostLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postLoginResponseDescriptor = $convert.base64Decode('ChFQb3N0TG9naW5SZXNwb25zZRIhCgR1c2VyGAEgASgLMg0uYmllcnplZS5Vc2VyUgR1c2VyEjkKDG9yZ2FuaXphdGlvbhgCIAEoCzIVLmJpZXJ6ZWUuT3JnYW5pemF0aW9uUgxvcmdhbml6YXRpb24SKgoHc2Vzc2lvbhgDIAEoCzIQLmJpZXJ6ZWUuU2Vzc2lvblIHc2Vzc2lvbhIYCgdpc0FkbWluGAQgASgIUgdpc0FkbWlu');
@$core.Deprecated('Use getSessionResponseDescriptor instead')
const GetSessionResponse$json = const {
  '1': 'GetSessionResponse',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.bierzee.User', '10': 'user'},
    const {'1': 'organization', '3': 2, '4': 1, '5': 11, '6': '.bierzee.Organization', '10': 'organization'},
    const {'1': 'session', '3': 3, '4': 1, '5': 11, '6': '.bierzee.Session', '10': 'session'},
    const {'1': 'isAdmin', '3': 4, '4': 1, '5': 8, '10': 'isAdmin'},
  ],
};

/// Descriptor for `GetSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSessionResponseDescriptor = $convert.base64Decode('ChJHZXRTZXNzaW9uUmVzcG9uc2USIQoEdXNlchgBIAEoCzINLmJpZXJ6ZWUuVXNlclIEdXNlchI5Cgxvcmdhbml6YXRpb24YAiABKAsyFS5iaWVyemVlLk9yZ2FuaXphdGlvblIMb3JnYW5pemF0aW9uEioKB3Nlc3Npb24YAyABKAsyEC5iaWVyemVlLlNlc3Npb25SB3Nlc3Npb24SGAoHaXNBZG1pbhgEIAEoCFIHaXNBZG1pbg==');
