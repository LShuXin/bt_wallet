// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_certification_token.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HealthCertificationToken> _$healthCertificationTokenSerializer =
    _$HealthCertificationTokenSerializer();

class _$HealthCertificationTokenSerializer
    implements StructuredSerializer<HealthCertificationToken> {
  @override
  final Iterable<Type> types = const [
    HealthCertificationToken,
    _$HealthCertificationToken
  ];
  @override
  final String wireName = 'HealthCertificationToken';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HealthCertificationToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HealthCertificationToken deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HealthCertificationTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HealthCertificationToken extends HealthCertificationToken {
  @override
  final String token;
  HealthCertification? __healthCertification;

  factory _$HealthCertificationToken(
          [void Function(HealthCertificationTokenBuilder)? updates]) =>
      (HealthCertificationTokenBuilder()..update(updates))._build();

  _$HealthCertificationToken._({required this.token}) : super._();
  @override
  HealthCertification get healthCertification =>
      __healthCertification ??= super.healthCertification;

  @override
  HealthCertificationToken rebuild(
          void Function(HealthCertificationTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthCertificationTokenBuilder toBuilder() =>
      HealthCertificationTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthCertificationToken && token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class HealthCertificationTokenBuilder
    implements
        Builder<HealthCertificationToken, HealthCertificationTokenBuilder> {
  _$HealthCertificationToken? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  HealthCertificationTokenBuilder();

  HealthCertificationTokenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthCertificationToken other) {
    _$v = other as _$HealthCertificationToken;
  }

  @override
  void update(void Function(HealthCertificationTokenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthCertificationToken build() => _build();

  _$HealthCertificationToken _build() {
    final _$result = _$v ??
        _$HealthCertificationToken._(
          token: BuiltValueNullFieldError.checkNotNull(
              token, r'HealthCertificationToken', 'token'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
