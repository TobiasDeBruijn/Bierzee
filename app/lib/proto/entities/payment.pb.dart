///
//  Generated code. Do not modify.
//  source: entities/payment.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

class Payment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Payment', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bierzee'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paidAt', protoName: 'paidAt')
    ..aOM<$0.User>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: $0.User.create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denied')
    ..aOM<$0.User>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deniedBy', protoName: 'deniedBy', subBuilder: $0.User.create)
    ..hasRequiredFields = false
  ;

  Payment._() : super();
  factory Payment({
    $core.String? id,
    $core.double? amount,
    $fixnum.Int64? paidAt,
    $0.User? user,
    $core.bool? denied,
    $0.User? deniedBy,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (paidAt != null) {
      _result.paidAt = paidAt;
    }
    if (user != null) {
      _result.user = user;
    }
    if (denied != null) {
      _result.denied = denied;
    }
    if (deniedBy != null) {
      _result.deniedBy = deniedBy;
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
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get paidAt => $_getI64(2);
  @$pb.TagNumber(3)
  set paidAt($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPaidAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearPaidAt() => clearField(3);

  @$pb.TagNumber(4)
  $0.User get user => $_getN(3);
  @$pb.TagNumber(4)
  set user($0.User v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearUser() => clearField(4);
  @$pb.TagNumber(4)
  $0.User ensureUser() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get denied => $_getBF(4);
  @$pb.TagNumber(5)
  set denied($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDenied() => $_has(4);
  @$pb.TagNumber(5)
  void clearDenied() => clearField(5);

  @$pb.TagNumber(6)
  $0.User get deniedBy => $_getN(5);
  @$pb.TagNumber(6)
  set deniedBy($0.User v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeniedBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeniedBy() => clearField(6);
  @$pb.TagNumber(6)
  $0.User ensureDeniedBy() => $_ensure(5);
}

