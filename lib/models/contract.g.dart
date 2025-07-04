// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Contract> _$contractSerializer = _$ContractSerializer();

class _$ContractSerializer implements StructuredSerializer<Contract> {
  @override
  final Iterable<Type> types = const [Contract, _$Contract];
  @override
  final String wireName = 'Contract';

  @override
  Iterable<Object?> serialize(Serializers serializers, Contract object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'abi',
      serializers.serialize(object.abi, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.symbol;
    if (value != null) {
      result
        ..add('symbol')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.decimal;
    if (value != null) {
      result
        ..add('decimal')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Contract deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ContractBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'abi':
          result.abi = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'symbol':
          result.symbol = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'decimal':
          result.decimal = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$Contract extends Contract {
  @override
  final String name;
  @override
  final String address;
  @override
  final String abi;
  @override
  final String? symbol;
  @override
  final int? decimal;

  factory _$Contract([void Function(ContractBuilder)? updates]) =>
      (ContractBuilder()..update(updates))._build();

  _$Contract._(
      {required this.name,
      required this.address,
      required this.abi,
      this.symbol,
      this.decimal})
      : super._();
  @override
  Contract rebuild(void Function(ContractBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContractBuilder toBuilder() => ContractBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Contract &&
        name == other.name &&
        address == other.address &&
        abi == other.abi &&
        symbol == other.symbol &&
        decimal == other.decimal;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, abi.hashCode);
    _$hash = $jc(_$hash, symbol.hashCode);
    _$hash = $jc(_$hash, decimal.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Contract')
          ..add('name', name)
          ..add('address', address)
          ..add('abi', abi)
          ..add('symbol', symbol)
          ..add('decimal', decimal))
        .toString();
  }
}

class ContractBuilder implements Builder<Contract, ContractBuilder> {
  _$Contract? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _abi;
  String? get abi => _$this._abi;
  set abi(String? abi) => _$this._abi = abi;

  String? _symbol;
  String? get symbol => _$this._symbol;
  set symbol(String? symbol) => _$this._symbol = symbol;

  int? _decimal;
  int? get decimal => _$this._decimal;
  set decimal(int? decimal) => _$this._decimal = decimal;

  ContractBuilder();

  ContractBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _address = $v.address;
      _abi = $v.abi;
      _symbol = $v.symbol;
      _decimal = $v.decimal;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Contract other) {
    _$v = other as _$Contract;
  }

  @override
  void update(void Function(ContractBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Contract build() => _build();

  _$Contract _build() {
    final _$result = _$v ??
        _$Contract._(
          name:
              BuiltValueNullFieldError.checkNotNull(name, r'Contract', 'name'),
          address: BuiltValueNullFieldError.checkNotNull(
              address, r'Contract', 'address'),
          abi: BuiltValueNullFieldError.checkNotNull(abi, r'Contract', 'abi'),
          symbol: symbol,
          decimal: decimal,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
