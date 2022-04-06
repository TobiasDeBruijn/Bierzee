///
//  Generated code. Do not modify.
//  source: items.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'employeeId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User({
    $core.String? employeeId,
    $core.String? name,
  }) {
    final _result = create();
    if (employeeId != null) {
      _result.employeeId = employeeId;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class LoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'employeeId', protoName: 'employeeId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  LoginRequest._() : super();
  factory LoginRequest({
    $core.String? employeeId,
    $core.String? password,
  }) {
    final _result = create();
    if (employeeId != null) {
      _result.employeeId = employeeId;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)) as LoginRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionId', protoName: 'sessionId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isAdmin', protoName: 'isAdmin')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  LoginResponse._() : super();
  factory LoginResponse({
    $core.String? sessionId,
    $core.bool? isAdmin,
    $core.String? name,
  }) {
    final _result = create();
    if (sessionId != null) {
      _result.sessionId = sessionId;
    }
    if (isAdmin != null) {
      _result.isAdmin = isAdmin;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory LoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginResponse clone() => LoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginResponse copyWith(void Function(LoginResponse) updates) => super.copyWith((message) => updates(message as LoginResponse)) as LoginResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  LoginResponse createEmptyInstance() => create();
  static $pb.PbList<LoginResponse> createRepeated() => $pb.PbList<LoginResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAdmin => $_getBF(1);
  @$pb.TagNumber(2)
  set isAdmin($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAdmin() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAdmin() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class DrinkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DrinkRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beersDrunk', $pb.PbFieldType.O3, protoName: 'beersDrunk')
    ..hasRequiredFields = false
  ;

  DrinkRequest._() : super();
  factory DrinkRequest({
    $core.int? beersDrunk,
  }) {
    final _result = create();
    if (beersDrunk != null) {
      _result.beersDrunk = beersDrunk;
    }
    return _result;
  }
  factory DrinkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DrinkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DrinkRequest clone() => DrinkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DrinkRequest copyWith(void Function(DrinkRequest) updates) => super.copyWith((message) => updates(message as DrinkRequest)) as DrinkRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DrinkRequest create() => DrinkRequest._();
  DrinkRequest createEmptyInstance() => create();
  static $pb.PbList<DrinkRequest> createRepeated() => $pb.PbList<DrinkRequest>();
  @$core.pragma('dart2js:noInline')
  static DrinkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DrinkRequest>(create);
  static DrinkRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get beersDrunk => $_getIZ(0);
  @$pb.TagNumber(2)
  set beersDrunk($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasBeersDrunk() => $_has(0);
  @$pb.TagNumber(2)
  void clearBeersDrunk() => clearField(2);
}

class DrunkResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DrunkResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..pc<Beer>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beers', $pb.PbFieldType.PM, subBuilder: Beer.create)
    ..hasRequiredFields = false
  ;

  DrunkResponse._() : super();
  factory DrunkResponse({
    $core.Iterable<Beer>? beers,
  }) {
    final _result = create();
    if (beers != null) {
      _result.beers.addAll(beers);
    }
    return _result;
  }
  factory DrunkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DrunkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DrunkResponse clone() => DrunkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DrunkResponse copyWith(void Function(DrunkResponse) updates) => super.copyWith((message) => updates(message as DrunkResponse)) as DrunkResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DrunkResponse create() => DrunkResponse._();
  DrunkResponse createEmptyInstance() => create();
  static $pb.PbList<DrunkResponse> createRepeated() => $pb.PbList<DrunkResponse>();
  @$core.pragma('dart2js:noInline')
  static DrunkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DrunkResponse>(create);
  static DrunkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Beer> get beers => $_getList(0);
}

class Beer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Beer', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'drunkAt')
    ..hasRequiredFields = false
  ;

  Beer._() : super();
  factory Beer({
    $fixnum.Int64? drunkAt,
  }) {
    final _result = create();
    if (drunkAt != null) {
      _result.drunkAt = drunkAt;
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
  $fixnum.Int64 get drunkAt => $_getI64(0);
  @$pb.TagNumber(1)
  set drunkAt($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDrunkAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearDrunkAt() => clearField(1);
}

class PayRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PayRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  PayRequest._() : super();
  factory PayRequest({
    $core.double? amount,
  }) {
    final _result = create();
    if (amount != null) {
      _result.amount = amount;
    }
    return _result;
  }
  factory PayRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PayRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PayRequest clone() => PayRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PayRequest copyWith(void Function(PayRequest) updates) => super.copyWith((message) => updates(message as PayRequest)) as PayRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PayRequest create() => PayRequest._();
  PayRequest createEmptyInstance() => create();
  static $pb.PbList<PayRequest> createRepeated() => $pb.PbList<PayRequest>();
  @$core.pragma('dart2js:noInline')
  static PayRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayRequest>(create);
  static PayRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get amount => $_getN(0);
  @$pb.TagNumber(1)
  set amount($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);
}

class BrokeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BrokeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..pc<Payment>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payments', $pb.PbFieldType.PM, subBuilder: Payment.create)
    ..hasRequiredFields = false
  ;

  BrokeResponse._() : super();
  factory BrokeResponse({
    $core.Iterable<Payment>? payments,
  }) {
    final _result = create();
    if (payments != null) {
      _result.payments.addAll(payments);
    }
    return _result;
  }
  factory BrokeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BrokeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BrokeResponse clone() => BrokeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BrokeResponse copyWith(void Function(BrokeResponse) updates) => super.copyWith((message) => updates(message as BrokeResponse)) as BrokeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BrokeResponse create() => BrokeResponse._();
  BrokeResponse createEmptyInstance() => create();
  static $pb.PbList<BrokeResponse> createRepeated() => $pb.PbList<BrokeResponse>();
  @$core.pragma('dart2js:noInline')
  static BrokeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BrokeResponse>(create);
  static BrokeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Payment> get payments => $_getList(0);
}

class Payment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Payment', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paidAt', protoName: 'paidAt')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amountPaid', $pb.PbFieldType.OD, protoName: 'amountPaid')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denied')
    ..aOM<User>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paidBy', protoName: 'paidBy', subBuilder: User.create)
    ..aOM<User>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deniedBy', protoName: 'deniedBy', subBuilder: User.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paymentId', protoName: 'paymentId')
    ..hasRequiredFields = false
  ;

  Payment._() : super();
  factory Payment({
    $fixnum.Int64? paidAt,
    $core.double? amountPaid,
    $core.bool? denied,
    User? paidBy,
    User? deniedBy,
    $core.String? paymentId,
  }) {
    final _result = create();
    if (paidAt != null) {
      _result.paidAt = paidAt;
    }
    if (amountPaid != null) {
      _result.amountPaid = amountPaid;
    }
    if (denied != null) {
      _result.denied = denied;
    }
    if (paidBy != null) {
      _result.paidBy = paidBy;
    }
    if (deniedBy != null) {
      _result.deniedBy = deniedBy;
    }
    if (paymentId != null) {
      _result.paymentId = paymentId;
    }
    return _result;
  }
  factory Payment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Payment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Payment clone() => Payment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Payment copyWith(void Function(Payment) updates) => super.copyWith((message) => updates(message as Payment)) as Payment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Payment create() => Payment._();
  Payment createEmptyInstance() => create();
  static $pb.PbList<Payment> createRepeated() => $pb.PbList<Payment>();
  @$core.pragma('dart2js:noInline')
  static Payment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Payment>(create);
  static Payment? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get paidAt => $_getI64(0);
  @$pb.TagNumber(1)
  set paidAt($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPaidAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaidAt() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get amountPaid => $_getN(1);
  @$pb.TagNumber(2)
  set amountPaid($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmountPaid() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmountPaid() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get denied => $_getBF(2);
  @$pb.TagNumber(3)
  set denied($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDenied() => $_has(2);
  @$pb.TagNumber(3)
  void clearDenied() => clearField(3);

  @$pb.TagNumber(4)
  User get paidBy => $_getN(3);
  @$pb.TagNumber(4)
  set paidBy(User v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPaidBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearPaidBy() => clearField(4);
  @$pb.TagNumber(4)
  User ensurePaidBy() => $_ensure(3);

  @$pb.TagNumber(5)
  User get deniedBy => $_getN(4);
  @$pb.TagNumber(5)
  set deniedBy(User v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeniedBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeniedBy() => clearField(5);
  @$pb.TagNumber(5)
  User ensureDeniedBy() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get paymentId => $_getSZ(5);
  @$pb.TagNumber(6)
  set paymentId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPaymentId() => $_has(5);
  @$pb.TagNumber(6)
  void clearPaymentId() => clearField(6);
}

class GetBeerPriceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBeerPriceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdated', protoName: 'lastUpdated')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastChangedById', protoName: 'lastChangedById')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastChangedByName', protoName: 'lastChangedByName')
    ..hasRequiredFields = false
  ;

  GetBeerPriceResponse._() : super();
  factory GetBeerPriceResponse({
    $fixnum.Int64? lastUpdated,
    $core.double? price,
    $core.String? lastChangedById,
    $core.String? lastChangedByName,
  }) {
    final _result = create();
    if (lastUpdated != null) {
      _result.lastUpdated = lastUpdated;
    }
    if (price != null) {
      _result.price = price;
    }
    if (lastChangedById != null) {
      _result.lastChangedById = lastChangedById;
    }
    if (lastChangedByName != null) {
      _result.lastChangedByName = lastChangedByName;
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
  $core.String get lastChangedById => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastChangedById($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChangedById() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChangedById() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastChangedByName => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastChangedByName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastChangedByName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastChangedByName() => clearField(4);
}

class SetBeerPriceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetBeerPriceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  SetBeerPriceRequest._() : super();
  factory SetBeerPriceRequest({
    $core.double? price,
  }) {
    final _result = create();
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory SetBeerPriceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetBeerPriceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetBeerPriceRequest clone() => SetBeerPriceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetBeerPriceRequest copyWith(void Function(SetBeerPriceRequest) updates) => super.copyWith((message) => updates(message as SetBeerPriceRequest)) as SetBeerPriceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetBeerPriceRequest create() => SetBeerPriceRequest._();
  SetBeerPriceRequest createEmptyInstance() => create();
  static $pb.PbList<SetBeerPriceRequest> createRepeated() => $pb.PbList<SetBeerPriceRequest>();
  @$core.pragma('dart2js:noInline')
  static SetBeerPriceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetBeerPriceRequest>(create);
  static SetBeerPriceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get price => $_getN(0);
  @$pb.TagNumber(1)
  set price($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrice() => clearField(1);
}

class BalanceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BalanceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amountPaid', $pb.PbFieldType.OD, protoName: 'amountPaid')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beersDrunk', protoName: 'beersDrunk')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'balance', $pb.PbFieldType.OD)
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'beersLeft', protoName: 'beersLeft')
    ..hasRequiredFields = false
  ;

  BalanceResponse._() : super();
  factory BalanceResponse({
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
  factory BalanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BalanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BalanceResponse clone() => BalanceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BalanceResponse copyWith(void Function(BalanceResponse) updates) => super.copyWith((message) => updates(message as BalanceResponse)) as BalanceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BalanceResponse create() => BalanceResponse._();
  BalanceResponse createEmptyInstance() => create();
  static $pb.PbList<BalanceResponse> createRepeated() => $pb.PbList<BalanceResponse>();
  @$core.pragma('dart2js:noInline')
  static BalanceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BalanceResponse>(create);
  static BalanceResponse? _defaultInstance;

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

class OwesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OwesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..pc<OwningUser>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owningUsers', $pb.PbFieldType.PM, protoName: 'owningUsers', subBuilder: OwningUser.create)
    ..hasRequiredFields = false
  ;

  OwesResponse._() : super();
  factory OwesResponse({
    $core.Iterable<OwningUser>? owningUsers,
  }) {
    final _result = create();
    if (owningUsers != null) {
      _result.owningUsers.addAll(owningUsers);
    }
    return _result;
  }
  factory OwesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OwesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OwesResponse clone() => OwesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OwesResponse copyWith(void Function(OwesResponse) updates) => super.copyWith((message) => updates(message as OwesResponse)) as OwesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OwesResponse create() => OwesResponse._();
  OwesResponse createEmptyInstance() => create();
  static $pb.PbList<OwesResponse> createRepeated() => $pb.PbList<OwesResponse>();
  @$core.pragma('dart2js:noInline')
  static OwesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OwesResponse>(create);
  static OwesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<OwningUser> get owningUsers => $_getList(0);
}

class OwningUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OwningUser', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'employeeId', protoName: 'employeeId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isAdmin', protoName: 'isAdmin')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amountOwed', $pb.PbFieldType.OD, protoName: 'amountOwed')
    ..hasRequiredFields = false
  ;

  OwningUser._() : super();
  factory OwningUser({
    $core.String? employeeId,
    $core.String? name,
    $core.bool? isAdmin,
    $core.double? amountOwed,
  }) {
    final _result = create();
    if (employeeId != null) {
      _result.employeeId = employeeId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (isAdmin != null) {
      _result.isAdmin = isAdmin;
    }
    if (amountOwed != null) {
      _result.amountOwed = amountOwed;
    }
    return _result;
  }
  factory OwningUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OwningUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OwningUser clone() => OwningUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OwningUser copyWith(void Function(OwningUser) updates) => super.copyWith((message) => updates(message as OwningUser)) as OwningUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OwningUser create() => OwningUser._();
  OwningUser createEmptyInstance() => create();
  static $pb.PbList<OwningUser> createRepeated() => $pb.PbList<OwningUser>();
  @$core.pragma('dart2js:noInline')
  static OwningUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OwningUser>(create);
  static OwningUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAdmin => $_getBF(2);
  @$pb.TagNumber(3)
  set isAdmin($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAdmin() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAdmin() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get amountOwed => $_getN(3);
  @$pb.TagNumber(4)
  set amountOwed($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmountOwed() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmountOwed() => clearField(4);
}

class SetAdminRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetAdminRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'employeeId', protoName: 'employeeId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'admin')
    ..hasRequiredFields = false
  ;

  SetAdminRequest._() : super();
  factory SetAdminRequest({
    $core.String? employeeId,
    $core.bool? admin,
  }) {
    final _result = create();
    if (employeeId != null) {
      _result.employeeId = employeeId;
    }
    if (admin != null) {
      _result.admin = admin;
    }
    return _result;
  }
  factory SetAdminRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetAdminRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetAdminRequest clone() => SetAdminRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetAdminRequest copyWith(void Function(SetAdminRequest) updates) => super.copyWith((message) => updates(message as SetAdminRequest)) as SetAdminRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetAdminRequest create() => SetAdminRequest._();
  SetAdminRequest createEmptyInstance() => create();
  static $pb.PbList<SetAdminRequest> createRepeated() => $pb.PbList<SetAdminRequest>();
  @$core.pragma('dart2js:noInline')
  static SetAdminRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetAdminRequest>(create);
  static SetAdminRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get admin => $_getBF(1);
  @$pb.TagNumber(2)
  set admin($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAdmin() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdmin() => clearField(2);
}

class GetAboutResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAboutResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
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

class AddUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'employeeId', protoName: 'employeeId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isAdmin', protoName: 'isAdmin')
    ..hasRequiredFields = false
  ;

  AddUserRequest._() : super();
  factory AddUserRequest({
    $core.String? employeeId,
    $core.String? name,
    $core.bool? isAdmin,
  }) {
    final _result = create();
    if (employeeId != null) {
      _result.employeeId = employeeId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (isAdmin != null) {
      _result.isAdmin = isAdmin;
    }
    return _result;
  }
  factory AddUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUserRequest clone() => AddUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUserRequest copyWith(void Function(AddUserRequest) updates) => super.copyWith((message) => updates(message as AddUserRequest)) as AddUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddUserRequest create() => AddUserRequest._();
  AddUserRequest createEmptyInstance() => create();
  static $pb.PbList<AddUserRequest> createRepeated() => $pb.PbList<AddUserRequest>();
  @$core.pragma('dart2js:noInline')
  static AddUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUserRequest>(create);
  static AddUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAdmin => $_getBF(2);
  @$pb.TagNumber(3)
  set isAdmin($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAdmin() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAdmin() => clearField(3);
}

class GetSessionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSessionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isAdmin', protoName: 'isAdmin')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetSessionResponse._() : super();
  factory GetSessionResponse({
    $core.String? name,
    $core.bool? isAdmin,
    $core.String? id,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (isAdmin != null) {
      _result.isAdmin = isAdmin;
    }
    if (id != null) {
      _result.id = id;
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
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAdmin => $_getBF(1);
  @$pb.TagNumber(2)
  set isAdmin($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAdmin() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAdmin() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(3)
  set id($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);
}

class ListPaymentResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListPaymentResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..pc<Payment>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payments', $pb.PbFieldType.PM, subBuilder: Payment.create)
    ..hasRequiredFields = false
  ;

  ListPaymentResponse._() : super();
  factory ListPaymentResponse({
    $core.Iterable<Payment>? payments,
  }) {
    final _result = create();
    if (payments != null) {
      _result.payments.addAll(payments);
    }
    return _result;
  }
  factory ListPaymentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPaymentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPaymentResponse clone() => ListPaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPaymentResponse copyWith(void Function(ListPaymentResponse) updates) => super.copyWith((message) => updates(message as ListPaymentResponse)) as ListPaymentResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListPaymentResponse create() => ListPaymentResponse._();
  ListPaymentResponse createEmptyInstance() => create();
  static $pb.PbList<ListPaymentResponse> createRepeated() => $pb.PbList<ListPaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPaymentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPaymentResponse>(create);
  static ListPaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Payment> get payments => $_getList(0);
}

class DenyPaymentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DenyPaymentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paymentId', protoName: 'paymentId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denied')
    ..hasRequiredFields = false
  ;

  DenyPaymentRequest._() : super();
  factory DenyPaymentRequest({
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
  factory DenyPaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DenyPaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DenyPaymentRequest clone() => DenyPaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DenyPaymentRequest copyWith(void Function(DenyPaymentRequest) updates) => super.copyWith((message) => updates(message as DenyPaymentRequest)) as DenyPaymentRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DenyPaymentRequest create() => DenyPaymentRequest._();
  DenyPaymentRequest createEmptyInstance() => create();
  static $pb.PbList<DenyPaymentRequest> createRepeated() => $pb.PbList<DenyPaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static DenyPaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DenyPaymentRequest>(create);
  static DenyPaymentRequest? _defaultInstance;

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

class Notification extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Notification', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt')
    ..hasRequiredFields = false
  ;

  Notification._() : super();
  factory Notification({
    $core.String? id,
    $core.String? userId,
    $core.String? text,
    $fixnum.Int64? createdAt,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (text != null) {
      _result.text = text;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    return _result;
  }
  factory Notification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Notification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Notification clone() => Notification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Notification copyWith(void Function(Notification) updates) => super.copyWith((message) => updates(message as Notification)) as Notification; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Notification create() => Notification._();
  Notification createEmptyInstance() => create();
  static $pb.PbList<Notification> createRepeated() => $pb.PbList<Notification>();
  @$core.pragma('dart2js:noInline')
  static Notification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notification>(create);
  static Notification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get createdAt => $_getI64(3);
  @$pb.TagNumber(4)
  set createdAt($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
}

class ListNotificationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListNotificationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..pc<Notification>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notifications', $pb.PbFieldType.PM, subBuilder: Notification.create)
    ..hasRequiredFields = false
  ;

  ListNotificationResponse._() : super();
  factory ListNotificationResponse({
    $core.Iterable<Notification>? notifications,
  }) {
    final _result = create();
    if (notifications != null) {
      _result.notifications.addAll(notifications);
    }
    return _result;
  }
  factory ListNotificationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNotificationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNotificationResponse clone() => ListNotificationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNotificationResponse copyWith(void Function(ListNotificationResponse) updates) => super.copyWith((message) => updates(message as ListNotificationResponse)) as ListNotificationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListNotificationResponse create() => ListNotificationResponse._();
  ListNotificationResponse createEmptyInstance() => create();
  static $pb.PbList<ListNotificationResponse> createRepeated() => $pb.PbList<ListNotificationResponse>();
  @$core.pragma('dart2js:noInline')
  static ListNotificationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNotificationResponse>(create);
  static ListNotificationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Notification> get notifications => $_getList(0);
}

class CompleteNotificationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompleteNotificationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notificationId', protoName: 'notificationId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'completed')
    ..hasRequiredFields = false
  ;

  CompleteNotificationRequest._() : super();
  factory CompleteNotificationRequest({
    $core.String? notificationId,
    $core.bool? completed,
  }) {
    final _result = create();
    if (notificationId != null) {
      _result.notificationId = notificationId;
    }
    if (completed != null) {
      _result.completed = completed;
    }
    return _result;
  }
  factory CompleteNotificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompleteNotificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompleteNotificationRequest clone() => CompleteNotificationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompleteNotificationRequest copyWith(void Function(CompleteNotificationRequest) updates) => super.copyWith((message) => updates(message as CompleteNotificationRequest)) as CompleteNotificationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CompleteNotificationRequest create() => CompleteNotificationRequest._();
  CompleteNotificationRequest createEmptyInstance() => create();
  static $pb.PbList<CompleteNotificationRequest> createRepeated() => $pb.PbList<CompleteNotificationRequest>();
  @$core.pragma('dart2js:noInline')
  static CompleteNotificationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompleteNotificationRequest>(create);
  static CompleteNotificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get notificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set notificationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get completed => $_getBF(1);
  @$pb.TagNumber(2)
  set completed($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompleted() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompleted() => clearField(2);
}

class PurchaseBeerRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PurchaseBeerRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amountPaid', $pb.PbFieldType.OD, protoName: 'amountPaid')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cratesPurchased', $pb.PbFieldType.OU3, protoName: 'cratesPurchased')
    ..hasRequiredFields = false
  ;

  PurchaseBeerRequest._() : super();
  factory PurchaseBeerRequest({
    $core.double? amountPaid,
    $core.int? cratesPurchased,
  }) {
    final _result = create();
    if (amountPaid != null) {
      _result.amountPaid = amountPaid;
    }
    if (cratesPurchased != null) {
      _result.cratesPurchased = cratesPurchased;
    }
    return _result;
  }
  factory PurchaseBeerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PurchaseBeerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PurchaseBeerRequest clone() => PurchaseBeerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PurchaseBeerRequest copyWith(void Function(PurchaseBeerRequest) updates) => super.copyWith((message) => updates(message as PurchaseBeerRequest)) as PurchaseBeerRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PurchaseBeerRequest create() => PurchaseBeerRequest._();
  PurchaseBeerRequest createEmptyInstance() => create();
  static $pb.PbList<PurchaseBeerRequest> createRepeated() => $pb.PbList<PurchaseBeerRequest>();
  @$core.pragma('dart2js:noInline')
  static PurchaseBeerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PurchaseBeerRequest>(create);
  static PurchaseBeerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get amountPaid => $_getN(0);
  @$pb.TagNumber(1)
  set amountPaid($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmountPaid() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmountPaid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cratesPurchased => $_getIZ(1);
  @$pb.TagNumber(2)
  set cratesPurchased($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCratesPurchased() => $_has(1);
  @$pb.TagNumber(2)
  void clearCratesPurchased() => clearField(2);
}

class GetBeerStockResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBeerStockResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..pc<BeerStockEntry>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stockEntries', $pb.PbFieldType.PM, protoName: 'stockEntries', subBuilder: BeerStockEntry.create)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bottlesLeft', protoName: 'bottlesLeft')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paymentBalance', $pb.PbFieldType.OD, protoName: 'paymentBalance')
    ..hasRequiredFields = false
  ;

  GetBeerStockResponse._() : super();
  factory GetBeerStockResponse({
    $core.Iterable<BeerStockEntry>? stockEntries,
    $fixnum.Int64? bottlesLeft,
    $core.double? paymentBalance,
  }) {
    final _result = create();
    if (stockEntries != null) {
      _result.stockEntries.addAll(stockEntries);
    }
    if (bottlesLeft != null) {
      _result.bottlesLeft = bottlesLeft;
    }
    if (paymentBalance != null) {
      _result.paymentBalance = paymentBalance;
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
  $core.List<BeerStockEntry> get stockEntries => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bottlesLeft => $_getI64(1);
  @$pb.TagNumber(2)
  set bottlesLeft($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBottlesLeft() => $_has(1);
  @$pb.TagNumber(2)
  void clearBottlesLeft() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get paymentBalance => $_getN(2);
  @$pb.TagNumber(3)
  set paymentBalance($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPaymentBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearPaymentBalance() => clearField(3);
}

class BeerStockEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BeerStockEntry', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee.items'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'crates', $pb.PbFieldType.OU3)
    ..aOM<User>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'purchasedBy', protoName: 'purchasedBy', subBuilder: User.create)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'purchasedAt', protoName: 'purchasedAt')
    ..hasRequiredFields = false
  ;

  BeerStockEntry._() : super();
  factory BeerStockEntry({
    $core.int? crates,
    User? purchasedBy,
    $fixnum.Int64? purchasedAt,
  }) {
    final _result = create();
    if (crates != null) {
      _result.crates = crates;
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
  $core.int get crates => $_getIZ(0);
  @$pb.TagNumber(1)
  set crates($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCrates() => $_has(0);
  @$pb.TagNumber(1)
  void clearCrates() => clearField(1);

  @$pb.TagNumber(2)
  User get purchasedBy => $_getN(1);
  @$pb.TagNumber(2)
  set purchasedBy(User v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPurchasedBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearPurchasedBy() => clearField(2);
  @$pb.TagNumber(2)
  User ensurePurchasedBy() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get purchasedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set purchasedAt($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPurchasedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearPurchasedAt() => clearField(3);
}

