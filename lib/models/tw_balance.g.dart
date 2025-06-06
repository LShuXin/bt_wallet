// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tw_balance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TwBalance> _$twBalanceSerializer = _$TwBalanceSerializer();

class _$TwBalanceSerializer implements StructuredSerializer<TwBalance> {
  @override
  final Iterable<Type> types = const [TwBalance, _$TwBalance];
  @override
  final String wireName = 'TwBalance';

  @override
  Iterable<Object?> serialize(Serializers serializers, TwBalance object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'balance',
      serializers.serialize(object.amount,
          specifiedType: const FullType(Amount)),
    ];

    return result;
  }

  @override
  TwBalance deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TwBalanceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'balance':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(Amount))! as Amount;
          break;
      }
    }

    return result.build();
  }
}

class _$TwBalance extends TwBalance {
  @override
  final Amount amount;
  Decimal? __original;

  factory _$TwBalance([void Function(TwBalanceBuilder)? updates]) =>
      (TwBalanceBuilder()..update(updates))._build();

  _$TwBalance._({required this.amount}) : super._();
  @override
  Decimal get original => __original ??= super.original;

  @override
  TwBalance rebuild(void Function(TwBalanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TwBalanceBuilder toBuilder() => TwBalanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TwBalance && amount == other.amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TwBalance')..add('amount', amount))
        .toString();
  }
}

class TwBalanceBuilder implements Builder<TwBalance, TwBalanceBuilder> {
  _$TwBalance? _$v;

  Amount? _amount;
  Amount? get amount => _$this._amount;
  set amount(Amount? amount) => _$this._amount = amount;

  TwBalanceBuilder();

  TwBalanceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TwBalance other) {
    _$v = other as _$TwBalance;
  }

  @override
  void update(void Function(TwBalanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TwBalance build() => _build();

  _$TwBalance _build() {
    final _$result = _$v ??
        _$TwBalance._(
          amount: BuiltValueNullFieldError.checkNotNull(
              amount, r'TwBalance', 'amount'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
