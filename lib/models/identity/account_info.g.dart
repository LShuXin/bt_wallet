// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountInfo> _$accountInfoSerializer = _$AccountInfoSerializer();

class _$AccountInfoSerializer implements StructuredSerializer<AccountInfo> {
  @override
  final Iterable<Type> types = const [AccountInfo, _$AccountInfo];
  @override
  final String wireName = 'AccountInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, AccountInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'index',
      serializers.serialize(object.index, specifiedType: const FullType(int)),
      'pubKey',
      serializers.serialize(object.pubKey,
          specifiedType: const FullType(String)),
      'priKey',
      serializers.serialize(object.priKey,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.balance;
    if (value != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Amount)));
    }
    return result;
  }

  @override
  AccountInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AccountInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pubKey':
          result.pubKey = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'priKey':
          result.priKey = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(Amount)) as Amount?;
          break;
      }
    }

    return result.build();
  }
}

class _$AccountInfo extends AccountInfo {
  @override
  final int index;
  @override
  final String pubKey;
  @override
  final String priKey;
  @override
  final Amount? balance;

  factory _$AccountInfo([void Function(AccountInfoBuilder)? updates]) =>
      (AccountInfoBuilder()..update(updates))._build();

  _$AccountInfo._(
      {required this.index,
      required this.pubKey,
      required this.priKey,
      this.balance})
      : super._();
  @override
  AccountInfo rebuild(void Function(AccountInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountInfoBuilder toBuilder() => AccountInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountInfo &&
        index == other.index &&
        pubKey == other.pubKey &&
        priKey == other.priKey &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jc(_$hash, pubKey.hashCode);
    _$hash = $jc(_$hash, priKey.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountInfo')
          ..add('index', index)
          ..add('pubKey', pubKey)
          ..add('priKey', priKey)
          ..add('balance', balance))
        .toString();
  }
}

class AccountInfoBuilder implements Builder<AccountInfo, AccountInfoBuilder> {
  _$AccountInfo? _$v;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _pubKey;
  String? get pubKey => _$this._pubKey;
  set pubKey(String? pubKey) => _$this._pubKey = pubKey;

  String? _priKey;
  String? get priKey => _$this._priKey;
  set priKey(String? priKey) => _$this._priKey = priKey;

  Amount? _balance;
  Amount? get balance => _$this._balance;
  set balance(Amount? balance) => _$this._balance = balance;

  AccountInfoBuilder();

  AccountInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _index = $v.index;
      _pubKey = $v.pubKey;
      _priKey = $v.priKey;
      _balance = $v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountInfo other) {
    _$v = other as _$AccountInfo;
  }

  @override
  void update(void Function(AccountInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountInfo build() => _build();

  _$AccountInfo _build() {
    final _$result = _$v ??
        _$AccountInfo._(
          index: BuiltValueNullFieldError.checkNotNull(
              index, r'AccountInfo', 'index'),
          pubKey: BuiltValueNullFieldError.checkNotNull(
              pubKey, r'AccountInfo', 'pubKey'),
          priKey: BuiltValueNullFieldError.checkNotNull(
              priKey, r'AccountInfo', 'priKey'),
          balance: balance,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
