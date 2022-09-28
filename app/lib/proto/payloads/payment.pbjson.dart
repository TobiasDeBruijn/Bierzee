///
//  Generated code. Do not modify.
//  source: payloads/payment.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use postPayRequestDescriptor instead')
const PostPayRequest$json = const {
  '1': 'PostPayRequest',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 1, '10': 'amount'},
  ],
};

/// Descriptor for `PostPayRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postPayRequestDescriptor = $convert.base64Decode('Cg5Qb3N0UGF5UmVxdWVzdBIWCgZhbW91bnQYASABKAFSBmFtb3VudA==');
@$core.Deprecated('Use getListPaymentsResponseDescriptor instead')
const GetListPaymentsResponse$json = const {
  '1': 'GetListPaymentsResponse',
  '2': const [
    const {'1': 'payments', '3': 1, '4': 3, '5': 11, '6': '.bierzee.Payment', '10': 'payments'},
  ],
};

/// Descriptor for `GetListPaymentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getListPaymentsResponseDescriptor = $convert.base64Decode('ChdHZXRMaXN0UGF5bWVudHNSZXNwb25zZRIsCghwYXltZW50cxgBIAMoCzIQLmJpZXJ6ZWUuUGF5bWVudFIIcGF5bWVudHM=');
@$core.Deprecated('Use getBalanceResponseDescriptor instead')
const GetBalanceResponse$json = const {
  '1': 'GetBalanceResponse',
  '2': const [
    const {'1': 'amountPaid', '3': 1, '4': 1, '5': 1, '10': 'amountPaid'},
    const {'1': 'beersDrunk', '3': 2, '4': 1, '5': 3, '10': 'beersDrunk'},
    const {'1': 'balance', '3': 3, '4': 1, '5': 1, '10': 'balance'},
    const {'1': 'beersLeft', '3': 4, '4': 1, '5': 3, '10': 'beersLeft'},
  ],
};

/// Descriptor for `GetBalanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBalanceResponseDescriptor = $convert.base64Decode('ChJHZXRCYWxhbmNlUmVzcG9uc2USHgoKYW1vdW50UGFpZBgBIAEoAVIKYW1vdW50UGFpZBIeCgpiZWVyc0RydW5rGAIgASgDUgpiZWVyc0RydW5rEhgKB2JhbGFuY2UYAyABKAFSB2JhbGFuY2USHAoJYmVlcnNMZWZ0GAQgASgDUgliZWVyc0xlZnQ=');
