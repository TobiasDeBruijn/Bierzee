///
//  Generated code. Do not modify.
//  source: payloads/auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../entities/user.pb.dart' as $0;
import '../entities/organization.pb.dart' as $1;
import '../entities/auth.pb.dart' as $2;

class PostLoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostLoginRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userLoginId', protoName: 'userLoginId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'organizationCode', protoName: 'organizationCode')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'organizationPassword', protoName: 'organizationPassword')
    ..hasRequiredFields = false
  ;

  PostLoginRequest._() : super();
  factory PostLoginRequest({
    $core.String? userLoginId,
    $core.String? organizationCode,
    $core.String? organizationPassword,
  }) {
    final _result = create();
    if (userLoginId != null) {
      _result.userLoginId = userLoginId;
    }
    if (organizationCode != null) {
      _result.organizationCode = organizationCode;
    }
    if (organizationPassword != null) {
      _result.organizationPassword = organizationPassword;
    }
    return _result;
  }
  factory PostLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostLoginRequest clone() => PostLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostLoginRequest copyWith(void Function(PostLoginRequest) updates) => super.copyWith((message) => updates(message as PostLoginRequest)) as PostLoginRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostLoginRequest create() => PostLoginRequest._();
  PostLoginRequest createEmptyInstance() => create();
  static $pb.PbList<PostLoginRequest> createRepeated() => $pb.PbList<PostLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static PostLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostLoginRequest>(create);
  static PostLoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userLoginId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userLoginId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserLoginId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserLoginId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get organizationCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set organizationCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrganizationCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrganizationCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get organizationPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set organizationPassword($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrganizationPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrganizationPassword() => clearField(3);
}

class PostLoginResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostLoginResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOM<$0.User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: $0.User.create)
    ..aOM<$1.Organization>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'organization', subBuilder: $1.Organization.create)
    ..aOM<$2.Session>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', subBuilder: $2.Session.create)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isAdmin', protoName: 'isAdmin')
    ..hasRequiredFields = false
  ;

  PostLoginResponse._() : super();
  factory PostLoginResponse({
    $0.User? user,
    $1.Organization? organization,
    $2.Session? session,
    $core.bool? isAdmin,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (organization != null) {
      _result.organization = organization;
    }
    if (session != null) {
      _result.session = session;
    }
    if (isAdmin != null) {
      _result.isAdmin = isAdmin;
    }
    return _result;
  }
  factory PostLoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostLoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostLoginResponse clone() => PostLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostLoginResponse copyWith(void Function(PostLoginResponse) updates) => super.copyWith((message) => updates(message as PostLoginResponse)) as PostLoginResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostLoginResponse create() => PostLoginResponse._();
  PostLoginResponse createEmptyInstance() => create();
  static $pb.PbList<PostLoginResponse> createRepeated() => $pb.PbList<PostLoginResponse>();
  @$core.pragma('dart2js:noInline')
  static PostLoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostLoginResponse>(create);
  static PostLoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Organization get organization => $_getN(1);
  @$pb.TagNumber(2)
  set organization($1.Organization v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrganization() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrganization() => clearField(2);
  @$pb.TagNumber(2)
  $1.Organization ensureOrganization() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Session get session => $_getN(2);
  @$pb.TagNumber(3)
  set session($2.Session v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(2);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);
  @$pb.TagNumber(3)
  $2.Session ensureSession() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get isAdmin => $_getBF(3);
  @$pb.TagNumber(4)
  set isAdmin($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsAdmin() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsAdmin() => clearField(4);
}

class GetSessionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSessionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOM<$0.User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: $0.User.create)
    ..aOM<$1.Organization>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'organization', subBuilder: $1.Organization.create)
    ..aOM<$2.Session>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', subBuilder: $2.Session.create)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isAdmin', protoName: 'isAdmin')
    ..hasRequiredFields = false
  ;

  GetSessionResponse._() : super();
  factory GetSessionResponse({
    $0.User? user,
    $1.Organization? organization,
    $2.Session? session,
    $core.bool? isAdmin,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (organization != null) {
      _result.organization = organization;
    }
    if (session != null) {
      _result.session = session;
    }
    if (isAdmin != null) {
      _result.isAdmin = isAdmin;
    }
    return _result;
  }
  factory GetSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSessionResponse clone() => GetSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSessionResponse copyWith(void Function(GetSessionResponse) updates) => super.copyWith((message) => updates(message as GetSessionResponse)) as GetSessionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSessionResponse create() => GetSessionResponse._();
  GetSessionResponse createEmptyInstance() => create();
  static $pb.PbList<GetSessionResponse> createRepeated() => $pb.PbList<GetSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSessionResponse>(create);
  static GetSessionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Organization get organization => $_getN(1);
  @$pb.TagNumber(2)
  set organization($1.Organization v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrganization() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrganization() => clearField(2);
  @$pb.TagNumber(2)
  $1.Organization ensureOrganization() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Session get session => $_getN(2);
  @$pb.TagNumber(3)
  set session($2.Session v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSession() => $_has(2);
  @$pb.TagNumber(3)
  void clearSession() => clearField(3);
  @$pb.TagNumber(3)
  $2.Session ensureSession() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get isAdmin => $_getBF(3);
  @$pb.TagNumber(4)
  set isAdmin($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsAdmin() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsAdmin() => clearField(4);
}

