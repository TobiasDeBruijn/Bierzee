///
//  Generated code. Do not modify.
//  source: payloads/payment.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../entities/payment.pb.dart' as $4;

class PostPayRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostPayRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  PostPayRequest._() : super();
  factory PostPayRequest({
    $core.double? amount,
  }) {
    final _result = create();
    if (amount != null) {
      _result.amount = amount;
    }
    return _result;
  }
  factory PostPayRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostPayRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostPayRequest clone() => PostPayRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostPayRequest copyWith(void Function(PostPayRequest) updates) => super.copyWith((message) => updates(message as PostPayRequest)) as PostPayRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostPayRequest create() => PostPayRequest._();
  PostPayRequest createEmptyInstance() => create();
  static $pb.PbList<PostPayRequest> createRepeated() => $pb.PbList<PostPayRequest>();
  @$core.pragma('dart2js:noInline')
  static PostPayRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostPayRequest>(create);
  static PostPayRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get amount => $_getN(0);
  @$pb.TagNumber(1)
  set amount($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);
}

class GetListPaymentsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetListPaymentsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..pc<$4.Payment>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payments', $pb.PbFieldType.PM, subBuilder: $4.Payment.create)
    ..hasRequiredFields = false
  ;

  GetListPaymentsResponse._() : super();
  factory GetListPaymentsResponse({
    $core.Iterable<$4.Payment>? payments,
  }) {
    final _result = create();
    if (payments != null) {
      _result.payments.addAll(payments);
    }
    return _result;
  }
  factory GetListPaymentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListPaymentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListPaymentsResponse clone() => GetListPaymentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListPaymentsResponse copyWith(void Function(GetListPaymentsResponse) updates) => super.copyWith((message) => updates(message as GetListPaymentsResponse)) as GetListPaymentsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetListPaymentsResponse create() => GetListPaymentsResponse._();
  GetListPaymentsResponse createEmptyInstance() => create();
  static $pb.PbList<GetListPaymentsResponse> createRepeated() => $pb.PbList<GetListPaymentsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetListPaymentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListPaymentsResponse>(create);
  static GetListPaymentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$4.Payment> get payments => $_getList(0);
}

class GetBalanceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBalanceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amountPaid', $pb.PbFieldType.OD, protoName: 'amountPaid')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beersDrunk', protoName: 'beersDrunk')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'balance', $pb.PbFieldType.OD)
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beersLeft', protoName: 'beersLeft')
    ..hasRequiredFields = false
  ;

  GetBalanceResponse._() : super();
  factory GetBalanceResponse({
    $core.double? amountPaid,
    $fixnum.Int64? beersDrunk,
    $core.double? balance,
    $fixnum.Int64? beersLeft,
  }) {
    final _result = create();
    if (amountPaid != null) {
      _result.amountPaid = amountPaid;
    }
    if (beersDrunk != null) {
      _result.beersDrunk = beersDrunk;
    }
    if (balance != null) {
      _result.balance = balance;
    }
    if (beersLeft != null) {
      _result.beersLeft = beersLeft;
    }
    return _result;
  }
  factory GetBalanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBalanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBalanceResponse clone() => GetBalanceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBalanceResponse copyWith(void Function(GetBalanceResponse) updates) => super.copyWith((message) => updates(message as GetBalanceResponse)) as GetBalanceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBalanceResponse create() => GetBalanceResponse._();
  GetBalanceResponse createEmptyInstance() => create();
  static $pb.PbList<GetBalanceResponse> createRepeated() => $pb.PbList<GetBalanceResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBalanceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBalanceResponse>(create);
  static GetBalanceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get amountPaid => $_getN(0);
  @$pb.TagNumber(1)
  set amountPaid($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmountPaid() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmountPaid() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get beersDrunk => $_getI64(1);
  @$pb.TagNumber(2)
  set beersDrunk($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBeersDrunk() => $_has(1);
  @$pb.TagNumber(2)
  void clearBeersDrunk() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get balance => $_getN(2);
  @$pb.TagNumber(3)
  set balance($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearBalance() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get beersLeft => $_getI64(3);
  @$pb.TagNumber(4)
  set beersLeft($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBeersLeft() => $_has(3);
  @$pb.TagNumber(4)
  void clearBeersLeft() => clearField(4);
}

