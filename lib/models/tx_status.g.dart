// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tx_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TxStatus _$succeeded = const TxStatus._('succeeded');
const TxStatus _$transferring = const TxStatus._('transferring');
const TxStatus _$failed = const TxStatus._('failed');

TxStatus _$valueOf(String name) {
  switch (name) {
    case 'succeeded':
      return _$succeeded;
    case 'transferring':
      return _$transferring;
    case 'failed':
      return _$failed;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<TxStatus> _$values = BuiltSet<TxStatus>(const <TxStatus>[
  _$succeeded,
  _$transferring,
  _$failed,
]);

Serializer<TxStatus> _$txStatusSerializer = _$TxStatusSerializer();

class _$TxStatusSerializer implements PrimitiveSerializer<TxStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'succeeded': 'Transfer',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Transfer': 'succeeded',
  };

  @override
  final Iterable<Type> types = const <Type>[TxStatus];
  @override
  final String wireName = 'TxStatus';

  @override
  Object serialize(Serializers serializers, TxStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  TxStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TxStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
