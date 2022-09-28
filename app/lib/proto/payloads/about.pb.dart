///
//  Generated code. Do not modify.
//  source: payloads/about.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetAboutResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAboutResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'versionMajor', $pb.PbFieldType.O3, protoName: 'versionMajor')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'versionMinor', $pb.PbFieldType.O3, protoName: 'versionMinor')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'versionPatch', $pb.PbFieldType.O3, protoName: 'versionPatch')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'repository')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'license')
    ..hasRequiredFields = false
  ;

  GetAboutResponse._() : super();
  factory GetAboutResponse({
    $core.String? version,
    $core.int? versionMajor,
    $core.int? versionMinor,
    $core.int? versionPatch,
    $core.String? authors,
    $core.String? repository,
    $core.String? license,
  }) {
    final _result = create();
    if (version != null) {
      _result.version = version;
    }
    if (versionMajor != null) {
      _result.versionMajor = versionMajor;
    }
    if (versionMinor != null) {
      _result.versionMinor = versionMinor;
    }
    if (versionPatch != null) {
      _result.versionPatch = versionPatch;
    }
    if (authors != null) {
      _result.authors = authors;
    }
    if (repository != null) {
      _result.repository = repository;
    }
    if (license != null) {
      _result.license = license;
    }
    return _result;
  }
  factory GetAboutResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAboutResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAboutResponse clone() => GetAboutResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAboutResponse copyWith(void Function(GetAboutResponse) updates) => super.copyWith((message) => updates(message as GetAboutResponse)) as GetAboutResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAboutResponse create() => GetAboutResponse._();
  GetAboutResponse createEmptyInstance() => create();
  static $pb.PbList<GetAboutResponse> createRepeated() => $pb.PbList<GetAboutResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAboutResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAboutResponse>(create);
  static GetAboutResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get versionMajor => $_getIZ(1);
  @$pb.TagNumber(2)
  set versionMajor($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersionMajor() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionMajor() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get versionMinor => $_getIZ(2);
  @$pb.TagNumber(3)
  set versionMinor($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersionMinor() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersionMinor() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get versionPatch => $_getIZ(3);
  @$pb.TagNumber(4)
  set versionPatch($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVersionPatch() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersionPatch() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get authors => $_getSZ(4);
  @$pb.TagNumber(5)
  set authors($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthors() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthors() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get repository => $_getSZ(5);
  @$pb.TagNumber(6)
  set repository($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRepository() => $_has(5);
  @$pb.TagNumber(6)
  void clearRepository() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get license => $_getSZ(6);
  @$pb.TagNumber(7)
  set license($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLicense() => $_has(6);
  @$pb.TagNumber(7)
  void clearLicense() => clearField(7);
}

