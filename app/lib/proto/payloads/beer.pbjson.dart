///
//  Generated code. Do not modify.
//  source: payloads/beer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use postDrinkRequestDescriptor instead')
const PostDrinkRequest$json = const {
  '1': 'PostDrinkRequest',
  '2': const [
    const {'1': 'beersDrunk', '3': 2, '4': 1, '5': 5, '10': 'beersDrunk'},
  ],
};

/// Descriptor for `PostDrinkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDrinkRequestDescriptor = $convert.base64Decode('ChBQb3N0RHJpbmtSZXF1ZXN0Eh4KCmJlZXJzRHJ1bmsYAiABKAVSCmJlZXJzRHJ1bms=');
@$core.Deprecated('Use getDrunkResponseDescriptor instead')
const GetDrunkResponse$json = const {
  '1': 'GetDrunkResponse',
  '2': const [
    const {'1': 'beers', '3': 1, '4': 3, '5': 11, '6': '.bierzee.Beer', '10': 'beers'},
  ],
};

/// Descriptor for `GetDrunkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDrunkResponseDescriptor = $convert.base64Decode('ChBHZXREcnVua1Jlc3BvbnNlEiMKBWJlZXJzGAEgAygLMg0uYmllcnplZS5CZWVyUgViZWVycw==');
@$core.Deprecated('Use getBeerPriceResponseDescriptor instead')
const GetBeerPriceResponse$json = const {
  '1': 'GetBeerPriceResponse',
  '2': const [
    const {'1': 'lastUpdated', '3': 1, '4': 1, '5': 3, '10': 'lastUpdated'},
    const {'1': 'price', '3': 2, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'lastChangedBy', '3': 3, '4': 1, '5': 11, '6': '.bierzee.User', '10': 'lastChangedBy'},
  ],
};

/// Descriptor for `GetBeerPriceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBeerPriceResponseDescriptor = $convert.base64Decode('ChRHZXRCZWVyUHJpY2VSZXNwb25zZRIgCgtsYXN0VXBkYXRlZBgBIAEoA1ILbGFzdFVwZGF0ZWQSFAoFcHJpY2UYAiABKAFSBXByaWNlEjMKDWxhc3RDaGFuZ2VkQnkYAyABKAsyDS5iaWVyemVlLlVzZXJSDWxhc3RDaGFuZ2VkQnk=');
