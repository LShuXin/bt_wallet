// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issuer_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IssuerResponse> _$issuerResponseSerializer =
    _$IssuerResponseSerializer();

class _$IssuerResponseSerializer
    implements StructuredSerializer<IssuerResponse> {
  @override
  final Iterable<Type> types = const [IssuerResponse, _$IssuerResponse];
  @override
  final String wireName = 'IssuerResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, IssuerResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'vc_types',
      serializers.serialize(object.vcTypes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(VcType)])),
    ];

    return result;
  }

  @override
  IssuerResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = IssuerResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'vc_types':
          result.vcTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VcType)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$IssuerResponse extends IssuerResponse {
  @override
  final int id;
  @override
  final String name;
  @override
  final BuiltList<VcType> vcTypes;

  factory _$IssuerResponse([void Function(IssuerResponseBuilder)? updates]) =>
      (IssuerResponseBuilder()..update(updates))._build();

  _$IssuerResponse._(
      {required this.id, required this.name, required this.vcTypes})
      : super._();
  @override
  IssuerResponse rebuild(void Function(IssuerResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IssuerResponseBuilder toBuilder() => IssuerResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IssuerResponse &&
        id == other.id &&
        name == other.name &&
        vcTypes == other.vcTypes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, vcTypes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IssuerResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('vcTypes', vcTypes))
        .toString();
  }
}

class IssuerResponseBuilder
    implements Builder<IssuerResponse, IssuerResponseBuilder> {
  _$IssuerResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<VcType>? _vcTypes;
  ListBuilder<VcType> get vcTypes => _$this._vcTypes ??= ListBuilder<VcType>();
  set vcTypes(ListBuilder<VcType>? vcTypes) => _$this._vcTypes = vcTypes;

  IssuerResponseBuilder();

  IssuerResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _vcTypes = $v.vcTypes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IssuerResponse other) {
    _$v = other as _$IssuerResponse;
  }

  @override
  void update(void Function(IssuerResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IssuerResponse build() => _build();

  _$IssuerResponse _build() {
    _$IssuerResponse _$result;
    try {
      _$result = _$v ??
          _$IssuerResponse._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'IssuerResponse', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'IssuerResponse', 'name'),
            vcTypes: vcTypes.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vcTypes';
        vcTypes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'IssuerResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
