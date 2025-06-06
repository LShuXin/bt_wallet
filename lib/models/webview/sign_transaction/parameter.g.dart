// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const WebviewParameterType _$string = const WebviewParameterType._('string');
const WebviewParameterType _$ethAddress =
    const WebviewParameterType._('ethAddress');
const WebviewParameterType _$bigInt = const WebviewParameterType._('bigInt');

WebviewParameterType _$valueOf(String name) {
  switch (name) {
    case 'string':
      return _$string;
    case 'ethAddress':
      return _$ethAddress;
    case 'bigInt':
      return _$bigInt;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<WebviewParameterType> _$values =
    BuiltSet<WebviewParameterType>(const <WebviewParameterType>[
  _$string,
  _$ethAddress,
  _$bigInt,
]);

Serializer<WebviewParameterType> _$webviewParameterTypeSerializer =
    _$WebviewParameterTypeSerializer();
Serializer<WebviewParameter> _$webviewParameterSerializer =
    _$WebviewParameterSerializer();

class _$WebviewParameterTypeSerializer
    implements PrimitiveSerializer<WebviewParameterType> {
  @override
  final Iterable<Type> types = const <Type>[WebviewParameterType];
  @override
  final String wireName = 'WebviewParameterType';

  @override
  Object serialize(Serializers serializers, WebviewParameterType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  WebviewParameterType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WebviewParameterType.valueOf(serialized as String);
}

class _$WebviewParameterSerializer
    implements StructuredSerializer<WebviewParameter> {
  @override
  final Iterable<Type> types = const [WebviewParameter, _$WebviewParameter];
  @override
  final String wireName = 'WebviewParameter';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebviewParameter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(WebviewParameterType)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WebviewParameter deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebviewParameterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(WebviewParameterType))!
              as WebviewParameterType;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewParameter extends WebviewParameter {
  @override
  final WebviewParameterType type;
  @override
  final String value;

  factory _$WebviewParameter(
          [void Function(WebviewParameterBuilder)? updates]) =>
      (WebviewParameterBuilder()..update(updates))._build();

  _$WebviewParameter._({required this.type, required this.value}) : super._();
  @override
  WebviewParameter rebuild(void Function(WebviewParameterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewParameterBuilder toBuilder() =>
      WebviewParameterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewParameter &&
        type == other.type &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WebviewParameter')
          ..add('type', type)
          ..add('value', value))
        .toString();
  }
}

class WebviewParameterBuilder
    implements Builder<WebviewParameter, WebviewParameterBuilder> {
  _$WebviewParameter? _$v;

  WebviewParameterType? _type;
  WebviewParameterType? get type => _$this._type;
  set type(WebviewParameterType? type) => _$this._type = type;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  WebviewParameterBuilder();

  WebviewParameterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewParameter other) {
    _$v = other as _$WebviewParameter;
  }

  @override
  void update(void Function(WebviewParameterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebviewParameter build() => _build();

  _$WebviewParameter _build() {
    final _$result = _$v ??
        _$WebviewParameter._(
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'WebviewParameter', 'type'),
          value: BuiltValueNullFieldError.checkNotNull(
              value, r'WebviewParameter', 'value'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
