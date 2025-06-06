// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dcep.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DcepType _$rmb100 = const DcepType._('rmb100');
const DcepType _$rmb050 = const DcepType._('rmb050');
const DcepType _$rmb010 = const DcepType._('rmb010');
const DcepType _$rmb005 = const DcepType._('rmb005');
const DcepType _$rmb001 = const DcepType._('rmb001');
const DcepType _$rmb000_50 = const DcepType._('rmb000_50');
const DcepType _$rmb000_10 = const DcepType._('rmb000_10');

DcepType _$valueOf(String name) {
  switch (name) {
    case 'rmb100':
      return _$rmb100;
    case 'rmb050':
      return _$rmb050;
    case 'rmb010':
      return _$rmb010;
    case 'rmb005':
      return _$rmb005;
    case 'rmb001':
      return _$rmb001;
    case 'rmb000_50':
      return _$rmb000_50;
    case 'rmb000_10':
      return _$rmb000_10;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DcepType> _$values = BuiltSet<DcepType>(const <DcepType>[
  _$rmb100,
  _$rmb050,
  _$rmb010,
  _$rmb005,
  _$rmb001,
  _$rmb000_50,
  _$rmb000_10,
]);

Serializer<DcepType> _$dcepTypeSerializer = _$DcepTypeSerializer();
Serializer<Dcep> _$dcepSerializer = _$DcepSerializer();

class _$DcepTypeSerializer implements PrimitiveSerializer<DcepType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'rmb100': 'RMB100_00',
    'rmb050': 'RMB050_00',
    'rmb010': 'RMB010_00',
    'rmb005': 'RMB005_00',
    'rmb001': 'RMB001_00',
    'rmb000_50': 'RMB000_50',
    'rmb000_10': 'RMB000_10',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'RMB100_00': 'rmb100',
    'RMB050_00': 'rmb050',
    'RMB010_00': 'rmb010',
    'RMB005_00': 'rmb005',
    'RMB001_00': 'rmb001',
    'RMB000_50': 'rmb000_50',
    'RMB000_10': 'rmb000_10',
  };

  @override
  final Iterable<Type> types = const <Type>[DcepType];
  @override
  final String wireName = 'DcepType';

  @override
  Object serialize(Serializers serializers, DcepType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DcepType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DcepType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$DcepSerializer implements StructuredSerializer<Dcep> {
  @override
  final Iterable<Type> types = const [Dcep, _$Dcep];
  @override
  final String wireName = 'Dcep';

  @override
  Iterable<Object?> serialize(Serializers serializers, Dcep object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'serial_number',
      serializers.serialize(object.sn, specifiedType: const FullType(String)),
      'owner',
      serializers.serialize(object.owner,
          specifiedType: const FullType(String)),
      'signature',
      serializers.serialize(object.signature,
          specifiedType: const FullType(String)),
      'money_type',
      serializers.serialize(object.type,
          specifiedType: const FullType(DcepType)),
    ];

    return result;
  }

  @override
  Dcep deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DcepBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'serial_number':
          result.sn = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'signature':
          result.signature = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'money_type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(DcepType))! as DcepType;
          break;
      }
    }

    return result.build();
  }
}

class _$Dcep extends Dcep {
  @override
  final String sn;
  @override
  final String owner;
  @override
  final String signature;
  @override
  final DcepType type;

  factory _$Dcep([void Function(DcepBuilder)? updates]) =>
      (DcepBuilder()..update(updates))._build();

  _$Dcep._(
      {required this.sn,
      required this.owner,
      required this.signature,
      required this.type})
      : super._();
  @override
  Dcep rebuild(void Function(DcepBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DcepBuilder toBuilder() => DcepBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Dcep &&
        sn == other.sn &&
        owner == other.owner &&
        signature == other.signature &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sn.hashCode);
    _$hash = $jc(_$hash, owner.hashCode);
    _$hash = $jc(_$hash, signature.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Dcep')
          ..add('sn', sn)
          ..add('owner', owner)
          ..add('signature', signature)
          ..add('type', type))
        .toString();
  }
}

class DcepBuilder implements Builder<Dcep, DcepBuilder> {
  _$Dcep? _$v;

  String? _sn;
  String? get sn => _$this._sn;
  set sn(String? sn) => _$this._sn = sn;

  String? _owner;
  String? get owner => _$this._owner;
  set owner(String? owner) => _$this._owner = owner;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  DcepType? _type;
  DcepType? get type => _$this._type;
  set type(DcepType? type) => _$this._type = type;

  DcepBuilder();

  DcepBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sn = $v.sn;
      _owner = $v.owner;
      _signature = $v.signature;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Dcep other) {
    _$v = other as _$Dcep;
  }

  @override
  void update(void Function(DcepBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Dcep build() => _build();

  _$Dcep _build() {
    final _$result = _$v ??
        _$Dcep._(
          sn: BuiltValueNullFieldError.checkNotNull(sn, r'Dcep', 'sn'),
          owner: BuiltValueNullFieldError.checkNotNull(owner, r'Dcep', 'owner'),
          signature: BuiltValueNullFieldError.checkNotNull(
              signature, r'Dcep', 'signature'),
          type: BuiltValueNullFieldError.checkNotNull(type, r'Dcep', 'type'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
