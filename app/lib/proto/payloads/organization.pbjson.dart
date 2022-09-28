///
//  Generated code. Do not modify.
//  source: payloads/organization.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getOrganizationResponseDescriptor instead')
const GetOrganizationResponse$json = const {
  '1': 'GetOrganizationResponse',
  '2': const [
    const {'1': 'organization', '3': 1, '4': 1, '5': 11, '6': '.bierzee.Organization', '10': 'organization'},
  ],
};

/// Descriptor for `GetOrganizationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrganizationResponseDescriptor = $convert.base64Decode('ChdHZXRPcmdhbml6YXRpb25SZXNwb25zZRI5Cgxvcmdhbml6YXRpb24YASABKAsyFS5iaWVyemVlLk9yZ2FuaXphdGlvblIMb3JnYW5pemF0aW9u');
@$core.Deprecated('Use postCreateOrganizationRequestDescriptor instead')
const PostCreateOrganizationRequest$json = const {
  '1': 'PostCreateOrganizationRequest',
  '2': const [
    const {'1': 'organizationName', '3': 1, '4': 1, '5': 9, '10': 'organizationName'},
    const {'1': 'organizationPassword', '3': 2, '4': 1, '5': 9, '10': 'organizationPassword'},
    const {'1': 'userName', '3': 3, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'userLoginId', '3': 4, '4': 1, '5': 9, '10': 'userLoginId'},
  ],
};

/// Descriptor for `PostCreateOrganizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postCreateOrganizationRequestDescriptor = $convert.base64Decode('Ch1Qb3N0Q3JlYXRlT3JnYW5pemF0aW9uUmVxdWVzdBIqChBvcmdhbml6YXRpb25OYW1lGAEgASgJUhBvcmdhbml6YXRpb25OYW1lEjIKFG9yZ2FuaXphdGlvblBhc3N3b3JkGAIgASgJUhRvcmdhbml6YXRpb25QYXNzd29yZBIaCgh1c2VyTmFtZRgDIAEoCVIIdXNlck5hbWUSIAoLdXNlckxvZ2luSWQYBCABKAlSC3VzZXJMb2dpbklk');
@$core.Deprecated('Use postCreateOrganizationResponseDescriptor instead')
const PostCreateOrganizationResponse$json = const {
  '1': 'PostCreateOrganizationResponse',
  '2': const [
    const {'1': 'organization', '3': 1, '4': 1, '5': 11, '6': '.bierzee.Organization', '10': 'organization'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.bierzee.User', '10': 'user'},
    const {'1': 'session', '3': 3, '4': 1, '5': 11, '6': '.bierzee.Session', '10': 'session'},
  ],
};

/// Descriptor for `PostCreateOrganizationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postCreateOrganizationResponseDescriptor = $convert.base64Decode('Ch5Qb3N0Q3JlYXRlT3JnYW5pemF0aW9uUmVzcG9uc2USOQoMb3JnYW5pemF0aW9uGAEgASgLMhUuYmllcnplZS5Pcmdhbml6YXRpb25SDG9yZ2FuaXphdGlvbhIhCgR1c2VyGAIgASgLMg0uYmllcnplZS5Vc2VyUgR1c2VyEioKB3Nlc3Npb24YAyABKAsyEC5iaWVyemVlLlNlc3Npb25SB3Nlc3Npb24=');
@$core.Deprecated('Use postCreateUserRequestDescriptor instead')
const PostCreateUserRequest$json = const {
  '1': 'PostCreateUserRequest',
  '2': const [
    const {'1': 'userName', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'userLoginId', '3': 2, '4': 1, '5': 9, '10': 'userLoginId'},
  ],
};

/// Descriptor for `PostCreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postCreateUserRequestDescriptor = $convert.base64Decode('ChVQb3N0Q3JlYXRlVXNlclJlcXVlc3QSGgoIdXNlck5hbWUYASABKAlSCHVzZXJOYW1lEiAKC3VzZXJMb2dpbklkGAIgASgJUgt1c2VyTG9naW5JZA==');
@$core.Deprecated('Use postCreateUserResponseDescriptor instead')
const PostCreateUserResponse$json = const {
  '1': 'PostCreateUserResponse',
  '2': const [
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.bierzee.User', '10': 'user'},
  ],
};

/// Descriptor for `PostCreateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postCreateUserResponseDescriptor = $convert.base64Decode('ChZQb3N0Q3JlYXRlVXNlclJlc3BvbnNlEiEKBHVzZXIYAiABKAsyDS5iaWVyemVlLlVzZXJSBHVzZXI=');
@$core.Deprecated('Use postAdminRequestDescriptor instead')
const PostAdminRequest$json = const {
  '1': 'PostAdminRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'isAdmin', '3': 2, '4': 1, '5': 8, '10': 'isAdmin'},
  ],
};

/// Descriptor for `PostAdminRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postAdminRequestDescriptor = $convert.base64Decode('ChBQb3N0QWRtaW5SZXF1ZXN0EhYKBnVzZXJJZBgBIAEoCVIGdXNlcklkEhgKB2lzQWRtaW4YAiABKAhSB2lzQWRtaW4=');
@$core.Deprecated('Use postDenyPaymentRequestDescriptor instead')
const PostDenyPaymentRequest$json = const {
  '1': 'PostDenyPaymentRequest',
  '2': const [
    const {'1': 'paymentId', '3': 1, '4': 1, '5': 9, '10': 'paymentId'},
    const {'1': 'denied', '3': 2, '4': 1, '5': 8, '10': 'denied'},
  ],
};

/// Descriptor for `PostDenyPaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDenyPaymentRequestDescriptor = $convert.base64Decode('ChZQb3N0RGVueVBheW1lbnRSZXF1ZXN0EhwKCXBheW1lbnRJZBgBIAEoCVIJcGF5bWVudElkEhYKBmRlbmllZBgCIAEoCFIGZGVuaWVk');
@$core.Deprecated('Use getListBeerResponseDescriptor instead')
const GetListBeerResponse$json = const {
  '1': 'GetListBeerResponse',
  '2': const [
    const {'1': 'beers', '3': 1, '4': 3, '5': 11, '6': '.bierzee.Beer', '10': 'beers'},
  ],
};

/// Descriptor for `GetListBeerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getListBeerResponseDescriptor = $convert.base64Decode('ChNHZXRMaXN0QmVlclJlc3BvbnNlEiMKBWJlZXJzGAEgAygLMg0uYmllcnplZS5CZWVyUgViZWVycw==');
@$core.Deprecated('Use getBeerStockResponseDescriptor instead')
const GetBeerStockResponse$json = const {
  '1': 'GetBeerStockResponse',
  '2': const [
    const {'1': 'beerStockEntries', '3': 1, '4': 3, '5': 11, '6': '.bierzee.BeerStockEntry', '10': 'beerStockEntries'},
    const {'1': 'bottlesLeft', '3': 2, '4': 1, '5': 3, '10': 'bottlesLeft'},
  ],
};

/// Descriptor for `GetBeerStockResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBeerStockResponseDescriptor = $convert.base64Decode('ChRHZXRCZWVyU3RvY2tSZXNwb25zZRJDChBiZWVyU3RvY2tFbnRyaWVzGAEgAygLMhcuYmllcnplZS5CZWVyU3RvY2tFbnRyeVIQYmVlclN0b2NrRW50cmllcxIgCgtib3R0bGVzTGVmdBgCIAEoA1ILYm90dGxlc0xlZnQ=');
@$core.Deprecated('Use postPurchaseBeerStockRequestDescriptor instead')
const PostPurchaseBeerStockRequest$json = const {
  '1': 'PostPurchaseBeerStockRequest',
  '2': const [
    const {'1': 'cratesPurchased', '3': 1, '4': 1, '5': 13, '10': 'cratesPurchased'},
    const {'1': 'amountPaid', '3': 2, '4': 1, '5': 1, '10': 'amountPaid'},
  ],
};

/// Descriptor for `PostPurchaseBeerStockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postPurchaseBeerStockRequestDescriptor = $convert.base64Decode('ChxQb3N0UHVyY2hhc2VCZWVyU3RvY2tSZXF1ZXN0EigKD2NyYXRlc1B1cmNoYXNlZBgBIAEoDVIPY3JhdGVzUHVyY2hhc2VkEh4KCmFtb3VudFBhaWQYAiABKAFSCmFtb3VudFBhaWQ=');
@$core.Deprecated('Use postSetBeerPriceRequestDescriptor instead')
const PostSetBeerPriceRequest$json = const {
  '1': 'PostSetBeerPriceRequest',
  '2': const [
    const {'1': 'newPrice', '3': 1, '4': 1, '5': 1, '10': 'newPrice'},
  ],
};

/// Descriptor for `PostSetBeerPriceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postSetBeerPriceRequestDescriptor = $convert.base64Decode('ChdQb3N0U2V0QmVlclByaWNlUmVxdWVzdBIaCghuZXdQcmljZRgBIAEoAVIIbmV3UHJpY2U=');
@$core.Deprecated('Use userWithBalanceDescriptor instead')
const UserWithBalance$json = const {
  '1': 'UserWithBalance',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.bierzee.User', '10': 'user'},
    const {'1': 'balance', '3': 2, '4': 1, '5': 1, '10': 'balance'},
  ],
};

/// Descriptor for `UserWithBalance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userWithBalanceDescriptor = $convert.base64Decode('Cg9Vc2VyV2l0aEJhbGFuY2USIQoEdXNlchgBIAEoCzINLmJpZXJ6ZWUuVXNlclIEdXNlchIYCgdiYWxhbmNlGAIgASgBUgdiYWxhbmNl');
@$core.Deprecated('Use getListUserResponseDescriptor instead')
const GetListUserResponse$json = const {
  '1': 'GetListUserResponse',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.bierzee.UserWithBalance', '10': 'users'},
  ],
};

/// Descriptor for `GetListUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getListUserResponseDescriptor = $convert.base64Decode('ChNHZXRMaXN0VXNlclJlc3BvbnNlEi4KBXVzZXJzGAEgAygLMhguYmllcnplZS5Vc2VyV2l0aEJhbGFuY2VSBXVzZXJz');
