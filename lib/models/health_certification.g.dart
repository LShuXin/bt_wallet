// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_certification.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HealthCertification> _$healthCertificationSerializer =
    _$HealthCertificationSerializer();
Serializer<HealthCertificationSub> _$healthCertificationSubSerializer =
    _$HealthCertificationSubSerializer();
Serializer<HealthyStatus> _$healthyStatusSerializer =
    _$HealthyStatusSerializer();

class _$HealthCertificationSerializer
    implements StructuredSerializer<HealthCertification> {
  @override
  final Iterable<Type> types = const [
    HealthCertification,
    _$HealthCertification
  ];
  @override
  final String wireName = 'HealthCertification';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HealthCertification object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '@context',
      serializers.serialize(object.context,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'exp',
      serializers.serialize(object.exp, specifiedType: const FullType(int)),
      'iat',
      serializers.serialize(object.iat, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'iss',
      serializers.serialize(object.iss, specifiedType: const FullType(String)),
      'ver',
      serializers.serialize(object.ver, specifiedType: const FullType(String)),
      'typ',
      serializers.serialize(object.typ,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'sub',
      serializers.serialize(object.sub,
          specifiedType: const FullType(HealthCertificationSub)),
    ];

    return result;
  }

  @override
  HealthCertification deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HealthCertificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '@context':
          result.context.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'exp':
          result.exp = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'iat':
          result.iat = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iss':
          result.iss = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'ver':
          result.ver = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'typ':
          result.typ.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'sub':
          result.sub.replace(serializers.deserialize(value,
                  specifiedType: const FullType(HealthCertificationSub))!
              as HealthCertificationSub);
          break;
      }
    }

    return result.build();
  }
}

class _$HealthCertificationSubSerializer
    implements StructuredSerializer<HealthCertificationSub> {
  @override
  final Iterable<Type> types = const [
    HealthCertificationSub,
    _$HealthCertificationSub
  ];
  @override
  final String wireName = 'HealthCertificationSub';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HealthCertificationSub object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'healthyStatus',
      serializers.serialize(object.healthyStatus,
          specifiedType: const FullType(HealthyStatus)),
    ];

    return result;
  }

  @override
  HealthCertificationSub deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HealthCertificationSubBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'healthyStatus':
          result.healthyStatus.replace(serializers.deserialize(value,
              specifiedType: const FullType(HealthyStatus))! as HealthyStatus);
          break;
      }
    }

    return result.build();
  }
}

class _$HealthyStatusSerializer implements StructuredSerializer<HealthyStatus> {
  @override
  final Iterable<Type> types = const [HealthyStatus, _$HealthyStatus];
  @override
  final String wireName = 'HealthyStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, HealthyStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'typ',
      serializers.serialize(object.typ, specifiedType: const FullType(String)),
      'val',
      serializers.serialize(object.val, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HealthyStatus deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HealthyStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'typ':
          result.typ = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'val':
          result.val = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HealthCertification extends HealthCertification {
  @override
  final BuiltList<String> context;
  @override
  final int exp;
  @override
  final int iat;
  @override
  final String id;
  @override
  final String iss;
  @override
  final String ver;
  @override
  final BuiltList<String> typ;
  @override
  final HealthCertificationSub sub;

  factory _$HealthCertification(
          [void Function(HealthCertificationBuilder)? updates]) =>
      (HealthCertificationBuilder()..update(updates))._build();

  _$HealthCertification._(
      {required this.context,
      required this.exp,
      required this.iat,
      required this.id,
      required this.iss,
      required this.ver,
      required this.typ,
      required this.sub})
      : super._();
  @override
  HealthCertification rebuild(
          void Function(HealthCertificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthCertificationBuilder toBuilder() =>
      HealthCertificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthCertification &&
        context == other.context &&
        exp == other.exp &&
        iat == other.iat &&
        id == other.id &&
        iss == other.iss &&
        ver == other.ver &&
        typ == other.typ &&
        sub == other.sub;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, context.hashCode);
    _$hash = $jc(_$hash, exp.hashCode);
    _$hash = $jc(_$hash, iat.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, iss.hashCode);
    _$hash = $jc(_$hash, ver.hashCode);
    _$hash = $jc(_$hash, typ.hashCode);
    _$hash = $jc(_$hash, sub.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthCertification')
          ..add('context', context)
          ..add('exp', exp)
          ..add('iat', iat)
          ..add('id', id)
          ..add('iss', iss)
          ..add('ver', ver)
          ..add('typ', typ)
          ..add('sub', sub))
        .toString();
  }
}

class HealthCertificationBuilder
    implements Builder<HealthCertification, HealthCertificationBuilder> {
  _$HealthCertification? _$v;

  ListBuilder<String>? _context;
  ListBuilder<String> get context => _$this._context ??= ListBuilder<String>();
  set context(ListBuilder<String>? context) => _$this._context = context;

  int? _exp;
  int? get exp => _$this._exp;
  set exp(int? exp) => _$this._exp = exp;

  int? _iat;
  int? get iat => _$this._iat;
  set iat(int? iat) => _$this._iat = iat;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _iss;
  String? get iss => _$this._iss;
  set iss(String? iss) => _$this._iss = iss;

  String? _ver;
  String? get ver => _$this._ver;
  set ver(String? ver) => _$this._ver = ver;

  ListBuilder<String>? _typ;
  ListBuilder<String> get typ => _$this._typ ??= ListBuilder<String>();
  set typ(ListBuilder<String>? typ) => _$this._typ = typ;

  HealthCertificationSubBuilder? _sub;
  HealthCertificationSubBuilder get sub =>
      _$this._sub ??= HealthCertificationSubBuilder();
  set sub(HealthCertificationSubBuilder? sub) => _$this._sub = sub;

  HealthCertificationBuilder();

  HealthCertificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _context = $v.context.toBuilder();
      _exp = $v.exp;
      _iat = $v.iat;
      _id = $v.id;
      _iss = $v.iss;
      _ver = $v.ver;
      _typ = $v.typ.toBuilder();
      _sub = $v.sub.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthCertification other) {
    _$v = other as _$HealthCertification;
  }

  @override
  void update(void Function(HealthCertificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthCertification build() => _build();

  _$HealthCertification _build() {
    _$HealthCertification _$result;
    try {
      _$result = _$v ??
          _$HealthCertification._(
            context: context.build(),
            exp: BuiltValueNullFieldError.checkNotNull(
                exp, r'HealthCertification', 'exp'),
            iat: BuiltValueNullFieldError.checkNotNull(
                iat, r'HealthCertification', 'iat'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'HealthCertification', 'id'),
            iss: BuiltValueNullFieldError.checkNotNull(
                iss, r'HealthCertification', 'iss'),
            ver: BuiltValueNullFieldError.checkNotNull(
                ver, r'HealthCertification', 'ver'),
            typ: typ.build(),
            sub: sub.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'context';
        context.build();

        _$failedField = 'typ';
        typ.build();
        _$failedField = 'sub';
        sub.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'HealthCertification', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$HealthCertificationSub extends HealthCertificationSub {
  @override
  final String id;
  @override
  final String phone;
  @override
  final HealthyStatus healthyStatus;

  factory _$HealthCertificationSub(
          [void Function(HealthCertificationSubBuilder)? updates]) =>
      (HealthCertificationSubBuilder()..update(updates))._build();

  _$HealthCertificationSub._(
      {required this.id, required this.phone, required this.healthyStatus})
      : super._();
  @override
  HealthCertificationSub rebuild(
          void Function(HealthCertificationSubBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthCertificationSubBuilder toBuilder() =>
      HealthCertificationSubBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthCertificationSub &&
        id == other.id &&
        phone == other.phone &&
        healthyStatus == other.healthyStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, healthyStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthCertificationSub')
          ..add('id', id)
          ..add('phone', phone)
          ..add('healthyStatus', healthyStatus))
        .toString();
  }
}

class HealthCertificationSubBuilder
    implements Builder<HealthCertificationSub, HealthCertificationSubBuilder> {
  _$HealthCertificationSub? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  HealthyStatusBuilder? _healthyStatus;
  HealthyStatusBuilder get healthyStatus =>
      _$this._healthyStatus ??= HealthyStatusBuilder();
  set healthyStatus(HealthyStatusBuilder? healthyStatus) =>
      _$this._healthyStatus = healthyStatus;

  HealthCertificationSubBuilder();

  HealthCertificationSubBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _phone = $v.phone;
      _healthyStatus = $v.healthyStatus.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthCertificationSub other) {
    _$v = other as _$HealthCertificationSub;
  }

  @override
  void update(void Function(HealthCertificationSubBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthCertificationSub build() => _build();

  _$HealthCertificationSub _build() {
    _$HealthCertificationSub _$result;
    try {
      _$result = _$v ??
          _$HealthCertificationSub._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'HealthCertificationSub', 'id'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'HealthCertificationSub', 'phone'),
            healthyStatus: healthyStatus.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'healthyStatus';
        healthyStatus.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'HealthCertificationSub', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$HealthyStatus extends HealthyStatus {
  @override
  final String typ;
  @override
  final String val;

  factory _$HealthyStatus([void Function(HealthyStatusBuilder)? updates]) =>
      (HealthyStatusBuilder()..update(updates))._build();

  _$HealthyStatus._({required this.typ, required this.val}) : super._();
  @override
  HealthyStatus rebuild(void Function(HealthyStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthyStatusBuilder toBuilder() => HealthyStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthyStatus && typ == other.typ && val == other.val;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, typ.hashCode);
    _$hash = $jc(_$hash, val.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthyStatus')
          ..add('typ', typ)
          ..add('val', val))
        .toString();
  }
}

class HealthyStatusBuilder
    implements Builder<HealthyStatus, HealthyStatusBuilder> {
  _$HealthyStatus? _$v;

  String? _typ;
  String? get typ => _$this._typ;
  set typ(String? typ) => _$this._typ = typ;

  String? _val;
  String? get val => _$this._val;
  set val(String? val) => _$this._val = val;

  HealthyStatusBuilder();

  HealthyStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _typ = $v.typ;
      _val = $v.val;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthyStatus other) {
    _$v = other as _$HealthyStatus;
  }

  @override
  void update(void Function(HealthyStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthyStatus build() => _build();

  _$HealthyStatus _build() {
    final _$result = _$v ??
        _$HealthyStatus._(
          typ: BuiltValueNullFieldError.checkNotNull(
              typ, r'HealthyStatus', 'typ'),
          val: BuiltValueNullFieldError.checkNotNull(
              val, r'HealthyStatus', 'val'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
