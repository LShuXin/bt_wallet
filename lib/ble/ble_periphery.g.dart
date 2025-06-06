// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_periphery.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BleCentralState _$connected = const BleCentralState._('connected');
const BleCentralState _$disconnected = const BleCentralState._('disconnected');

BleCentralState _$valueOf(String name) {
  switch (name) {
    case 'connected':
      return _$connected;
    case 'disconnected':
      return _$disconnected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<BleCentralState> _$values =
    BuiltSet<BleCentralState>(const <BleCentralState>[
  _$connected,
  _$disconnected,
]);

Serializer<BleCentralState> _$bleCentralStateSerializer =
    _$BleCentralStateSerializer();

class _$BleCentralStateSerializer
    implements PrimitiveSerializer<BleCentralState> {
  @override
  final Iterable<Type> types = const <Type>[BleCentralState];
  @override
  final String wireName = 'BleCentralState';

  @override
  Object serialize(Serializers serializers, BleCentralState object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  BleCentralState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BleCentralState.valueOf(serialized as String);
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
