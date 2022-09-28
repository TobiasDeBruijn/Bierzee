///
//  Generated code. Do not modify.
//  source: payloads/beer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../entities/beer.pb.dart' as $3;
import '../entities/user.pb.dart' as $0;

class PostDrinkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostDrinkRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beersDrunk', $pb.PbFieldType.O3, protoName: 'beersDrunk')
    ..hasRequiredFields = false
  ;

  PostDrinkRequest._() : super();
  factory PostDrinkRequest({
    $core.int? beersDrunk,
  }) {
    final _result = create();
    if (beersDrunk != null) {
      _result.beersDrunk = beersDrunk;
    }
    return _result;
  }
  factory PostDrinkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostDrinkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostDrinkRequest clone() => PostDrinkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostDrinkRequest copyWith(void Function(PostDrinkRequest) updates) => super.copyWith((message) => updates(message as PostDrinkRequest)) as PostDrinkRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostDrinkRequest create() => PostDrinkRequest._();
  PostDrinkRequest createEmptyInstance() => create();
  static $pb.PbList<PostDrinkRequest> createRepeated() => $pb.PbList<PostDrinkRequest>();
  @$core.pragma('dart2js:noInline')
  static PostDrinkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostDrinkRequest>(create);
  static PostDrinkRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get beersDrunk => $_getIZ(0);
  @$pb.TagNumber(2)
  set beersDrunk($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasBeersDrunk() => $_has(0);
  @$pb.TagNumber(2)
  void clearBeersDrunk() => clearField(2);
}

class GetDrunkResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetDrunkResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..pc<$3.Beer>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beers', $pb.PbFieldType.PM, subBuilder: $3.Beer.create)
    ..hasRequiredFields = false
  ;

  GetDrunkResponse._() : super();
  factory GetDrunkResponse({
    $core.Iterable<$3.Beer>? beers,
  }) {
    final _result = create();
    if (beers != null) {
      _result.beers.addAll(beers);
    }
    return _result;
  }
  factory GetDrunkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDrunkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDrunkResponse clone() => GetDrunkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDrunkResponse copyWith(void Function(GetDrunkResponse) updates) => super.copyWith((message) => updates(message as GetDrunkResponse)) as GetDrunkResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDrunkResponse create() => GetDrunkResponse._();
  GetDrunkResponse createEmptyInstance() => create();
  static $pb.PbList<GetDrunkResponse> createRepeated() => $pb.PbList<GetDrunkResponse>();
  @$core.pragma('dart2js:noInline')
  static GetDrunkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDrunkResponse>(create);
  static GetDrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.Beer> get beers => $_getList(0);
}

class GetBeerPriceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBeerPriceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdated', protoName: 'lastUpdated')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..aOM<$0.User>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastChangedBy', protoName: 'lastChangedBy', subBuilder: $0.User.create)
    ..hasRequiredFields = false
  ;

  GetBeerPriceResponse._() : super();
  factory GetBeerPriceResponse({
    $fixnum.Int64? lastUpdated,
    $core.double? price,
    $0.User? lastChangedBy,
  }) {
    final _result = create();
    if (lastUpdated != null) {
      _result.lastUpdated = lastUpdated;
    }
    if (price != null) {
      _result.price = price;
    }
    if (lastChangedBy != null) {
      _result.lastChangedBy = lastChangedBy;
    }
    return _result;
  }
  factory GetBeerPriceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBeerPriceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBeerPriceResponse clone() => GetBeerPriceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBeerPriceResponse copyWith(void Function(GetBeerPriceResponse) updates) => super.copyWith((message) => updates(message as GetBeerPriceResponse)) as GetBeerPriceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBeerPriceResponse create() => GetBeerPriceResponse._();
  GetBeerPriceResponse createEmptyInstance() => create();
  static $pb.PbList<GetBeerPriceResponse> createRepeated() => $pb.PbList<GetBeerPriceResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBeerPriceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBeerPriceResponse>(create);
  static GetBeerPriceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get lastUpdated => $_getI64(0);
  @$pb.TagNumber(1)
  set lastUpdated($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastUpdated() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastUpdated() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get price => $_getN(1);
  @$pb.TagNumber(2)
  set price($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $0.User get lastChangedBy => $_getN(2);
  @$pb.TagNumber(3)
  set lastChangedBy($0.User v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChangedBy() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChangedBy() => clearField(3);
  @$pb.TagNumber(3)
  $0.User ensureLastChangedBy() => $_ensure(2);
}

