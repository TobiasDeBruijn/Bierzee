///
//  Generated code. Do not modify.
//  source: payloads/notifications.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use notificationDescriptor instead')
const Notification$json = const {
  '1': 'Notification',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.bierzee.User', '10': 'user'},
    const {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'created_at', '3': 4, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `Notification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationDescriptor = $convert.base64Decode('CgxOb3RpZmljYXRpb24SDgoCaWQYASABKAlSAmlkEiEKBHVzZXIYAiABKAsyDS5iaWVyemVlLlVzZXJSBHVzZXISEgoEdGV4dBgDIAEoCVIEdGV4dBIdCgpjcmVhdGVkX2F0GAQgASgDUgljcmVhdGVkQXQ=');
@$core.Deprecated('Use getListNotificationResponseDescriptor instead')
const GetListNotificationResponse$json = const {
  '1': 'GetListNotificationResponse',
  '2': const [
    const {'1': 'notifications', '3': 1, '4': 3, '5': 11, '6': '.bierzee.Notification', '10': 'notifications'},
  ],
};

/// Descriptor for `GetListNotificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getListNotificationResponseDescriptor = $convert.base64Decode('ChtHZXRMaXN0Tm90aWZpY2F0aW9uUmVzcG9uc2USOwoNbm90aWZpY2F0aW9ucxgBIAMoCzIVLmJpZXJ6ZWUuTm90aWZpY2F0aW9uUg1ub3RpZmljYXRpb25z');
@$core.Deprecated('Use postCompleteNotificationRequestDescriptor instead')
const PostCompleteNotificationRequest$json = const {
  '1': 'PostCompleteNotificationRequest',
  '2': const [
    const {'1': 'notificationId', '3': 1, '4': 1, '5': 9, '10': 'notificationId'},
    const {'1': 'completed', '3': 2, '4': 1, '5': 8, '10': 'completed'},
  ],
};

/// Descriptor for `PostCompleteNotificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postCompleteNotificationRequestDescriptor = $convert.base64Decode('Ch9Qb3N0Q29tcGxldGVOb3RpZmljYXRpb25SZXF1ZXN0EiYKDm5vdGlmaWNhdGlvbklkGAEgASgJUg5ub3RpZmljYXRpb25JZBIcCgljb21wbGV0ZWQYAiABKAhSCWNvbXBsZXRlZA==');
