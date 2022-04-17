///
//  Generated code. Do not modify.
//  source: entities/beer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

class Beer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Beer', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOM<$0.User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consumedBy', protoName: 'consumedBy', subBuilder: $0.User.create)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consumedAt', protoName: 'consumedAt')
    ..hasRequiredFields = false
  ;

  Beer._() : super();
  factory Beer({
    $0.User? consumedBy,
    $fixnum.Int64? consumedAt,
  }) {
    final _result = create();
    if (consumedBy != null) {
      _result.consumedBy = consumedBy;
    }
    if (consumedAt != null) {
      _result.consumedAt = consumedAt;
    }
    return _result;
  }
  factory Beer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Beer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Beer clone() => Beer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Beer copyWith(void Function(Beer) updates) => super.copyWith((message) => updates(message as Beer)) as Beer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Beer create() => Beer._();
  Beer createEmptyInstance() => create();
  static $pb.PbList<Beer> createRepeated() => $pb.PbList<Beer>();
  @$core.pragma('dart2js:noInline')
  static Beer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Beer>(create);
  static Beer? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get consumedBy => $_getN(0);
  @$pb.TagNumber(1)
  set consumedBy($0.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConsumedBy() => $_has(0);
  @$pb.TagNumber(1)
  void clearConsumedBy() => clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureConsumedBy() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get consumedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set consumedAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasConsumedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearConsumedAt() => clearField(2);
}

class BeerStockEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BeerStockEntry', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cratesAquired', $pb.PbFieldType.OU3, protoName: 'cratesAquired')
    ..aOM<$0.User>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'purchasedBy', protoName: 'purchasedBy', subBuilder: $0.User.create)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'purchasedAt', protoName: 'purchasedAt')
    ..hasRequiredFields = false
  ;

  BeerStockEntry._() : super();
  factory BeerStockEntry({
    $core.int? cratesAquired,
    $0.User? purchasedBy,
    $fixnum.Int64? purchasedAt,
  }) {
    final _result = create();
    if (cratesAquired != null) {
      _result.cratesAquired = cratesAquired;
    }
    if (purchasedBy != null) {
      _result.purchasedBy = purchasedBy;
    }
    if (purchasedAt != null) {
      _result.purchasedAt = purchasedAt;
    }
    return _result;
  }
  factory BeerStockEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BeerStockEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BeerStockEntry clone() => BeerStockEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BeerStockEntry copyWith(void Function(BeerStockEntry) updates) => super.copyWith((message) => updates(message as BeerStockEntry)) as BeerStockEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BeerStockEntry create() => BeerStockEntry._();
  BeerStockEntry createEmptyInstance() => create();
  static $pb.PbList<BeerStockEntry> createRepeated() => $pb.PbList<BeerStockEntry>();
  @$core.pragma('dart2js:noInline')
  static BeerStockEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BeerStockEntry>(create);
  static BeerStockEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cratesAquired => $_getIZ(0);
  @$pb.TagNumber(1)
  set cratesAquired($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCratesAquired() => $_has(0);
  @$pb.TagNumber(1)
  void clearCratesAquired() => clearField(1);

  @$pb.TagNumber(2)
  $0.User get purchasedBy => $_getN(1);
  @$pb.TagNumber(2)
  set purchasedBy($0.User v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPurchasedBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearPurchasedBy() => clearField(2);
  @$pb.TagNumber(2)
  $0.User ensurePurchasedBy() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get purchasedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set purchasedAt($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPurchasedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearPurchasedAt() => clearField(3);
}

