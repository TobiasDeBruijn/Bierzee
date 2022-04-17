///
//  Generated code. Do not modify.
//  source: entities/beer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use beerDescriptor instead')
const Beer$json = const {
  '1': 'Beer',
  '2': const [
    const {'1': 'consumedBy', '3': 1, '4': 1, '5': 11, '6': '.bierzee.User', '10': 'consumedBy'},
    const {'1': 'consumedAt', '3': 2, '4': 1, '5': 3, '10': 'consumedAt'},
  ],
};

/// Descriptor for `Beer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List beerDescriptor = $convert.base64Decode('CgRCZWVyEi0KCmNvbnN1bWVkQnkYASABKAsyDS5iaWVyemVlLlVzZXJSCmNvbnN1bWVkQnkSHgoKY29uc3VtZWRBdBgCIAEoA1IKY29uc3VtZWRBdA==');
@$core.Deprecated('Use beerStockEntryDescriptor instead')
const BeerStockEntry$json = const {
  '1': 'BeerStockEntry',
  '2': const [
    const {'1': 'cratesAquired', '3': 1, '4': 1, '5': 13, '10': 'cratesAquired'},
    const {'1': 'purchasedBy', '3': 2, '4': 1, '5': 11, '6': '.bierzee.User', '10': 'purchasedBy'},
    const {'1': 'purchasedAt', '3': 3, '4': 1, '5': 3, '10': 'purchasedAt'},
  ],
};

/// Descriptor for `BeerStockEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List beerStockEntryDescriptor = $convert.base64Decode('Cg5CZWVyU3RvY2tFbnRyeRIkCg1jcmF0ZXNBcXVpcmVkGAEgASgNUg1jcmF0ZXNBcXVpcmVkEi8KC3B1cmNoYXNlZEJ5GAIgASgLMg0uYmllcnplZS5Vc2VyUgtwdXJjaGFzZWRCeRIgCgtwdXJjaGFzZWRBdBgDIAEoA1ILcHVyY2hhc2VkQXQ=');
