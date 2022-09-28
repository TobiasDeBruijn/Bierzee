///
//  Generated code. Do not modify.
//  source: payloads/organization.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../entities/organization.pb.dart' as $1;
import '../entities/user.pb.dart' as $0;
import '../entities/auth.pb.dart' as $2;
import '../entities/beer.pb.dart' as $3;

class GetOrganizationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetOrganizationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOM<$1.Organization>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'organization', subBuilder: $1.Organization.create)
    ..hasRequiredFields = false
  ;

  GetOrganizationResponse._() : super();
  factory GetOrganizationResponse({
    $1.Organization? organization,
  }) {
    final _result = create();
    if (organization != null) {
      _result.organization = organization;
    }
    return _result;
  }
  factory GetOrganizationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOrganizationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOrganizationResponse clone() => GetOrganizationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOrganizationResponse copyWith(void Function(GetOrganizationResponse) updates) => super.copyWith((message) => updates(message as GetOrganizationResponse)) as GetOrganizationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetOrganizationResponse create() => GetOrganizationResponse._();
  GetOrganizationResponse createEmptyInstance() => create();
  static $pb.PbList<GetOrganizationResponse> createRepeated() => $pb.PbList<GetOrganizationResponse>();
  @$core.pragma('dart2js:noInline')
  static GetOrganizationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOrganizationResponse>(create);
  static GetOrganizationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Organization get organization => $_getN(0);
  @$pb.TagNumber(1)
  set organization($1.Organization v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrganization() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrganization() => clearField(1);
  @$pb.TagNumber(1)
  $1.Organization ensureOrganization() => $_ensure(0);
}

class PostCreateOrganizationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostCreateOrganizationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'organizationName', protoName: 'organizationName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'organizationPassword', protoName: 'organizationPassword')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userName', protoName: 'userName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userLoginId', protoName: 'userLoginId')
    ..hasRequiredFields = false
  ;

  PostCreateOrganizationRequest._() : super();
  factory PostCreateOrganizationRequest({
    $core.String? organizationName,
    $core.String? organizationPassword,
    $core.String? userName,
    $core.String? userLoginId,
  }) {
    final _result = create();
    if (organizationName != null) {
      _result.organizationName = organizationName;
    }
    if (organizationPassword != null) {
      _result.organizationPassword = organizationPassword;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userLoginId != null) {
      _result.userLoginId = userLoginId;
    }
    return _result;
  }
  factory PostCreateOrganizationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostCreateOrganizationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostCreateOrganizationRequest clone() => PostCreateOrganizationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostCreateOrganizationRequest copyWith(void Function(PostCreateOrganizationRequest) updates) => super.copyWith((message) => updates(message as PostCreateOrganizationRequest)) as PostCreateOrganizationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostCreateOrganizationRequest create() => PostCreateOrganizationRequest._();
  PostCreateOrganizationRequest createEmptyInstance() => create();
  static $pb.PbList<PostCreateOrganizationRequest> createRepeated() => $pb.PbList<PostCreateOrganizationRequest>();
  @$core.pragma('dart2js:noInline')
  static PostCreateOrganizationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostCreateOrganizationRequest>(create);
  static PostCreateOrganizationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get organizationName => $_getSZ(0);
  @$pb.TagNumber(1)
  set organizationName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrganizationName() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrganizationName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get organizationPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set organizationPassword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrganizationPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrganizationPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userName => $_getSZ(2);
  @$pb.TagNumber(3)
  set userName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userLoginId => $_getSZ(3);
  @$pb.TagNumber(4)
  set userLoginId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserLoginId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserLoginId() => clearField(4);
}

class PostCreateOrganizationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostCreateOrganizationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOM<$1.Organization>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'organization', subBuilder: $1.Organization.create)
    ..aOM<$0.User>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: $0.User.create)
    ..aOM<$2.Session>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session', subBuilder: $2.Session.create)
    ..hasRequiredFields = false
  ;

  PostCreateOrganizationResponse._() : super();
  factory PostCreateOrganizationResponse({
    $1.Organization? organization,
    $0.User? user,
    $2.Session? session,
  }) {
    final _result = create();
    if (organization != null) {
      _result.organization = organization;
    }
    if (user != null) {
      _result.user = user;
    }
    if (session != null) {
      _result.session = session;
    }
    return _result;
  }
  factory PostCreateOrganizationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostCreateOrganizationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostCreateOrganizationResponse clone() => PostCreateOrganizationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostCreateOrganizationResponse copyWith(void Function(PostCreateOrganizationResponse) updates) => super.copyWith((message) => updates(message as PostCreateOrganizationResponse)) as PostCreateOrganizationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostCreateOrganizationResponse create() => PostCreateOrganizationResponse._();
  PostCreateOrganizationResponse createEmptyInstance() => create();
  static $pb.PbList<PostCreateOrganizationResponse> createRepeated() => $pb.PbList<PostCreateOrganizationResponse>();
  @$core.pragma('dart2js:noInline')
  static PostCreateOrganizationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostCreateOrganizationResponse>(create);
  static PostCreateOrganizationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Organization get organization => $_getN(0);
  @$pb.TagNumber(1)
  set organization($1.Organization v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrganization() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrganization() => clearField(1);
  @$pb.TagNumber(1)
  $1.Organization ensureOrganization() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.User get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($0.User v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  $0.User ensureUser() => $_ensure(1);

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
}

class PostCreateUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostCreateUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userName', protoName: 'userName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userLoginId', protoName: 'userLoginId')
    ..hasRequiredFields = false
  ;

  PostCreateUserRequest._() : super();
  factory PostCreateUserRequest({
    $core.String? userName,
    $core.String? userLoginId,
  }) {
    final _result = create();
    if (userName != null) {
      _result.userName = userName;
    }
    if (userLoginId != null) {
      _result.userLoginId = userLoginId;
    }
    return _result;
  }
  factory PostCreateUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostCreateUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostCreateUserRequest clone() => PostCreateUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostCreateUserRequest copyWith(void Function(PostCreateUserRequest) updates) => super.copyWith((message) => updates(message as PostCreateUserRequest)) as PostCreateUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostCreateUserRequest create() => PostCreateUserRequest._();
  PostCreateUserRequest createEmptyInstance() => create();
  static $pb.PbList<PostCreateUserRequest> createRepeated() => $pb.PbList<PostCreateUserRequest>();
  @$core.pragma('dart2js:noInline')
  static PostCreateUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostCreateUserRequest>(create);
  static PostCreateUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userLoginId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userLoginId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserLoginId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserLoginId() => clearField(2);
}

class PostCreateUserResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostCreateUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOM<$0.User>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: $0.User.create)
    ..hasRequiredFields = false
  ;

  PostCreateUserResponse._() : super();
  factory PostCreateUserResponse({
    $0.User? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory PostCreateUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostCreateUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostCreateUserResponse clone() => PostCreateUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostCreateUserResponse copyWith(void Function(PostCreateUserResponse) updates) => super.copyWith((message) => updates(message as PostCreateUserResponse)) as PostCreateUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostCreateUserResponse create() => PostCreateUserResponse._();
  PostCreateUserResponse createEmptyInstance() => create();
  static $pb.PbList<PostCreateUserResponse> createRepeated() => $pb.PbList<PostCreateUserResponse>();
  @$core.pragma('dart2js:noInline')
  static PostCreateUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostCreateUserResponse>(create);
  static PostCreateUserResponse? _defaultInstance;

  @$pb.TagNumber(2)
  $0.User get user => $_getN(0);
  @$pb.TagNumber(2)
  set user($0.User v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  $0.User ensureUser() => $_ensure(0);
}

class PostAdminRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostAdminRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isAdmin', protoName: 'isAdmin')
    ..hasRequiredFields = false
  ;

  PostAdminRequest._() : super();
  factory PostAdminRequest({
    $core.String? userId,
    $core.bool? isAdmin,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (isAdmin != null) {
      _result.isAdmin = isAdmin;
    }
    return _result;
  }
  factory PostAdminRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostAdminRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostAdminRequest clone() => PostAdminRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostAdminRequest copyWith(void Function(PostAdminRequest) updates) => super.copyWith((message) => updates(message as PostAdminRequest)) as PostAdminRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostAdminRequest create() => PostAdminRequest._();
  PostAdminRequest createEmptyInstance() => create();
  static $pb.PbList<PostAdminRequest> createRepeated() => $pb.PbList<PostAdminRequest>();
  @$core.pragma('dart2js:noInline')
  static PostAdminRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostAdminRequest>(create);
  static PostAdminRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAdmin => $_getBF(1);
  @$pb.TagNumber(2)
  set isAdmin($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAdmin() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAdmin() => clearField(2);
}

class PostDenyPaymentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostDenyPaymentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paymentId', protoName: 'paymentId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denied')
    ..hasRequiredFields = false
  ;

  PostDenyPaymentRequest._() : super();
  factory PostDenyPaymentRequest({
    $core.String? paymentId,
    $core.bool? denied,
  }) {
    final _result = create();
    if (paymentId != null) {
      _result.paymentId = paymentId;
    }
    if (denied != null) {
      _result.denied = denied;
    }
    return _result;
  }
  factory PostDenyPaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostDenyPaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostDenyPaymentRequest clone() => PostDenyPaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostDenyPaymentRequest copyWith(void Function(PostDenyPaymentRequest) updates) => super.copyWith((message) => updates(message as PostDenyPaymentRequest)) as PostDenyPaymentRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostDenyPaymentRequest create() => PostDenyPaymentRequest._();
  PostDenyPaymentRequest createEmptyInstance() => create();
  static $pb.PbList<PostDenyPaymentRequest> createRepeated() => $pb.PbList<PostDenyPaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static PostDenyPaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostDenyPaymentRequest>(create);
  static PostDenyPaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get paymentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set paymentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPaymentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get denied => $_getBF(1);
  @$pb.TagNumber(2)
  set denied($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDenied() => $_has(1);
  @$pb.TagNumber(2)
  void clearDenied() => clearField(2);
}

class GetListBeerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetListBeerResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..pc<$3.Beer>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beers', $pb.PbFieldType.PM, subBuilder: $3.Beer.create)
    ..hasRequiredFields = false
  ;

  GetListBeerResponse._() : super();
  factory GetListBeerResponse({
    $core.Iterable<$3.Beer>? beers,
  }) {
    final _result = create();
    if (beers != null) {
      _result.beers.addAll(beers);
    }
    return _result;
  }
  factory GetListBeerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListBeerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListBeerResponse clone() => GetListBeerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListBeerResponse copyWith(void Function(GetListBeerResponse) updates) => super.copyWith((message) => updates(message as GetListBeerResponse)) as GetListBeerResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetListBeerResponse create() => GetListBeerResponse._();
  GetListBeerResponse createEmptyInstance() => create();
  static $pb.PbList<GetListBeerResponse> createRepeated() => $pb.PbList<GetListBeerResponse>();
  @$core.pragma('dart2js:noInline')
  static GetListBeerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListBeerResponse>(create);
  static GetListBeerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.Beer> get beers => $_getList(0);
}

class GetBeerStockResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBeerStockResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..pc<$3.BeerStockEntry>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beerStockEntries', $pb.PbFieldType.PM, protoName: 'beerStockEntries', subBuilder: $3.BeerStockEntry.create)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bottlesLeft', protoName: 'bottlesLeft')
    ..hasRequiredFields = false
  ;

  GetBeerStockResponse._() : super();
  factory GetBeerStockResponse({
    $core.Iterable<$3.BeerStockEntry>? beerStockEntries,
    $fixnum.Int64? bottlesLeft,
  }) {
    final _result = create();
    if (beerStockEntries != null) {
      _result.beerStockEntries.addAll(beerStockEntries);
    }
    if (bottlesLeft != null) {
      _result.bottlesLeft = bottlesLeft;
    }
    return _result;
  }
  factory GetBeerStockResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBeerStockResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBeerStockResponse clone() => GetBeerStockResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBeerStockResponse copyWith(void Function(GetBeerStockResponse) updates) => super.copyWith((message) => updates(message as GetBeerStockResponse)) as GetBeerStockResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBeerStockResponse create() => GetBeerStockResponse._();
  GetBeerStockResponse createEmptyInstance() => create();
  static $pb.PbList<GetBeerStockResponse> createRepeated() => $pb.PbList<GetBeerStockResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBeerStockResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBeerStockResponse>(create);
  static GetBeerStockResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.BeerStockEntry> get beerStockEntries => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bottlesLeft => $_getI64(1);
  @$pb.TagNumber(2)
  set bottlesLeft($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBottlesLeft() => $_has(1);
  @$pb.TagNumber(2)
  void clearBottlesLeft() => clearField(2);
}

class PostPurchaseBeerStockRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostPurchaseBeerStockRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cratesPurchased', $pb.PbFieldType.OU3, protoName: 'cratesPurchased')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amountPaid', $pb.PbFieldType.OD, protoName: 'amountPaid')
    ..hasRequiredFields = false
  ;

  PostPurchaseBeerStockRequest._() : super();
  factory PostPurchaseBeerStockRequest({
    $core.int? cratesPurchased,
    $core.double? amountPaid,
  }) {
    final _result = create();
    if (cratesPurchased != null) {
      _result.cratesPurchased = cratesPurchased;
    }
    if (amountPaid != null) {
      _result.amountPaid = amountPaid;
    }
    return _result;
  }
  factory PostPurchaseBeerStockRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostPurchaseBeerStockRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostPurchaseBeerStockRequest clone() => PostPurchaseBeerStockRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostPurchaseBeerStockRequest copyWith(void Function(PostPurchaseBeerStockRequest) updates) => super.copyWith((message) => updates(message as PostPurchaseBeerStockRequest)) as PostPurchaseBeerStockRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostPurchaseBeerStockRequest create() => PostPurchaseBeerStockRequest._();
  PostPurchaseBeerStockRequest createEmptyInstance() => create();
  static $pb.PbList<PostPurchaseBeerStockRequest> createRepeated() => $pb.PbList<PostPurchaseBeerStockRequest>();
  @$core.pragma('dart2js:noInline')
  static PostPurchaseBeerStockRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostPurchaseBeerStockRequest>(create);
  static PostPurchaseBeerStockRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cratesPurchased => $_getIZ(0);
  @$pb.TagNumber(1)
  set cratesPurchased($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCratesPurchased() => $_has(0);
  @$pb.TagNumber(1)
  void clearCratesPurchased() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get amountPaid => $_getN(1);
  @$pb.TagNumber(2)
  set amountPaid($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmountPaid() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmountPaid() => clearField(2);
}

class PostSetBeerPriceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostSetBeerPriceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newPrice', $pb.PbFieldType.OD, protoName: 'newPrice')
    ..hasRequiredFields = false
  ;

  PostSetBeerPriceRequest._() : super();
  factory PostSetBeerPriceRequest({
    $core.double? newPrice,
  }) {
    final _result = create();
    if (newPrice != null) {
      _result.newPrice = newPrice;
    }
    return _result;
  }
  factory PostSetBeerPriceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostSetBeerPriceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostSetBeerPriceRequest clone() => PostSetBeerPriceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostSetBeerPriceRequest copyWith(void Function(PostSetBeerPriceRequest) updates) => super.copyWith((message) => updates(message as PostSetBeerPriceRequest)) as PostSetBeerPriceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostSetBeerPriceRequest create() => PostSetBeerPriceRequest._();
  PostSetBeerPriceRequest createEmptyInstance() => create();
  static $pb.PbList<PostSetBeerPriceRequest> createRepeated() => $pb.PbList<PostSetBeerPriceRequest>();
  @$core.pragma('dart2js:noInline')
  static PostSetBeerPriceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostSetBeerPriceRequest>(create);
  static PostSetBeerPriceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get newPrice => $_getN(0);
  @$pb.TagNumber(1)
  set newPrice($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNewPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewPrice() => clearField(1);
}

class UserWithBalance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserWithBalance', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOM<$0.User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: $0.User.create)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'balance', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  UserWithBalance._() : super();
  factory UserWithBalance({
    $0.User? user,
    $core.double? balance,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (balance != null) {
      _result.balance = balance;
    }
    return _result;
  }
  factory UserWithBalance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserWithBalance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserWithBalance clone() => UserWithBalance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserWithBalance copyWith(void Function(UserWithBalance) updates) => super.copyWith((message) => updates(message as UserWithBalance)) as UserWithBalance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserWithBalance create() => UserWithBalance._();
  UserWithBalance createEmptyInstance() => create();
  static $pb.PbList<UserWithBalance> createRepeated() => $pb.PbList<UserWithBalance>();
  @$core.pragma('dart2js:noInline')
  static UserWithBalance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserWithBalance>(create);
  static UserWithBalance? _defaultInstance;

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
  $core.double get balance => $_getN(1);
  @$pb.TagNumber(2)
  set balance($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearBalance() => clearField(2);
}

class GetListUserResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetListUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..pc<UserWithBalance>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'users', $pb.PbFieldType.PM, subBuilder: UserWithBalance.create)
    ..hasRequiredFields = false
  ;

  GetListUserResponse._() : super();
  factory GetListUserResponse({
    $core.Iterable<UserWithBalance>? users,
  }) {
    final _result = create();
    if (users != null) {
      _result.users.addAll(users);
    }
    return _result;
  }
  factory GetListUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetListUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetListUserResponse clone() => GetListUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetListUserResponse copyWith(void Function(GetListUserResponse) updates) => super.copyWith((message) => updates(message as GetListUserResponse)) as GetListUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetListUserResponse create() => GetListUserResponse._();
  GetListUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetListUserResponse> createRepeated() => $pb.PbList<GetListUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetListUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetListUserResponse>(create);
  static GetListUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserWithBalance> get users => $_getList(0);
}

