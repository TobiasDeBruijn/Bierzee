///
//  Generated code. Do not modify.
//  source: entities/payment.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use paymentDescriptor instead')
const Payment$json = const {
  '1': 'Payment',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'amount', '3': 2, '4': 1, '5': 1, '10': 'amount'},
    const {'1': 'paidAt', '3': 3, '4': 1, '5': 3, '10': 'paidAt'},
    const {'1': 'user', '3': 4, '4': 1, '5': 11, '6': '.bierzee.User', '10': 'user'},
    const {'1': 'denied', '3': 5, '4': 1, '5': 8, '10': 'denied'},
    const {'1': 'deniedBy', '3': 6, '4': 1, '5': 11, '6': '.bierzee.User', '9': 0, '10': 'deniedBy', '17': true},
  ],
  '8': const [
    const {'1': '_deniedBy'},
  ],
};

/// Descriptor for `Payment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentDescriptor = $convert.base64Decode('CgdQYXltZW50Eg4KAmlkGAEgASgJUgJpZBIWCgZhbW91bnQYAiABKAFSBmFtb3VudBIWCgZwYWlkQXQYAyABKANSBnBhaWRBdBIhCgR1c2VyGAQgASgLMg0uYmllcnplZS5Vc2VyUgR1c2VyEhYKBmRlbmllZBgFIAEoCFIGZGVuaWVkEi4KCGRlbmllZEJ5GAYgASgLMg0uYmllcnplZS5Vc2VySABSCGRlbmllZEJ5iAEBQgsKCV9kZW5pZWRCeQ==');
